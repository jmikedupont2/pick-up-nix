# home/scientific.nix
{ pkgs, ... }:
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Scientific and language toolchains that are slow to build
    coq
    opam
    dune
    haskell-packages.ghc
    llvm_18
    ocaml
    coqPackages.metacoq
    guix
    gauche
    guile
    minizinc
    gdb
    clang
    lldb
  ];
}
