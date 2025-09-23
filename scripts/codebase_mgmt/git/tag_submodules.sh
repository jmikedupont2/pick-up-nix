#!/usr/bin/env bash

set -e

PROJECT_ROOT="$(pwd)"
source "${PROJECT_ROOT}/lib/lib_github_fork.sh"

# Check if gh is installed
if ! command -v gh &> /dev/null; then
    echo "GitHub CLI (gh) is not installed. Please install it to use the forking feature."
    exit 1
fi

TAG_NAME="v0.0.1-pick-up-nix"

# Extract repository names from flake.nix
REPOS=$(grep "github:meta-introspector" flake.nix | cut -d'/' -f2 | cut -d'/' -f1)

if [ -z "$REPOS" ]; then
    echo "No meta-introspector repositories found in flake.nix"
    exit 1
fi

echo "Found the following repositories to tag: $REPOS"

for repo in $REPOS; do
    submodule_path="vendor/nix/$repo"

    if [ -d "$submodule_path" ]; then
        echo "--- Processing $repo at $submodule_path ---"
        (
            cd "$submodule_path"
            echo "Current directory: $(pwd)"

            # If origin exists and is not pointing to meta-introspector, rename it to upstream
            if git remote get-url origin &>/dev/null && ! git remote get-url origin | grep -q "meta-introspector"; then
                echo "Origin is not meta-introspector. Renaming to upstream."
                git remote rename origin upstream
            fi

            # Add or update the origin remote to point to meta-introspector
            meta_introspector_url="https://github.com/meta-introspector/$repo.git"
            if git remote | grep -q "^origin$"; then
                echo "Updating origin remote URL to $meta_introspector_url"
                git remote set-url origin "$meta_introspector_url"
            else
                echo "Adding origin remote with URL $meta_introspector_url"
                git remote add origin "$meta_introspector_url"
            fi

            # Check if the meta-introspector fork exists before trying to create it
            if ! gh repo view "meta-introspector/$repo" --json name --jq . >/dev/null 2>&1; then
                echo "meta-introspector/$repo not found. Creating fork..."
                if lib_github_fork_repo "${repo}" "meta-introspector" "${repo}"; then
                    echo "Fork created successfully. Waiting 5 seconds for it to become available..."
                    sleep 5
                else
                    echo "Failed to create fork. Please check your gh permissions."
                    exit 1
                fi
            else
                echo "Fork meta-introspector/$repo already exists."
            fi

            echo "Adding tag $TAG_NAME"
            git tag -f "$TAG_NAME"

            echo "Pushing tag $TAG_NAME to origin"
            git push origin "$TAG_NAME" --force
        )
        echo "--- Finished $repo ---"
        echo
    else
        echo "Warning: Submodule path not found for $repo at $submodule_path. Skipping."
    fi
done

echo "All submodules have been tagged and pushed."