{ pkgs ? import <nixpkgs> { } }:

{

environment.systemPackages = with pkgs; [
  emacs
  opam
  coq
  dune
];
}