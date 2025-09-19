#!/usr/bin/env bash

set -e

# This script runs the nixify.sh script on all the Nix-related submodules in vendor/nix.
# It runs in dry-run mode by default. Pass --apply to actually make changes.

APPLY_FLAG=""
if [ "$1" == "--apply" ]; then
  APPLY_FLAG="--apply"
fi

# Extract repository names from flake.nix
REPOS=$(grep "github:meta-introspector" flake.nix | cut -d'/' -f2 | cut -d'/' -f1)

if [ -z "$REPOS" ]; then
    echo "No meta-introspector repositories found in flake.nix"
    exit 1
fi

echo "Found the following repositories to nixify: $REPOS"

for repo in $REPOS; do
    submodule_path="vendor/nix/$repo"
    echo "--- Processing $submodule_path ---"
    ./scripts/nixify.sh "$submodule_path" $APPLY_FLAG
    echo "--- Finished $submodule_path ---"
    echo
done

echo "All submodules in vendor/nix have been processed."