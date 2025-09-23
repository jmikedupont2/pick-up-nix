#!/usr/bin/env bash

set -e

# Source the utility libraries
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
. "${SCRIPT_DIR}/../lib/lib_submodule_utils.sh"
. "${SCRIPT_DIR}/../lib/lib_nix_build_utils.sh"
. "${SCRIPT_DIR}/../lib/lib_flake_management.sh"

# Default values
SUBDIR="09" # Default to 09 if not specified
SUBMODULE_ROOT="" # Initialize as empty, will be set by parameter

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --subdir) SUBDIR="$2"; shift ;;
        --subdir=*) SUBDIR="${1#*=}";;
        --submodule) SUBMODULE_ROOT="$2"; shift ;;
        --submodule=*) SUBMODULE_ROOT="${1#*=}";;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Check if SUBMODULE_ROOT is set
if [ -z "$SUBMODULE_ROOT" ]; then
    echo "Error: --submodule parameter is required."
    exit 1
fi

LOG_FILE="/data/data/com.termux.nix/files/home/pick-up-nix2/logs/nix_submodule_tests_$(date +%Y%m%d_%H%M%S).log"

echo "Starting Nix submodule tests at $(date) for subdir: ${SUBDIR}" | tee -a "$LOG_FILE"

# Get filtered submodule paths
SUBMODULE_PATHS=$(get_filtered_submodule_paths "${SUBMODULE_ROOT}")

if [ -z "$SUBMODULE_PATHS" ]; then
    echo "No target submodule found: ${SUBMODULE_ROOT}" | tee -a "$LOG_FILE"
    exit 1
fi

for submodule_path in $SUBMODULE_PATHS; do
    echo "Processing submodule: ${submodule_path}" | tee -a "$LOG_FILE"
    if [ -d "${submodule_path}" ]; then # Check for the submodule root directory
        (
            cd "${submodule_path}" || exit 1 # cd to the submodule root
            echo "Changed directory to $(pwd)" | tee -a "$LOG_FILE"

            # Ensure flake.nix exists and commit changes within the submodule
            ensure_flake_and_commit "${SUBDIR}" "$LOG_FILE"

            if [ -f "${SUBDIR}/flake.nix" ]; then
                run_nix_build_and_log "." ".#${SUBDIR}.packages.default" "$LOG_FILE" # Build the specific flake
            else
                echo "No flake.nix found in ${submodule_path}/${SUBDIR} even after creation attempt. Skipping build." | tee -a "$LOG_FILE"
            fi
        ) || { echo "Error processing ${submodule_path}" | tee -a "$LOG_FILE"; exit 1; }
    else
        echo "Submodule directory not found: ${submodule_path}. Skipping." | tee -a "$LOG_FILE"
    fi
done

echo "Finished Nix submodule tests at $(date)" | tee -a "$LOG_FILE"
