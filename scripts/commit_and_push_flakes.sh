#!/usr/bin/env bash

set -e

TAG_NAME="alpha"
CRQ_NUMBER="016"
COMMIT_DESCRIPTION="Standardize flake.nix from template"

if [ -n "$1" ]; then
    SUBMODULE_PATHS="$1"
else
    SUBMODULE_PATHS=$(grep "github:meta-introspector" flake.nix | cut -d'/' -f2 | cut -d'/' -f1 | while read repo; do echo "vendor/nix/$repo"; done)
fi

if [ -z "$SUBMODULE_PATHS" ]; then
    echo "No meta-introspector repositories found or provided."
    exit 1
fi

echo "Found the following submodules to process: $SUBMODULE_PATHS"

for submodule_path in $SUBMODULE_PATHS; do
    repo=$(basename "$submodule_path")
    echo "--- Processing $repo at $submodule_path ---"

    # Commit the changes using the existing script
    ./scripts/commit_crq_submodule.sh "$submodule_path" "$CRQ_NUMBER" "$COMMIT_DESCRIPTION"

    # Now, tag and push
    (
        cd "$submodule_path"
        echo "Tagging and pushing..."

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
        git tag -f "$TAG_NAME"
        git push origin "$TAG_NAME" --force
    )
    echo "--- Finished $repo ---"
    echo
done

echo "All submodules have been committed, tagged, and pushed."