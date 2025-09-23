#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: run_gemini_cli_pinned.sh
#
#         USAGE: ./scripts/cli/run_gemini_cli_pinned.sh
#
#   DESCRIPTION: This script runs the `gemini-cli` from a specific Nix package
#                version.
#
# ==============================================================================

nix run nixpkgs/26833ad1dad83826ef7cc52e0009ca9b7097c79f#gemini-cli "$@"
