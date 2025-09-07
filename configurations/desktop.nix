{ pkgs, unstable-pkgs, ... }:

{

environment.systemPackages = with pkgs; [
  emacs
  opam
  coq
  dune
  shellcheck
  tmux
  asciinema
] ++ (with unstable-pkgs; [
  # Add unstable packages here if needed
]);
}