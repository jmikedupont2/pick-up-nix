{
  description = "A clean slate Nix flake for development.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/master";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
    nix-tools.url = "path:./vendor/nix";
  };

    outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils, rust-overlay, nix-tools, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            rust-overlay.overlays.default
          ];
        };
      in
      {
        packages.default = nix-tools.packages.${system}.default;

        devShells.default = (builtins.import ./nix/devshells.nix { inherit pkgs inputs; }).devShells.default;
      }
    );
}
