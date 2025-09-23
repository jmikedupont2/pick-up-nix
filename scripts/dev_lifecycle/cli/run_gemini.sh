#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: run_gemini.sh
#
#         USAGE: ./scripts/cli/run_gemini.sh
#
#   DESCRIPTION: This script is a wrapper to run the `gemini-cli` with `nix run`.
#                "dwim" probably means "Do What I Mean".
#
# ==============================================================================

# This script launches the Gemini CLI using the project's flake configuration.
exec nix run .#gemini-cli -- "$@"
