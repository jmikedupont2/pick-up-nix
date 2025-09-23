#!/usr/bin/env bash
# This script extracts and lists unique file extensions from files.txt.

echo "Creating directory for index files..."
mkdir -p "/data/data/com.termux.nix/files/home/pick-up-nix2/index"

echo "Extracting unique file extensions from files.txt and saving to index/extensions.txt..."
cat "/data/data/com.termux.nix/files/home/pick-up-nix2/files.txt" | \
  grep -E '\.' | \
  awk -F/ '{print $NF}' | \
  grep -oP '\.[a-zA-Z0-9]{1,5}$' | \
  cut -c2- | \
  sort -u > "/data/data/com.termux.nix/files/home/pick-up-nix2/index/extensions.txt"

echo "Unique file extensions saved to index/extensions.txt"