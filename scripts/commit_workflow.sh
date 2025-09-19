#!/usr/bin/env bash

set -e

# --- Configuration ---
BRANCH_NAME="feature/CRQ-016-nixify-workflow"
COMMIT_MESSAGE_FILE=".git_commit_message.txt"
COMMIT_MESSAGE_CONTENT="feat(dev-workflow): Create scripts and SOP for submodule nixification

This commit introduces a new, robust workflow for standardizing the Nix environments of the project's submodules.

Key additions:
- A new SOP and CRQ (CRQ-016) to document the submodule nixification process.
- A `flake.template` file to serve as the standard `flake.nix` for all submodules.
- A set of new scripts to automate the process of updating, committing, and pushing the submodule flakes.
- The root `flake.nix` has been updated to point to the new branches that will be created by this workflow.

This new workflow is designed to be robust, repeatable, and to solve the `nix develop` errors that were caused by inconsistent and broken `flake.nix` files in the submodules."

# --- 1. Create Branch ---
echo "--- Creating new branch: $BRANCH_NAME ---"
git checkout -b "$BRANCH_NAME"

# --- 2. Stage Files ---
echo "--- Staging all new and modified files ---"
git add .

# --- 3. Create Commit Message File ---
echo "--- Creating commit message file ---"
echo "$COMMIT_MESSAGE_CONTENT" > "$COMMIT_MESSAGE_FILE"

# --- 4. Commit ---
echo "--- Committing changes ---"
git commit -F "$COMMIT_MESSAGE_FILE"

echo "--- Commit successful! ---"
