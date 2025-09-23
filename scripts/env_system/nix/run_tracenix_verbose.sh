#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: run_tracenix_verbose.sh
#
#         USAGE: ./scripts/nix/run_tracenix_verbose.sh [args...]
#
#   DESCRIPTION: This script runs the `tracenix` command with verbose logging
#                using `cargo run`.
#
# ==============================================================================

set -euo pipefail

# Set RUST_LOG to enable verbose logging from Rust applications, including rstrace.
# Options: error, warn, info, debug, trace
export RUST_LOG=debug

echo "Running tracenix with RUST_LOG=${RUST_LOG} and verbose output."
printf "Command: cargo run -p pick-up-nix-cli -- tracenix -- %s\n" "$*"

# Execute the tracenix command, passing all arguments through.
cargo run -p pick-up-nix-cli -- tracenix -- "$@"

EXIT_CODE=$?

printf "\nCommand finished with exit code: %s\n" "${EXIT_CODE}"