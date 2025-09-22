#!/usr/bin/env bash

# This script creates a new experimental task based on the task_template.md.
# It now uses the Rust template generator binary to create the project structure.

MUSE_NAME="$2"
TASK_TITLE="$1"
DOC_PATH="$3"
RELATIVE_DOC_PATH="$4"
YEAR="2025"

TEMPLATE_GENERATOR_BIN="/data/data/com.termux.nix/files/home/pick-up-nix2/result/bin/template-generator-bin"

if [ -z "$TASK_TITLE" ] || [ -z "$MUSE_NAME" ]; then
    echo "Usage: $0 <task_title> <muse_name> [doc_path] [relative_doc_path]"
    echo "Example: $0 'InvestigateNixFlakeBehavior' 'DigitalMycology'"
    exit 1
fi

# Sanitize task title for directory name (re-using logic from create_experimental_task.sh)
SANITIZED_TASK_TITLE=$(echo "$TASK_TITLE" | sed -E 's/[^a-zA-Z0-9_-]+/-/g')

TASK_DIR="/data/data/com.termux.nix/files/home/pick-up-nix2/tasks/${MUSE_NAME}/${YEAR}/${SANITIZED_TASK_TITLE}"

# Ensure the output directory exists before the Rust binary tries to write to it
mkdir -p "$TASK_DIR"

# Call the Rust binary to generate the task
"$TEMPLATE_GENERATOR_BIN" generate \
    --template-type "experimental-task" \
    --task-title "$TASK_TITLE" \
    --muse-name "$MUSE_NAME" \
    --doc-path "$DOC_PATH" \
    --relative-doc-path "$RELATIVE_DOC_PATH" || {
        echo "Error: Failed to generate experimental task using template-generator-bin."
        exit 1
    }

if [ $? -eq 0 ]; then
    echo "Successfully created new experimental task: ${TASK_DIR}/task.md"
else
    echo "Error: Failed to create task file."
    exit 1
fi