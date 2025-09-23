#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: run_tracenix_shell.sh
#
#         USAGE: ./scripts/nix/run_tracenix_shell.sh
#
#   DESCRIPTION: This script enters a `nix-shell` and runs `tracenix` with
#                verbose logging. `tracenix` is probably a tool for tracing Nix
#                builds.
#
# ==============================================================================

set -euo pipefail

export NIX_SHOW_STATS=1
export NIX_LOG_LEVEL=debug
export NIX_DEBUG=1
export NIX_COUNT_CALLS=1

echo "Entering nix-shell and running tracenix with verbose logging..."

TEMP_LOG_FILE="/tmp/tracenix_output_$(date +%s).log"

nix-shell --verbose -v -v -v -v -v --log-format internal-json --run "bash ./run_tracenix_verbose.sh -- \"
$@\" > \"${TEMP_LOG_FILE}\" 2>&1"

EXIT_CODE=$?

echo "Exited nix-shell. Final exit code: ${EXIT_CODE}"
echo "Output redirected to: ${TEMP_LOG_FILE}"

if [ -f "${TEMP_LOG_FILE}" ]; then
    echo "--- Content of ${TEMP_LOG_FILE} ---"
    cat "${TEMP_LOG_FILE}"
    echo "------------------------------------"
    rm "${TEMP_LOG_FILE}"
fi