#!/bin/bash

LOG_FILE="bugreport_$(date +%Y%m%d_%H%M%S).log"

echo "--- Starting Bug Report ---" | tee -a "$LOG_FILE"
echo "Timestamp: $(date +"%Y-%m-%d %H:%M:%S")" | tee -a "$LOG_FILE"
echo "Working Directory: $(pwd)" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

echo "--- Git Status Before Commit Attempt ---" | tee -a "$LOG_FILE"
git status 2>&1 | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

echo "--- Attempting Git Commit ---" | tee -a "$LOG_FILE"
git commit -m "feat: Integrate Grokai image/video gen, update submodules, and ignore Lean 4 log

This commit:
- Integrates the Grokai image/video generation command and its request log.
- Moves imagine_video_gen.sh into the streamofrandom submodule.
- Updates the streamofrandom submodule to reflect its latest changes.
- Updates Escaped-RDFa/namespace and rnix-parser submodules.
- Adds lean4_nix_develop.log to .gitignore." 2>&1 | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"

echo "--- Git Status After Commit Attempt ---" | tee -a "$LOG_FILE"
git status 2>&1 | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

echo "--- Checking for .git/index.lock ---" | tee -a "$LOG_FILE"
find .git/index.lock -ls 2>&1 | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

echo "--- Bug Report Complete ---" | tee -a "$LOG_FILE"
echo "Log saved to: $LOG_FILE" | tee -a "$LOG_FILE"
