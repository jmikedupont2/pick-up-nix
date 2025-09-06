{ pkgs ? import <nixpkgs> { } }:

{

environment.systemPackages = with pkgs; [
  emacs
  opam
  coq
  dune
  shellcheck
  tmux
  asciinema
];
}