#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(dirname "$(dirname "$(realpath "$0")")")"
source "${PROJECT_ROOT}/lib/lib_github_fork.sh"

# This script vendorizes a GitHub repository as a Git submodule
# and checks out a specific branch.

ORIGINAL_REPO_URL="$1"
SUBMODULE_PATH="$2"
FORK_NAME="$3" # New argument for the forked repository name
TARGET_BRANCH="feature/CRQ-016-nixify"
META_INTROSPECTOR_ORG="meta-introspector"

if [ -z "$ORIGINAL_REPO_URL" ] || [ -z "$SUBMODULE_PATH" ]; then
    echo "Usage: $0 <original_repo_url> <submodule_path> [fork_name]"
    echo "Example: $0 github:numtide/flake-utils vendor/nix/flake-utils flake-utils-fork"
    exit 1
fi

echo "Vendorizing $ORIGINAL_REPO_URL to $SUBMODULE_PATH"

if [[ "$ORIGINAL_REPO_URL" =~ ^github:([^/]+)/([^/]+)$ ]]; then
    HTTPS_REPO_URL="https://github.com/${BASH_REMATCH[1]}/${BASH_REMATCH[2]}.git"
    ORIGINAL_REPO_BASENAME="${BASH_REMATCH[2]}"
else
    HTTPS_REPO_URL="$ORIGINAL_REPO_URL"
    ORIGINAL_REPO_BASENAME=$(basename "$ORIGINAL_REPO_URL" .git)
fi

# Determine the name of the forked repository
FORKED_REPO_NAME="${FORK_NAME:-$ORIGINAL_REPO_BASENAME}"

# Check if submodule already exists
if [ -d "$SUBMODULE_PATH" ]; then
    echo "Submodule $SUBMODULE_PATH already exists. Updating it."
    (cd "$SUBMODULE_PATH" && git pull origin "$TARGET_BRANCH") || \
    (cd "$SUBMODULE_PATH" && git fetch origin && git checkout "$TARGET_BRANCH" && git pull origin "$TARGET_BRANCH")
else
    echo "Adding submodule $SUBMODULE_PATH from $HTTPS_REPO_URL"
    git submodule add "$HTTPS_REPO_URL" "$SUBMODULE_PATH"
fi


# Navigate into the submodule
(
    cd "$SUBMODULE_PATH" || exit 1

    # Ensure the meta-introspector remote exists and is correct
    META_INTROSPECTOR_REMOTE_URL="https://github.com/${META_INTROSPECTOR_ORG}/${FORKED_REPO_NAME}.git"
    if git remote | grep -q "^${META_INTROSPECTOR_ORG}"$; then
        echo "Remote '${META_INTROSPECTOR_ORG}' already exists. Setting URL."
        git remote set-url "${META_INTROSPECTOR_ORG}" "$META_INTROSPECTOR_REMOTE_URL"
    else
        echo "Adding remote '${META_INTROSPECTOR_ORG}' with URL $META_INTROSPECTOR_REMOTE_URL"
        git remote add "${META_INTROSPECTOR_ORG}" "$META_INTROSPECTOR_REMOTE_URL"
    fi

    # Attempt to fork the repository if it doesn't exist in the meta-introspector organization
    if ! gh repo view "${META_INTROSPECTOR_ORG}/${FORKED_REPO_NAME}" &>/dev/null; then
        echo "Forking ${ORIGINAL_REPO_URL} to ${META_INTROSPECTOR_ORG}/${FORKED_REPO_NAME}..."
        lib_github_fork_repo "${ORIGINAL_REPO_URL}" "${META_INTROSPECTOR_ORG}" "${FORKED_REPO_NAME}"
        if [ $? -ne 0 ]; then
            echo "Error: Failed to fork repository. Please ensure gh CLI is authenticated and has permissions."
            exit 1
        fi
    fi

    # Fetch the target branch from the meta-introspector remote
    echo "Fetching branch '$TARGET_BRANCH' from '${META_INTROSPECTOR_ORG}'"
    git fetch "${META_INTROSPECTOR_ORG}" "$TARGET_BRANCH"

    # Fetch the default branch (assuming 'main' or 'master')
    git fetch "${META_INTROSPECTOR_ORG}" main || git fetch "${META_INTROSPECTOR_ORG}" master

    # Check out or create the target branch
    if git rev-parse --verify --quiet "$TARGET_BRANCH" >/dev/null; then
        echo "Branch '$TARGET_BRANCH' already exists locally. Checking it out."
        git checkout "$TARGET_BRANCH"
    else
        echo "Branch '$TARGET_BRANCH' does not exist locally. Creating it from default branch."
        # Try to create from 'main', fallback to 'master'
        if git rev-parse --verify --quiet "${META_INTROSPECTOR_ORG}/main" >/dev/null; then
            git checkout -b "$TARGET_BRANCH" "${META_INTROSPECTOR_ORG}/main"
        elif git rev-parse --verify --quiet "${META_INTROSPECTOR_ORG}/master" >/dev/null; then
            git checkout -b "$TARGET_BRANCH" "${META_INTROSPECTOR_ORG}/master"
        else
            echo "Error: Neither 'main' nor 'master' branch found in '${META_INTROSPECTOR_ORG}' remote. Cannot create branch."
            exit 1
        fi
    fi

    # Push to the meta-introspector remote
    echo "Pushing branch '$TARGET_BRANCH' to '${META_INTROSPECTOR_ORG}'"
    git push -u "${META_INTROSPECTOR_ORG}" "$TARGET_BRANCH"

)

echo "Finished vendorizing and forking $SUBMODULE_PATH."

