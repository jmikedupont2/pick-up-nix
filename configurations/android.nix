{ config, lib, pkgs, ... }:

{
  environment.packages = with pkgs; [
    hello
  ];

  system.stateVersion = "24.05";
}