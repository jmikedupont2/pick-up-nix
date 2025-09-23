#!/usr/bin/env bash

LOG_DIR="/data/data/com.termux.nix/files/home/pick-up-nix2/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/update_index_$(date +%Y%m%d_%H%M%S).log"

echo "$(date): Starting update_index.sh in background..." | tee "$LOG_FILE"
echo "Log file: $LOG_FILE"

(
    echo "$(date): update_index.sh started."
    /data/data/com.termux.nix/files/home/pick-up-nix2/update_index.sh
    EXIT_CODE=$?
    echo "$(date): update_index.sh finished with exit code $EXIT_CODE."
) &>> "$LOG_FILE" &

echo "$(date): update_index.sh process launched in background. Check $LOG_FILE for status."
