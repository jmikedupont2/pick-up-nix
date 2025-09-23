#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: commit_submodule_file.sh
#
#         USAGE: ./scripts/git/commit_submodule_file.sh
#
#   DESCRIPTION: This script commits a specific file
#                (`scripts/setup_gemini_context.sh`) within a submodule
#                (`vendor/nix/nix-config-merger`). It seems to be a temporary
#                script used for a specific CRQ.
#
# ==============================================================================

set -e

SUBMODULE_DIR="vendor/nix/nix-config-merger"

pushd "$SUBMODULE_DIR"

git add scripts/setup_gemini_context.sh
git commit -m "CRQ-010: Add setup_gemini_context.sh script"

popd