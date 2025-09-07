{
  description = "My personal Nix configurations for desktop and Android.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05"; # Stable channel
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/master";
    nix-on-droid.url = "github:nix-community/nix-on-droid/release-24.05"; # Stable channel
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nix-on-droid }:
    let
      system = "x86_64-linux"; # Assuming desktop is x86_64-linux
      androidSystem = "aarch64-linux"; # Assuming Android is aarch64-linux

      unstable-pkgs = import nixpkgs-unstable { inherit system; };
      android-unstable-pkgs = import nixpkgs-unstable { system = androidSystem; };

      desktopOverlay = self: super: {
        # Add any desktop-specific overlays here
      };

      androidOverlay = self: super: {
        gemini-cli = android-unstable-pkgs.gemini-cli;
        # Add any Android-specific overlays here
      };

      in
    {
      packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
      packages.aarch64-linux.hello = nixpkgs.legacyPackages.aarch64-linux.hello;

      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configurations/desktop.nix
            # Add any other desktop-specific modules here
          ];
          specialArgs = { inherit unstable-pkgs; };
          pkgs = import nixpkgs { inherit system; };
        };
      };

      nixOnDroidConfigurations = {
        android = nix-on-droid.lib.nixOnDroidConfiguration {
          system = androidSystem;
          pkgs = import nixpkgs {
            inherit androidSystem;
            overlays = [ androidOverlay ];
          };
          modules = [
            ./configurations/android.nix
            # Add any other Android-specific modules here
          ];
          
        };
      };
    };
}
