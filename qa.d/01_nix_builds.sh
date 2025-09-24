#!/usr/bin/env bash

# This script performs Nix builds for the 09 flake's default package.

REPORT_FILE="$1" # Report file passed as argument
TOTAL_STATUS=0

echo "Starting 09 flake default package build..." | tee -a "${REPORT_FILE}"
nix build /data/data/com.termux.nix/files/home/pick-up-nix2/source/github/meta-introspector/streamofrandom/2025/09#default 2>&1 | tee -a "${REPORT_FILE}"
FLAKE_09_BUILD_STATUS=${PIPESTATUS[0]}
if [ "${FLAKE_09_BUILD_STATUS}" -eq 0 ]; then
    echo "09 flake default package build: SUCCESS" | tee -a "${REPORT_FILE}"
else
    echo "09 flake default package build: FAILED (Exit Code: ${FLAKE_09_BUILD_STATUS})" | tee -a "${REPORT_FILE}"
    TOTAL_STATUS=$((TOTAL_STATUS + FLAKE_09_BUILD_STATUS))
fi
echo "" | tee -a "${REPORT_FILE}"

exit ${TOTAL_STATUS}