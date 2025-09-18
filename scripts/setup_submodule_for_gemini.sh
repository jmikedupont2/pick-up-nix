#!/usr/bin/env bash

set -e

SUBMODULE_PATH="$1"

if [ -z "$SUBMODULE_PATH" ]; then
  echo "Usage: $0 <submodule_path>"
  exit 1
fi

echo "Setting up submodule: $SUBMODULE_PATH"

# Navigate into the submodule directory
pushd "$SUBMODULE_PATH"

# Create task.md, docs/crq, and docs/sops
mkdir -p docs/crq docs/sops
touch task.md docs/crq/CRQ-006_nix-config-merger_edition_fix.md docs/sops/SOP_nix-config-merger_setup.md

# Specific fix for nix-config-merger: Downgrade Rust edition
if [ "$(basename "$SUBMODULE_PATH")" == "nix-config-merger" ]; then
  echo "Applying specific fix for nix-config-merger: Downgrading Rust edition in Cargo.toml"
  sed -i 's/edition = "2024"/edition = "2021"/g' Cargo.toml
  git add Cargo.toml
fi

# Add and commit changes within the submodule
git add task.md docs/crq/CRQ-006_nix-config-merger_edition_fix.md docs/sops/SOP_nix-config-merger_setup.md
git commit -m "CRQ-006: Downgrade Rust edition and add task/docs for nix-config-merger"

# Navigate back to the original directory
popd

echo "Submodule setup complete for: $SUBMODULE_PATH"
