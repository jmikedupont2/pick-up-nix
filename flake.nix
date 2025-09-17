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
    git-submodules-rs-nix = {
      url = "path:./source/github/meta-introspector/git-submodules-rs-nix";
    };
    
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nix-on-droid, home-manager, naersk, flake-utils,
              nixtract-src, nixpkgs-lint-src, streamofrandom, gemini-cli, git-submodules-rs-nix }@inputs:

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
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = overlays;
        };
      in
      {
        packages.default = (commonPackages pkgs inputs.gemini-cli) // {
          git-wrapper = pkgs.callPackage naersk {}.buildPackage {
            pname = "git-wrapper";
            version = "0.1.0";
            src = ./wrappers/git-wrapper;
            cargoLock.lockFile = ./wrappers/git-wrapper/Cargo.lock;
          };
                  report-analyzer-rs = git-submodules-rs-nix.packages.${system}.report-analyzer-rs;
        };

        defaultPackage = self.packages.${system}.default;

        # Expose configurations
        inherit nixOnDroidConfigurations homeConfigurations devShells;
      }
    );
}