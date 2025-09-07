# home/emacs.nix
{ pkgs, ... }:
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Standalone Emacs package
    emacs
    emacsPackages.vterm
  ];
}
