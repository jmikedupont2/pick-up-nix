#!/usr/bin/env bash

# This script creates a new experimental task based on the task_template.md.
# It now uses the sed-based template generator script to create the project structure.

MUSE_NAME="$2"
TASK_TITLE="$1"
YEAR="2025" # This will be overwritten by the sed script's date command

if [ -z "$TASK_TITLE" ] || [ -z "$MUSE_NAME" ]; then
    echo "Usage: $0 <task_title> <muse_name>"
    echo "Example: $0 'InvestigateNixFlakeBehavior' 'DigitalMycology'"
    exit 1
fi

# Sanitize task title for directory name (re-using logic from create_experimental_task.sh)
SANITIZED_TASK_TITLE=$(echo "$TASK_TITLE" | sed -E 's/[^a-zA-Z0-9_-]+/-/g')

TASK_DIR="/data/data/com.termux.nix/files/home/pick-up-nix2/tasks/${MUSE_NAME}/${YEAR}/${SANITIZED_TASK_TITLE}"

# Ensure the output directory exists
mkdir -p "$TASK_DIR"

# Call the sed-based script to generate the task
/data/data/com.termux.nix/files/home/pick-up-nix2/scripts/create_experimental_task_sed.sh "$TASK_TITLE" "$MUSE_NAME" || {
        echo "Error: Failed to generate experimental task using create_experimental_task_sed.sh."
        exit 1
    }

if /data/data/com.termux.nix/files/home/pick-up-nix2/scripts/create_experimental_task_sed.sh "$TASK_TITLE" "$MUSE_NAME"; then
    echo "Successfully created new experimental task: ${TASK_DIR}/task.md"
else
    echo "Error: Failed to create task file."
    exit 1
fi