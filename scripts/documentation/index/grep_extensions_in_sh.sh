#!/usr/bin/env bash
# This script greps for each term in index/extensions.txt within all .sh files.

echo "Creating directory for grep results..."
mkdir -p "/data/data/com.termux.nix/files/home/pick-up-nix2/index/grep_results"

echo "Starting grep search for each extension in .sh files..."
while IFS= read -r term; do
  if [[ -n "$term" ]]; then # Ensure term is not empty
    echo "Searching for term: $term"
    grep -r "$term" "/data/data/com.termux.nix/files/home/pick-up-nix2/" --include="*.sh" > "/data/data/com.termux.nix/files/home/pick-up-nix2/index/grep_results/${term}.txt"
  fi
done < "/data/data/com.termux.nix/files/home/pick-up-nix2/index/extensions.txt"

echo "Grep search complete. Results are in index/grep_results/."
