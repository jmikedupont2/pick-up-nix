#!/bin/bash

# This script launches the Gemini CLI, adapting to Nix-on-Droid or Linux environments.

# Check if running on Termux (Nix-on-Droid)
if [ -n "$TERMUX_VERSION" ]; then
  echo "Detected Termux (Nix-on-Droid) environment."
  # The Nix command to run gemini-cli is the same regardless of Termux or standard Linux
  NIX_GEMINI_CMD="nix run nixpkgs/master#gemini-cli"
else
  echo "Detected Linux environment."
  NIX_GEMINI_CMD="nix run nixpkgs/master#gemini-cli"
fi

# Execute the Gemini CLI with all arguments passed to dwim.sh
echo "Launching Gemini CLI with command: \"$*\""
exec $NIX_GEMINI_CMD "$@"
