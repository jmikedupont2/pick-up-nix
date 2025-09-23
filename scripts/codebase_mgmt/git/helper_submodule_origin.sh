#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: helper_submodule_origin.sh
#
#         USAGE: ./scripts/git/helper_submodule_origin.sh <submodule_path> <repo_name> <new_origin_url>
#
#   DESCRIPTION: This script is a helper function for managing git submodules.
#                It renames the `origin` remote to `upstream` and adds a new
#                `origin`.
#
# ==============================================================================

source "$(dirname "$0")"/scripts/lib_git_submodule.sh

submodule_path="$1"
repo_name="$2"
new_origin_url="$3"

echo "Processing submodule: $submodule_path"
cd "$submodule_path" || exit
current_origin_url=$(git remote get-url origin 2>/dev/null)
if [[ "$current_origin_url" != *"meta-introspector"* ]]; then
    echo "  Submodule is not from meta-introspector. Renaming origin to upstream and adding new origin."
    if git remote get-url origin &>/dev/null; then
        git remote rename origin upstream
    fi
    git remote add origin "$new_origin_url"
    echo "Attempting to fetch from new origin..."
    if git_fetch_origin; then
        echo "  Fetch from new origin successful."
    else
        echo "  Fetch from new origin failed. Attempting to fork..."
        if command_exists gh;
        then
            ensure_meta_introspector_remote_and_fork "$repo_name"
            echo "# After forking, you might need to run git fetch origin again manually."
        else
            echo "gh CLI not found. Please install and authenticate gh, then manually fork $new_origin_url to meta-introspector."
        fi
    fi
else
    echo "  Submodule is already from meta-introspector. Skipping remote changes." # This line will not be echoed in the actual script output
fi
git_add_all
git_commit_message "chore: Update submodule remotes" || true
cd - || exit