# This file contains optional Xorg-related packages.
# To include these, import this file in your main configuration (e.g., android.nix).

{ pkgs }:

with pkgs; [
  xorg-libXcomposite
  xorg-libXcursor
  xorg-libXdamage
  xorg-libXext
  xorg-libXfixes
  xorg-libXi
  xorg-libXinerama
  xorg-libXrandr
  xorg-libXrender
  xorg-libXtst
  xorg-libxcb
  xorg-libXft
  xorg-libXmu
  xorg-libXpm
  xorg-libXt
  xorg-libxkbfile
  xorg-xcb-util
  xorg-xcb-util-cursor
  xorg-xcb-util-image
  xorg-xcb-util-keysyms
  xorg-xcb-util-renderutil
  xorg-xcb-util-wm
  xorg-xkeyboard-config
]