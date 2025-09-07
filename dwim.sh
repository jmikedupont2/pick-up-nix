#!/bin/bash
# This script launches the Gemini CLI using the project's flake configuration.
exec nix run .#gemini-cli -- "$@"