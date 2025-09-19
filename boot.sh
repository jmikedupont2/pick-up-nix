#!/usr/bin/env bash

# This script is used to boot the development environment.
# It is designed to be sourced by other scripts or run directly.

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# --- Dependency Checks ---

# Check for direnv
if ! command -v direnv &> /dev/null; then
    echo "direnv not found in PATH. Attempting to enter Nix development shell to provide it." >&2
    # Check for nix
    if ! command -v nix &> /dev/null; then
        echo "Error: Nix is not installed or not in PATH. Cannot provide direnv via Nix development shell." >&2
        echo "Please install direnv or Nix to proceed." >&2
        exit 1
    fi
    # Enter nix develop and re-execute this script
    echo "Entering Nix development environment to provide direnv..."
    exec nix develop "${SCRIPT_DIR}" --command bash -c "${BASH_SOURCE[0]}"
fi

# Check for nix (optional, if nix develop/nix-shell are intended to be used)
if ! command -v nix &> /dev/null; then
    echo "Warning: Nix is not installed or not in PATH. Nix-related commands will not work." >&2
    # Do not exit, as direnv and gemini_cli.sh might still function without Nix.
fi

# --- Environment Setup ---

# Allow direnv to load the environment variables from .envrc in the script's directory
# This ensures direnv is always applied to the correct project root.
direnv allow "${SCRIPT_DIR}"

# Execute the gemini_cli.sh script within the direnv environment
# Use the script's directory to find gemini_cli.sh
if [ -f "${SCRIPT_DIR}/gemini_cli.sh" ]; then
    echo "Starting gemini_cli.sh..."
    direnv exec "${SCRIPT_DIR}" "${SCRIPT_DIR}/gemini_cli.sh"
else
    echo "Error: gemini_cli.sh not found at ${SCRIPT_DIR}/gemini_cli.sh" >&2
    exit 1
fi

# --- Nix Development Environment (Optional) ---
# If you intend to use a Nix development environment, uncomment one of the following:

# Option 1: Use nix develop (recommended for flakes)
# echo "Entering Nix development environment with 'nix develop'..."
# nix develop "${SCRIPT_DIR}" --command bash -c "echo 'Exited Nix development environment.'"

# Option 2: Use nix-shell (for legacy or non-flake projects)
# echo "Entering Nix shell environment with 'nix-shell'..."
# nix-shell "${SCRIPT_DIR}" --command bash -c "echo 'Exited Nix shell environment.'"

# Note: If you use nix develop or nix-shell, the direnv exec command above might not be necessary
# as the Nix environment itself might set up the necessary paths and dependencies.
# Consider your workflow and uncomment only one option if needed.
