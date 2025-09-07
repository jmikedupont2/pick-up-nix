#!/bin/bash

# This script orchestrates the recording of a tmux session with asciinema,
# and then launches the Gemini CLI within that session, configured for this project.

# Configuration
SESSION_NAME="gemini-dev-session"
LOG_DIR="logs"
TASK_FILE="task.md" # Placeholder for the task file

# Ensure log directory exists
mkdir -p "$LOG_DIR"

# Start asciinema recording in the background
# The output will be saved to a unique file in the logs directory
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ASCIINEMA_REC_FILE="$LOG_DIR/session_$TIMESTAMP.cast"
ascinema rec "$ASCIINEMA_REC_FILE" &
ASCIINEMA_PID=$!
echo "Asciinema recording started. PID: $ASCIINEMA_PID. Recording to $ASCIINEMA_REC_FILE"

# Determine Gemini CLI invocation method (bunx or npx)
#GEMINI_INVOCATION="npx @google/gemini-cli"
#if command -v bun &> /dev/null;
#then
#  GEMINI_INVOCATION="bunx @google/gemini-cli"
#fi
GEMINI_INVOCATION="gemini"
# Start or attach to a tmux session
# If the session doesn't exist, it will create it and run the gemini command
if ! tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
  echo "Starting new tmux session: $SESSION_NAME"
  tmux new-session -d -s "$SESSION_NAME"

  # Send commands to the new tmux session
  # Incorporating best practices: --all-files, --approval-mode default, --checkpointing
  # Using --prompt-interactive to continue the session after loading the task file
  tmux send-keys -t "$SESSION_NAME" "echo 'Welcome to the Gemini Development Session!'" C-m
  tmux send-keys -t "$SESSION_NAME" "echo 'Loading task from $TASK_FILE...'" C-m
  tmux send-keys -t "$SESSION_NAME" "$GEMINI_INVOCATION --approval-mode default --checkpointing --prompt-interactive \"@$TASK_FILE\"" C-m
else
  echo "Attaching to existing tmux session: $SESSION_NAME"
fi

# Attach to the tmux session
tmux attach-session -t "$SESSION_NAME"

# When tmux session exits, stop asciinema recording
echo "Tmux session exited. Stopping asciinema recording..."
kill "$ASCIINEMA_PID"
echo "Asciinema recording stopped."
