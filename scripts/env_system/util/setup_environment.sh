#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: setup_environment.sh
#
#         USAGE: source ./scripts/util/setup_environment.sh
#
#   DESCRIPTION: This script sets up common environment variables for the project.
#
# ==============================================================================

# Example environment variables (customize as needed)
export PROJECT_NAME="pick-up-nix2"
export PROJECT_ROOT="$(dirname "$(dirname "$(readlink -f "$0")")")"
export PATH="$PROJECT_ROOT/bin:$PATH"

# Add any other global environment variables here

