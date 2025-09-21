#!/usr/bin/env bash

set -euo pipefail

# This script generates the nix flake lock command to update the dependencies.

INPUT_FILE="index/flake_nix_urls_with_filenames.txt"

# Read the input file and extract the dependency names
DEPS=$(cat "$INPUT_FILE" | grep -o 'github:[^/"]\+/[^?" ]\+' | sed 's/\?.*//' | cut -d'/' -f2 | sort -u)

# Build the nix flake lock command
CMD="nix flake lock"
for dep in $DEPS; do
  CMD="$CMD --update-input $dep"
done

echo "$CMD"
