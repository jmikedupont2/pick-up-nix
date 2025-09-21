{ pkgs ? import <nixpkgs> {} }:

(import ./flake.nix { inherit pkgs; }).devShells.default
