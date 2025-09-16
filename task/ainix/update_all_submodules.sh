#!/usr/bin/env bash
# File: task/ainix/update_all_submodules.sh

# Set up logging and error handling
LOG_FILE="/data/data/com.termux.nix/files/home/pick-up-nix2/task/ainix/logs/update_all_submodules.log"
STRACE_FILE="/data/data/com.termux.nix/files/home/pick-up-nix2/task/ainix/logs/update_all_submodules_strace.log"
exec > >(tee -a "$LOG_FILE") 2>&1
set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.
set -o pipefail # Return value of a pipeline is the value of the last command to exit with a non-zero status.
set -x # Print a trace of commands and their arguments as they are executed.

echo "Starting submodule update at $(date)"

# Update all submodules with a timeout
echo "Updating all submodules..."
# Using strace to log system calls for the git submodule update command
if ! timeout 600 strace -o "$STRACE_FILE" git submodule update --init --recursive --force;
then
    echo "Error: Failed to update submodules. Check $LOG_FILE and $STRACE_FILE for details."
    exit 1
fi

echo "All submodules updated successfully."

echo "Finishing submodule update at $(date)"
