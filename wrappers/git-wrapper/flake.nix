{
  description = "A standalone Nix flake for the git-wrapper Rust crate";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11"; # Use a stable Nixpkgs channel
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        rustToolchain = pkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml;
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [
            rustToolchain
            pkgs.gix # Assuming gix is a dependency and needs to be in the devShell
          ];
          RUST_SRC_PATH = rustToolchain.rustcSource;
        };

        packages.default = pkgs.rustPlatform.buildRustPackage {
          pname = "git-wrapper";
          version = "0.1.0";
          src = ./.;
          cargoLock = {
            lockFile = ./Cargo.lock;
          };
          buildInputs = [
            pkgs.gix
          ];
        };

        apps.default = flake-utils.lib.mkApp {
          drv = self.packages.${system}.default;
        };
      });
}
