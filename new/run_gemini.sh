#!/bin/bash
# This script will run the Gemini CLI.

echo "Starting Gemini CLI..."
nix run nixpkgs/master#gemini-cli
