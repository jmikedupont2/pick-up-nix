{
  description = "My personal Nix configurations for Android and various Linux systems.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/master";

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
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nix-on-droid, home-manager,
              nixtract-src, nixpkgs-lint-src }@inputs:

    let
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

      commonPackages = pkgs:
        let
          # Overlay to use a newer Rust toolchain
          rustOverlay = final: prev: {
            rustToolchain = prev.rust-bin.stable.latest.default;
          };
          pkgsWithRust = pkgs.extend rustOverlay; # Corrected line
        in
        {
          hello = pkgs.hello;
          figlet = pkgs.figlet;
          gemini-cli = pkgs.callPackage ./pkgs/gemini-cli {};
          tiktok_cli_adaptor = pkgsWithRust.callPackage ./source/github/meta-introspector/streamofrandom/livestream-tiktok-plugin/tiktok_cli_adaptor/default.nix {};

          # Vendored tools
          # Now reference the inputs directly
          nixtract = pkgs.callPackage "${nixtract-src}/default.nix" {}; # Use the input path
          nixpkgs-lint = nixpkgs-lint-src.packages.${pkgs.system}.default; # Access its default package
        };
    in
    {
      # Expose common packages for direct use with `nix run` or `nix shell`
      packages.${linuxSystem} = commonPackages (nixpkgs.legacyPackages.${linuxSystem}.extend (final: prev: { nixpkgs = prev.nixpkgs.extend (final: prev: { inherit (final) nixtract; }); }));
      packages.${androidSystem} = commonPackages (nixpkgs.legacyPackages.${androidSystem}.extend (final: prev: { nixpkgs = prev.nixpkgs.extend (final: prev: { inherit (final) nixtract; }); }));

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
    };
}