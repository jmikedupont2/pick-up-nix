#!/bin/bash

set -euo pipefail

# Set RUST_LOG to enable verbose logging from Rust applications, including rstrace.
# Options: error, warn, info, debug, trace
export RUST_LOG=debug

echo "Running tracenix with RUST_LOG=${RUST_LOG} and verbose output."
echo "Command: cargo run -p pick-up-nix-cli -- tracenix -- $@"

# Execute the tracenix command, passing all arguments through.
cargo run -p pick-up-nix-cli -- tracenix -- "$@"

EXIT_CODE=$?

echo "\nCommand finished with exit code: ${EXIT_CODE}"
