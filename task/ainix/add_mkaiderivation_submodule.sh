#!/usr/bin/env bash
# File: task/ainix/add_mkaiderivation_submodule.sh

# Change to the project root directory
cd /data/data/com.termux.nix/files/home/pick-up-nix2

# Set up logging and error handling
LOG_FILE="/data/data/com.termux.nix/files/home/pick-up-nix2/task/ainix/logs/add_mkaiderivation_submodule.log"
STRACE_FILE="/data/data/com.termux.nix/files/home/pick-up-nix2/task/ainix/logs/add_mkaiderivation_submodule_strace.log"
exec > >(tee -a "$LOG_FILE") 2>&1
set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.
set -o pipefail # Return value of a pipeline is the value of the last command to exit with a non-zero status.
set -x # Print a trace of commands and their arguments as they are executed.

echo "Starting submodule addition for mkAIDerivation at $(date)"

# Define the submodule URL and path
SUBMODULE_URL="https://github.com/meta-introspector/mkAIDerivation.git"
SUBMODULE_PATH="vendor/mkAIDerivation"
SUBMODULE_NAME="mkAIDerivation"

# Check if the submodule entry already exists in .gitmodules
if git config -f .gitmodules --get submodule."$SUBMODULE_PATH".url &> /dev/null; then
    echo "Submodule $SUBMODULE_NAME (path: $SUBMODULE_PATH) already exists in .gitmodules. Skipping addition."
    exit 0
fi

# Check if the target directory already exists and is not empty
if [ -d "$SUBMODULE_PATH" ] && [ "$(ls -A "$SUBMODULE_PATH")" ]; then
    echo "Target directory $SUBMODULE_PATH exists and is not empty. Please handle manually or remove it."
    exit 1
fi

# Add the submodule with a timeout
echo "Adding submodule $SUBMODULE_NAME from $SUBMODULE_URL to $SUBMODULE_PATH..."
# Using strace to log system calls for the git submodule add command
if ! timeout 300 strace -o "$STRACE_FILE" git submodule add --force "$SUBMODULE_URL" "$SUBMODULE_PATH"; then
    echo "Error: Failed to add submodule $SUBMODULE_NAME. Check $LOG_FILE and $STRACE_FILE for details."
    exit 1
fi

echo "Submodule $SUBMODULE_NAME added successfully."

echo "Finishing submodule addition for mkAIDerivation at $(date)"
