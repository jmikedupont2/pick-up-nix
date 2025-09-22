#!/usr/bin/env bash

# test_boot.sh for DataFunctorNix experiment

# This script runs the experiment's boot.sh within a nix develop shell
# and captures all output to a log file.

EXPERIMENT_DIR="$(dirname "$0")" # Directory of this script
LOG_FILE="${EXPERIMENT_DIR}/test_boot_output.log"

echo "Running boot.sh for DataFunctorNix experiment and capturing output to ${LOG_FILE}"

# Enter nix develop shell and run boot.sh, capturing all output
nix develop "${EXPERIMENT_DIR}" --command bash -c "
    echo 'Entering nix develop shell for DataFunctorNix experiment...'
    bash ${EXPERIMENT_DIR}/boot.sh
" 2>&1 | tee "${LOG_FILE}"

echo "Test complete. Output captured in ${LOG_FILE}"
