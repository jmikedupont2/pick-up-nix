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
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nix-on-droid, home-manager }:
    let
      linuxSystem = "x86_64-linux";
      androidSystem = "aarch64-linux";

      # Define a common set of packages for all systems
      commonPackages = pkgs: {
        hello = pkgs.hello;
        figlet = pkgs.figlet;
        gemini-cli = (import nixpkgs-unstable { system = pkgs.stdenv.system; }).gemini-cli;
      };
    in
    {
      # Expose common packages for direct use with `nix run` or `nix shell`
      packages.${linuxSystem} = commonPackages (nixpkgs.legacyPackages.${linuxSystem});
      packages.${androidSystem} = commonPackages (nixpkgs.legacyPackages.${androidSystem});

      # Packages for nix-on-droid
      nixOnDroidConfigurations = {
        android = nix-on-droid.lib.nixOnDroidConfiguration {
          pkgs = import nixpkgs {
            system = androidSystem;
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
              pkgs = nixpkgs.legacyPackages.${system};
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
