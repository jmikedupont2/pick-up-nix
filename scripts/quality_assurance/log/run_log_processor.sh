#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: run_log_processor.sh
#
#         USAGE: ./scripts/log/run_log_processor.sh
#
#   DESCRIPTION: This script runs the `log_processor` executable with a
#                specified configuration file.
#
# ==============================================================================

# Run the log_processor executable with the path to its config.toml
/data/data/com.termux.nix/files/home/pick-up-nix/target/debug/log_processor     /data/data/com.termux.nix/files/home/pick-up-nix/memetic_code/log_processor/config.toml