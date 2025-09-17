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

    naersk.url = "github:nix-community/naersk/master";
    flake-utils.url = "github:numtide/flake-utils";

    nixtract-src = {
      url = "path:/data/data/com.termux.nix/files/home/pick-up-nix/vendor/nix/nixtract";
      flake = false;
    };
    nixpkgs-lint-src = {
      url = "path:/data/data/com.termux.nix/files/home/pick-up-nix/vendor/nix/nixpkgs-lint";
      flake = false;
    };

    streamofrandom = {
      url = "path:/data/data/com.termux.nix/files/home/pick-up-nix/source/github/meta-introspector/streamofrandom";
      flake = false;
    };

    gemini-cli.url = "path:/data/data/com.termux.nix/files/home/pick-up-nix/vendor/external/gemini-cli";
    git-submodule-tools-rs = {
      url = "path:/data/data/com.termux.nix/files/home/pick-up-nix2/source/github/meta-introspector/git-submodule-tools-rs";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nix-on-droid, home-manager, naersk, flake-utils,
              nixtract-src, nixpkgs-lint-src, streamofrandom, gemini-cli, git-submodule-tools-rs }@inputs:

    let
      lib = nixpkgs.lib;
      linuxSystem = "x86_64-linux";
      androidSystem = "aarch64-linux";

      # Import overlays
      overlays = (builtins.import ./nix/overlays.nix { inherit self nixpkgs; }).overlays;

      # Import common packages
      commonPackages = (builtins.import ./nix/packages/default.nix { inherit self nixpkgs nixpkgs-unstable nixtract-src nixpkgs-lint-src streamofrandom git-submodule-tools-rs; }).commonPackages;

      # Import nix-on-droid configurations
      nixOnDroidConfigurations = (builtins.import ./nix/nix-on-droid.nix { inherit nixpkgs nix-on-droid home-manager overlays androidSystem; }).nixOnDroidConfigurations;

      # Import home configurations
      homeConfigurations = (builtins.import ./nix/home-configurations.nix { inherit nixpkgs nixpkgs-unstable home-manager overlays; }).homeConfigurations;

      # Import devShells
      devShells = (builtins.import ./nix/devshells.nix { inherit lib nixpkgs nixpkgs-unstable; }).devShells;

    in
    {
      # Expose common packages for direct use with `nix run` or `nix shell`
      packages.${linuxSystem} = (commonPackages (import nixpkgs {
        system = linuxSystem;
        overlays = overlays;
      }) inputs.gemini-cli) // {
        git-wrapper = (import nixpkgs { system = linuxSystem; }).callPackage naersk {}.buildPackage {
          pname = "git-wrapper";
          version = "0.1.0";
          src = ./wrappers/git-wrapper;
          cargoLock.lockFile = ./wrappers/git-wrapper/Cargo.lock;
        };
      };
      packages.${androidSystem} = (commonPackages (import nixpkgs {
        system = androidSystem;
        overlays = overlays;
      }) inputs.gemini-cli) // {
        git-wrapper = (import nixpkgs { system = androidSystem; }).callPackage naersk {}.buildPackage {
          pname = "git-wrapper";
          version = "0.1.0";
          src = ./wrappers/git-wrapper;
          cargoLock.lockFile = ./wrappers/git-wrapper/Cargo.lock;
        };
      };

      defaultPackage.${linuxSystem} = self.packages.${linuxSystem}.batch-task-processor;
      defaultPackage.${androidSystem} = self.packages.${androidSystem}.batch-task-processor;

      # Expose configurations
      inherit nixOnDroidConfigurations homeConfigurations devShells;
    };
}