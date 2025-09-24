#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="/data/data/com.termux.nix/files/home/nix/vendor/nix/nix-nar-rs"
COMMIT_MESSAGE="feat: Update nix-nar-rs flake to use meta-introspector forks and fix build"
TAG_NAME="nix-nar-rs-meta-introspector-fork-$(date +%Y%m%d%H%M%S)"

echo "Changing directory to $REPO_DIR"
cd "$REPO_DIR"

echo "Adding flake.nix and flake.lock"
git add flake.nix flake.lock

echo "Committing changes with message: \"$COMMIT_MESSAGE\""
git commit -m "$COMMIT_MESSAGE"

echo "Creating tag: $TAG_NAME"
git tag "$TAG_NAME"

echo "Pushing commit and tag to origin"
git push origin HEAD "$TAG_NAME"

echo "Successfully committed and tagged nix-nar-rs."
