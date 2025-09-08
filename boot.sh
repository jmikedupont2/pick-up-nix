#!/usr/bin/env bash

# This script orchestrates the recording of a tmux session with asciinema,
# and then launches the Gemini CLI within that session, configured for this project.

# Configuration
SESSION_NAME="gemini-dev-session" # Define SESSION_NAME here
LOG_DIR="${HOME}/logs/gemini"
mkdir -p "${LOG_DIR}"
# TASK_FILE="task.md" # Placeholder for the task file, currently unused

# Ensure log directory exists
mkdir -p "$LOG_DIR"

# Start asciinema recording in the background
# The output will be saved to a unique file in the logs directory
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ASCIINEMA_REC_FILE="$LOG_DIR/session_$TIMESTAMP.cast"

# Start asciinema recording
~/pick-up-nix/result/bin/asciinema rec "$ASCIINEMA_REC_FILE" --command "/data/data/com.termux.nix/files/home/pick-up-nix/pick-up-nix/run_boot.sh \"$ASCIINEMA_REC_FILE\" \"$SESSION_NAME\""

# The script will wait here until asciinema finishes (i.e., the tmux session exits)
