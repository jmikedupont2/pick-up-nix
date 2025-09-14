let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/master";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
  opam
  git 
  coq
  figlet
      ((emacsPackagesFor pkgs.emacs).emacsWithPackages (
      epkgs: [
      epkgs.vterm
      epkgs.magit
      epkgs.nix-mode

      ]
    ))
  rustc
  cargo

];
}

