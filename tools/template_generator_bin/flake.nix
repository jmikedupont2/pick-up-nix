{
  description = "A Nix flake for the template_generator_bin Rust project";

  inputs = {
    nixpkgs.url = "github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify";
    flake-utils.url = "github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify";
    naersk.url = "github:meta-introspector/naersk?ref=feature/CRQ-016-nixify"; # Naersk for Rust builds
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