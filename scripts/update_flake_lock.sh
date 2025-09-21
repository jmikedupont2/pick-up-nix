#!/usr/bin/env bash

set -euo pipefail

# This script updates the flake.lock file based on the URLs in the
# index/flake_nix_urls_with_filenames.txt file.

INPUT_FILE="index/flake_nix_urls_with_filenames.txt"

# Read the input file and extract the dependency names
DEPS=$(cat "$INPUT_FILE" | grep -o 'github:[^/"]\+/[^/"]\+' | cut -d'/' -f2 | sort -u)

# Build the nix flake lock command
CMD="nix flake lock"
for dep in $DEPS; do
  CMD="$CMD --update-input $dep"
done

# Run the command
echo "Running: $CMD"
$CMD