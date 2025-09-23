{ pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ./flake.nix {}
