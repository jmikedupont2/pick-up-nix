#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: build_template_generator_dev_shell.sh
#
#         USAGE: ./scripts/build/build_template_generator_dev_shell.sh
#
#   DESCRIPTION: This script builds the `template_generator_bin` crate within a
#                Nix development shell.
#
# ==============================================================================

echo "Building template_generator_bin within a Nix development shell..."
nix develop --command bash -c "cargo build --release -p template_generator_bin"
echo "Build command executed."