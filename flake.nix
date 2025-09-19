{
  description = "A clean slate Nix flake for development.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/master";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
    nix-tools.url = "path:./vendor/nix";
    git-hooks.url = "github:cachix/git-hooks.nix";
    statix.url = "github:nerdypepper/statix";
  };

    outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils, rust-overlay, nix-tools, git-hooks, statix, ... }@inputs:
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

        devShells.default = pkgs.mkShell {
          inherit (git-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              statix.enable = true;
            };
          }) shellHook;
          buildInputs = with pkgs; [
            statix
          ];
        };
      }
    );
}
