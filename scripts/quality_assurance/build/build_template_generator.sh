#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: build_template_generator.sh
#
#         USAGE: ./scripts/build/build_template_generator.sh
#
#   DESCRIPTION: This script builds the `template_generator_bin` crate using Nix.
#
# ==============================================================================

echo "Building template_generator_bin using Nix..."
nix build .#template-generator-bin
echo "Build complete."