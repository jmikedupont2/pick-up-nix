#!/usr/bin/env bash

set -e

SUBMODULE_DIR="vendor/nix/nix-config-merger"

pushd "$SUBMODULE_DIR"

git add scripts/setup_gemini_context.sh
git commit -m "CRQ-010: Add setup_gemini_context.sh script"

popd
