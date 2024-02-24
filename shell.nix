slet
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
  opam
  git 
  coq
      ((emacsPackagesFor pkgs.emacs).emacsWithPackages (
      epkgs: [
      epkgs.vterm
      epkgs.magit
      epkgs.nix-mode

      ]
    ))

];
}

