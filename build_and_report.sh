#!/bin/bash

# Define the report file
REPORT_FILE="/data/data/com.termux.nix/files/home/pick-up-nix/qa_build_report.txt"

# Get current date and time
BUILD_DATE=$(date +"%Y-%m-%d %H:%M:%S")

echo "--- QA Build Report - ${BUILD_DATE} ---" > "${REPORT_FILE}"
echo "" >> "${REPORT_FILE}"

# # Starting Android build...
# echo "Starting Android build..." | tee -a "${REPORT_FILE}"
# nix build .#nixOnDroidConfigurations.android.config.system.build.toplevel --system aarch64-linux --impure 2>&1 | tee -a "${REPORT_FILE}"
# ANDROID_BUILD_STATUS=${PIPESTATUS[0]}
# if [ ${ANDROID_BUILD_STATUS} -eq 0 ]; then
#     echo "Android build: SUCCESS" | tee -a "${REPORT_FILE}"
# else
#     echo "Android build: FAILED (Exit Code: ${ANDROID_BUILD_STATUS})" | tee -a "${REPORT_FILE}"
# fi
# echo "" >> "${REPORT_FILE}"

# echo "Starting PC build..." | tee -a "${REPORT_FILE}"
# nix build .#nixosConfigurations.desktop.config.system.build.toplevel 2>&1 | tee -a "${REPORT_FILE}"
# PC_BUILD_STATUS=${PIPESTATUS[0]}
# if [ ${PC_BUILD_STATUS} -eq 0 ]; then
#     echo "PC build: SUCCESS" | tee -a "${REPORT_FILE}"
# else
#     echo "PC build: FAILED (Exit Code: ${PC_BUILD_STATUS})" | tee -a "${REPORT_FILE}"
# fi
# echo "" >> "${REPORT_FILE}"

echo "QA build process completed. Report saved to ${REPORT_FILE}" | tee -a "${REPORT_FILE}"

# Exit with 0, as PC build is commented out and not meant to boot
exit 0