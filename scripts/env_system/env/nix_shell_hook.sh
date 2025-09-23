#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: nix_shell_hook.sh
#
#         USAGE: This script is intended to be sourced as a shell hook within
#                a Nix development shell.
#
#   DESCRIPTION: This script prints the PATH and attempts to run `cargo check`.
#                It's likely used within a Nix development shell to perform
#                initial checks or setup when entering the shell.
#
# ==============================================================================

echo "Current PATH: $PATH"
echo "Contents of unstablePkgs.cargo/bin: $(ls ${unstablePkgs.cargo}/bin)"
# No need to export PATH again, it's already there from buildInputs
echo "Attempting to run cargo check..."
bash -c "cargo check"