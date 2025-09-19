#!/usr/bin/env bash

set -e

# --- Configuration ---
BRANCH_NAME="feature/CRQ-016-nixify"
CRQ_NUMBER="016"
COMMIT_DESCRIPTION="Standardize flake.nix from template"
TEMPLATE_FILE="scripts/flake.template"

# --- gh check ---
if ! command -v gh &> /dev/null; then
    echo "GitHub CLI (gh) is not installed." >&2
    exit 1
fi

# --- Template check ---
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: Template file not found at $TEMPLATE_FILE" >&2
    exit 1
fi
FLAKE_TEMPLATE=$(cat "$TEMPLATE_FILE")

# --- Get Submodules ---
REPOS=$(grep "github:meta-introspector" flake.nix | cut -d'/' -f2 | cut -d'/' -f1)
if [ -z "$REPOS" ]; then
    echo "No meta-introspector repositories found in flake.nix" >&2
    exit 1
fi

echo "Found the following repositories to process: $REPOS"

# --- Main Loop ---
for repo in $REPOS; do
    submodule_path="vendor/nix/$repo"
    echo "--- Processing $repo at $submodule_path ---"

    if [ ! -d "$submodule_path" ]; then
        echo "Warning: Submodule path not found at $submodule_path. Skipping."
        continue
    fi

    # --- 1. Nixify ---
    FLAKE_FILE="$submodule_path/flake.nix"
    if [ -f "$FLAKE_FILE" ]; then
        echo "Backing up existing flake.nix to $FLAKE_FILE.bak"
        mv "$FLAKE_FILE" "$FLAKE_FILE.bak"
    fi
    echo "Creating new flake.nix from template."
    echo "$FLAKE_TEMPLATE" > "$FLAKE_FILE"

    # --- 2. Git Operations ---
    (
        cd "$submodule_path"

        # --- Create and switch to new branch ---
        echo "Creating and switching to new branch: $BRANCH_NAME"
        git checkout -b "$BRANCH_NAME"

        # --- Commit ---
        echo "Staging and committing flake.nix"
        git add flake.nix
        COMMIT_MESSAGE="feat(flake): CRQ-${CRQ_NUMBER} - ${COMMIT_DESCRIPTION}"
        # Use --no-verify (-n) to bypass any pre-commit hooks
        git commit -n -m "$COMMIT_MESSAGE"

        # --- Handle Remotes and Forking ---
        if git remote get-url origin &>/dev/null && ! git remote get-url origin | grep -q "meta-introspector"; then
            echo "Renaming origin to upstream."
            git remote rename origin upstream
        fi
        meta_introspector_url="https://github.com/meta-introspector/$repo.git"
        if git remote | grep -q "^origin$"; then
            git remote set-url origin "$meta_introspector_url"
        else
            git remote add origin "$meta_introspector_url"
        fi
        if ! gh repo view "meta-introspector/$repo" --json name --jq . >/dev/null 2>&1; then
            echo "Creating fork..."
            if gh repo fork --org meta-introspector --remote; then
                sleep 5
            else
                exit 1
            fi
        fi

        # --- Push ---
        echo "Pushing branch $BRANCH_NAME to origin"
        git push -u origin "$BRANCH_NAME"

    )
    echo "--- Finished $repo ---"
    echo
done

echo "All submodules have been branched and pushed."
