{
  description = "My personal Nix configurations for Android and various Linux systems.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/master";

    rust-toolchain = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
      inputs.nixpkgs.follows = "nixpkgs-unstable"; # Ensure it uses the same unstable nixpkgs
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NEW: Add vendored tools as local inputs
    nixtract-src = {
      url = "path:/data/data/com.termux.nix/files/home/pick-up-nix/vendor/nix/nixtract"; # Absolute path to the submodule
      flake = false; # Not a flake itself, just a source
    };
    nixpkgs-lint-src = {
      url = "git+file:///data/data/com.termux.nix/files/home/pick-up-nix/vendor/nix/nixpkgs-lint"; # Explicitly a local Git repo
      # flake = false; # REMOVE THIS LINE (it's a flake)
    };

    streamofrandom = {
      url = "path:/data/data/com.termux.nix/files/home/pick-up-nix/source/github/meta-introspector/streamofrandom";
      flake = false;
    };

    gemini-cli.url = "path:/data/data/com.termux.nix/files/home/pick-up-nix/vendor/external/gemini-cli";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nix-on-droid, home-manager,
              nixtract-src, nixpkgs-lint-src, streamofrandom, rust-toolchain, gemini-cli }@inputs:

    let
      lib = nixpkgs.lib;
      linuxSystem = "x86_64-linux";
      androidSystem = "aarch64-linux";

      # Define a common set of packages for all systems
      # Overlays
      overlays = [
        (final: prev: {
          nixtract = prev.nixtract.overrideAttrs (old: {
            buildInputs = (old.buildInputs or []) ++ [ prev.openssl ];
          });
        })
      ];

      commonPackages = pkgs: geminiCliSrc:
        {
          hello = pkgs.hello;
          figlet = pkgs.figlet;
          which = pkgs.which;
          gemini-cli = pkgs.callPackage ./pkgs/gemini-cli { inherit geminiCliSrc; };
          tiktok_cli_adaptor = pkgs.callPackage "${streamofrandom}/livestream-tiktok-plugin/tiktok_cli_adaptor/default.nix" {};

          # Vendored tools
          # Now reference the inputs directly
          nixtract = pkgs.callPackage "${nixtract-src}/default.nix" {}; # Use the input path
          nixpkgs-lint = nixpkgs-lint-src.packages.${pkgs.system}.default; # Access its default package

          # Gemini Interaction package
          gemini-interaction = pkgs.callPackage ./pkgs/gemini-interaction { geminiCli = self.packages.${pkgs.system}.gemini-cli; };
        };
    in
    {
      # Expose common packages for direct use with `nix run` or `nix shell`
      packages.${linuxSystem} = commonPackages (import nixpkgs {
        system = linuxSystem;
        overlays = [
          (final: prev: {
            nixtract = prev.nixtract.overrideAttrs (old: {
              buildInputs = (old.buildInputs or []) ++ [ prev.openssl ];
            });
          })
          (final: prev: {
            rustToolchain = inputs.nixpkgs-unstable.legacyPackages.${linuxSystem}.rust-bin.stable.latest.default;
          })
        ];
      }) inputs.gemini-cli;
      packages.${androidSystem} = commonPackages (import nixpkgs {
        system = androidSystem;
        overlays = [
          (final: prev: {
            nixtract = prev.nixtract.overrideAttrs (old: {
              buildInputs = (old.buildInputs or []) ++ [ prev.openssl ];
            });
          })
          (final: prev: {
            rustToolchain = inputs.nixpkgs-unstable.legacyPackages.${androidSystem}.rust-bin.stable.latest.default;
          })
        ];
      }) inputs.gemini-cli;

      defaultPackage.${linuxSystem} = self.packages.${linuxSystem}.gemini-cli;
      defaultPackage.${androidSystem} = self.packages.${androidSystem}.gemini-cli;

      # Packages for nix-on-droid
      nixOnDroidConfigurations = {
        android = nix-on-droid.lib.nixOnDroidConfiguration {
          pkgs = import nixpkgs {
            system = androidSystem;
            overlays = overlays; # Apply the overlay here
            # The overlay is no longer needed, gemini-cli is in packages
          };
          modules = [
            ./configurations/android.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.user = {
                imports = [
                  ./.config/home-manager/home.nix
                  ./home/base.nix
                  ./home/emacs.nix
                ];
                # Add gemini-cli to home packages for android
                home.packages = [ self.packages.${androidSystem}.gemini-cli ];
              };
            }
          ];
        };
      };

      # Packages for other Linux systems (Ubuntu, GitHub Actions)
      homeConfigurations = 
        let
          # A helper function to generate home-manager configs for a given system
          mkSystemHomes = system:
            let
              pkgs = import nixpkgs {
                system = system;
                overlays = overlays; # Apply the overlay here
              };
              # A helper function to generate a home-manager configuration
              mkHome = modules: home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                extraSpecialArgs = { inherit nixpkgs-unstable; };
                # NOTE: This assumes your username is 'user'
                modules = [
                  { home.username = "user"; home.homeDirectory = "/home/user"; }
                  ./.config/home-manager/home.nix
                ] ++ modules;
              };
            in
            {
              "github-runner" = mkHome [ ./home/base.nix ];
              "linux-dev" = mkHome [ ./home/base.nix ./home/emacs.nix ];
              "linux-sci" = mkHome [ ./home/base.nix ./home/emacs.nix ./home/scientific.nix ];
            };
        in
        {
          "x86_64-linux" = mkSystemHomes "x86_64-linux";
          "aarch64-linux" = mkSystemHomes "aarch64-linux";
        };

      devShells = lib.genAttrs lib.systems.flakeExposed (system: {
        default = let
          pkgs = import nixpkgs { inherit system; };
          rustPkgs = import rust-toolchain { inherit system; }; # Import rust-toolchain
        in
        pkgs.mkShell {
          buildInputs = [
            (rustPkgs.rust-bin.stable.latest.default.override {
              extensions = [ "rust-src" "rust-analyzer" ];
            })
            pkgs.cargo
          ];
          RUST_SRC_PATH = "${rustPkgs.rust-bin.stable.latest.default.src}/lib/rustlib/src/rust/library}";
        };
      });
    };
}
