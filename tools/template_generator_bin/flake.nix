{
  description = "A Nix flake for the template_generator_bin Rust project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
    naersk.url = "github:nix-community/naersk/master"; # Naersk for Rust builds
  };

  outputs = { self, nixpkgs, flake-utils, naersk }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        naersk-lib = naersk.lib.${system};
      in
      {
        packages.default = naersk-lib.buildPackage {
          src = ./.; # The source of the Rust project is the current directory
          pname = "template-generator-bin";
          version = "0.1.0"; # Match your Cargo.toml version
          cargoLock = ./Cargo.lock; # Explicitly tell naersk where to find Cargo.lock
          workspaceRoot = ../..; # Explicitly tell naersk the workspace root
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            pkgs.rustc
            pkgs.cargo
            pkgs.rustfmt
            pkgs.clippy
          ];
        };
      }
    );
}