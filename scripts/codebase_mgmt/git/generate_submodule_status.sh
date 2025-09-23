#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: generate_submodule_status.sh
#
#         USAGE: ./scripts/git/generate_submodule_status.sh
#
#   DESCRIPTION: This script generates a status report of all git submodules.
#
# ==============================================================================

OUTPUT_FILE="/data/data/com.termux.nix/files/home/pick-up-nix2/index/submodules_status.txt"

echo "Generating submodule status report to $OUTPUT_FILE..."

# Run git submodule foreach and redirect output to the file
git submodule foreach --recursive 'git status' > "$OUTPUT_FILE"

echo "Submodule status report generated."