# home/base.nix
{ pkgs, ... }:
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Core utilities needed everywhere
    git
    hello
    ripgrep
    fd
    vim
    sops
    tmux
    gh
    procps
    killall
    diffutils
    findutils
    utillinux
    tzdata
    hostname
    man
    gnugrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
    gemini-cli
    rustc
    cargo
    pkg-config
    cmake
  ];
}
