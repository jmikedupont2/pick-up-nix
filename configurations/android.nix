{ config, lib, pkgs, ... }:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    vim
    git
    gemini-cli
    emacs
    llvm_18
    ocaml
    coq
    ghc
    coqPackages.metacoq
    guix
    emacsPackages.vterm
    rustc
    cargo
    gauche
    guile
    sops
    tmux
    minizinc
#    python3
#    python3Packages.numpy
#    python3Packages.scipy
#    python3Packages.pandas
#    python3Packages.scikit-learn
#    python3Packages.tensorflow-lite
#    python3Packages.pytorch
    #    gcc
    gdb
    clang
    lldb
    pkg-config
    cmake
    gh
    shellcheck
    asciinema
    curl

    # Some common stuff that people expect to have
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

    # Packages from nix-env -q (non-xorg)
    

    # To include optional xorg packages, uncomment the following line:
    # (import ./optional-xorg-packages.nix { inherit pkgs; })
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  #time.timeZone = "Europe/Berlin";
}
