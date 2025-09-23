#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: start_development_session.sh
#
#         USAGE: ./scripts/session/start_development_session.sh
#
#   DESCRIPTION: This script orchestrates the recording of a tmux session with
#                asciinema, and then launches the Gemini CLI within that
#                session, configured for this project.
#
# ==============================================================================

# Configuration
SESSION_NAME="gemini-dev-session" # Define SESSION_NAME here
LOG_DIR="${HOME}/logs/gemini"
mkdir -p "${LOG_DIR}"

# Task file to be used by the Gemini CLI
TASK_FILE="$1"

if [ -z "$TASK_FILE" ]; then
  echo "Usage: $0 <task_file>"
  exit 1
fi

if [ ! -f "$TASK_FILE" ]; then
  echo "Error: Task file '$TASK_FILE' not found."
  exit 1
fi

# Ensure log directory exists
mkdir -p "$LOG_DIR"

# Start asciinema recording in the background
# The output will be saved to a unique file in the logs directory
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ASCIINEMA_REC_FILE="$LOG_DIR/session_$TIMESTAMP.cast"

# Start asciinema recording
asciinema rec "$ASCIINEMA_REC_FILE" --command "/data/data/com.termux.nix/files/home/pick-up-nix2/scripts/dev_lifecycle/session/run_gemini_session.sh  \"$ASCIINEMA_REC_FILE\" \"$SESSION_NAME\" \"$TASK_FILE\""

# The script will wait here until asciinema finishes (i.e., the tmux session exits)
