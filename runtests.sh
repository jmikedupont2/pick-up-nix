#!/bin/bash

echo "--- Running Tests ---"
echo ""

ANDROID_BUILD_STATUS=0
PC_BUILD_STATUS=0

echo "Starting Android build test..."
nix build .#nixOnDroidConfigurations.android.config.system.build.toplevel --system aarch64-linux --impure
ANDROID_BUILD_STATUS=$?
if [ ${ANDROID_BUILD_STATUS} -eq 0 ]; then
    echo "Android build test: SUCCESS"
else
    echo "Android build test: FAILED (Exit Code: ${ANDROID_BUILD_STATUS})"
fi
echo ""

echo "Starting PC build test..."
nix build .#nixosConfigurations.desktop.config.system.build.toplevel
PC_BUILD_STATUS=$?
if [ ${PC_BUILD_STATUS} -eq 0 ]; then
    echo "PC build test: SUCCESS"
else
    echo "PC build test: FAILED (Exit Code: ${PC_BUILD_STATUS})"
fi
echo ""

echo "--- Test Run Completed ---"

# Exit with a non-zero status if any build failed
exit $((ANDROID_BUILD_STATUS + PC_BUILD_STATUS))
