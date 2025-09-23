#!/usr/bin/env bash
# This script splits files.txt into chunks based on unique file extensions.

echo "Creating directory for file chunks..."
mkdir -p "/data/data/com.termux.nix/files/home/pick-up-nix2/index/chunks"

echo "Splitting files.txt by extension..."
while IFS= read -r extension; do
  if [[ -n "$extension" ]]; then # Ensure extension is not empty
    echo "Processing extension: $extension"
    grep -E "\.$extension$" "/data/data/com.termux.nix/files/home/pick-up-nix2/files.txt" > "/data/data/com.termux.nix/files/home/pick-up-nix2/index/chunks/$extension.txt"
  fi
done < "/data/data/com.termux.nix/files/home/pick-up-nix2/index/extensions.txt"

echo "File splitting complete. Chunks are in index/chunks/."
