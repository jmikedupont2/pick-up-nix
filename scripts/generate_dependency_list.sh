#!/usr/bin/env bash

set -euo pipefail

# This script generates a list of dependencies to update.

INPUT_FILE="index/flake_nix_urls_with_filenames.txt"
OUTPUT_FILE="index/dependency_update_list.txt"

# Read the input file and extract the dependency names
cat "$INPUT_FILE" | grep -o 'github:[^/"]\+/[^?" ]\+' | sed -e 's/\?.*//' -e 's/\.nix//' -e 's/;//' | cut -d'/' -f2 | sort -u > "$OUTPUT_FILE"

echo "Dependency list generated at: $OUTPUT_FILE"