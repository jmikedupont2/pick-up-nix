#!/bin/bash
# This script will apply your Nix-on-Droid configuration and install the packages you have defined.

echo "Applying Nix-on-Droid configuration..."
nix-on-droid -v -v -v -v switch -v -v -v --flake ~/.config/nix-on-droid

echo "Done."
