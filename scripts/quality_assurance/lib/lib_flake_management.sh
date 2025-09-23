#!/usr/bin/env bash

# Function to ensure flake.nix exists and commit changes
# Usage: ensure_flake_and_commit <subdir> <log_file>
ensure_flake_and_commit() {
    local subdir="$1"
    local log_file="$2"

    # Define a default flake.nix template
    DEFAULT_FLAKE_NIX_CONTENT='''
{
  description = "Default flake for submodule.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs {
        system = builtins.currentSystem;
      };
    in
    {
      packages.default = pkgs.runCommand "default-submodule-package" {} "echo \"Hello from default submodule flake!\" > $out/hello";
    };
}
'''
    if [ ! -f "${subdir}/flake.nix" ]; then # Check for flake.nix in the subdir
        echo "No flake.nix found in ${subdir}. Creating a default one." | tee -a "$log_file"
        mkdir -p "${subdir}" # Ensure subdir exists
        echo "$DEFAULT_FLAKE_NIX_CONTENT" > "${subdir}/flake.nix"
        git add "${subdir}/flake.nix" || true # Add the new flake.nix, ignore if not a git repo
        git commit -m "feat: Add default flake.nix to ${subdir}" || true # Commit, ignore if no changes or not a git repo
    fi

    # Add all untracked/modified files and commit
    git add . || true
    git commit -m "chore: Auto-commit changes before Nix build" || true
}
