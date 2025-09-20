#!/usr/bin/env bash

set -e

# TAG_NAME is skipped for now as per user request
CRQ_NUMBER="016"
COMMIT_DESCRIPTION="Standardize flake.nix from template"
BRANCH_NAME="feature/CRQ-016-nixify-workflow" # Ensure this matches the current branch

if [ -n "$1" ]; then
    SUBMODULE_PATHS="$1"
else
    # Discover submodules by finding flake.nix files in vendor/nix subdirectories
    SUBMODULE_PATHS=$(find vendor/nix -mindepth 2 -maxdepth 2 -type f -name "flake.nix" -print0 | xargs -0 -n1 dirname)
fi

if [ -z "$SUBMODULE_PATHS" ]; then
    echo "No meta-introspector repositories found or provided."
    exit 1
fi

echo "Found the following submodules to process: $SUBMODULE_PATHS"

for submodule_path in $SUBMODULE_PATHS; do
    repo=$(basename "$submodule_path")
    echo "--- Processing $repo at $submodule_path ---"

    # Ensure the correct branch is checked out
    (
        cd "$submodule_path"
        if git rev-parse --verify "$BRANCH_NAME" &>/dev/null; then
            echo "Branch $BRANCH_NAME already exists. Checking it out."
            git checkout "$BRANCH_NAME"
        else
            echo "Branch $BRANCH_NAME does not exist. Creating and checking it out."
            git checkout -b "$BRANCH_NAME"
        fi
    )

    # Commit the changes using the existing script
    ./scripts/commit_crq_submodule.sh "$submodule_path" "$CRQ_NUMBER" "$COMMIT_DESCRIPTION"

    # Now, push (tagging is skipped as per user request)
    (
        cd "$submodule_path"
        echo "Pushing changes..."

        # The remote handling logic is still needed here
        if git remote get-url origin &>/dev/null && ! git remote get-url origin | grep -q "meta-introspector"; then
            git remote rename origin upstream
        fi
        meta_introspector_url="https://github.com/meta-introspector/$repo.git"
        if git remote | grep -q "^origin$"; then
            git remote set-url origin "$meta_introspector_url"
        else
            git remote add origin "$meta_introspector_url"
        fi
        if ! gh repo view "meta-introspector/$repo" --json name --jq . >/dev/null 2>&1; then
            if gh repo fork --org meta-introspector --remote; then
                sleep 5
            else
                exit 1
            fi
        fi

        git push origin HEAD
        # git tag -f "$TAG_NAME" # Tagging skipped
        # git push origin "$TAG_NAME" --force # Tagging skipped
    )
    echo "--- Finished $repo ---"
    echo
done

echo "All submodules have been committed and pushed."