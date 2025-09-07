#!/bin/bash

# NOTE: This script is a temporary solution for logging tweet confirmations.
# It will be replaced by a Rust implementation for automation in the future.

CONFIRMATION_URL="$1"
LOG_FILE="social_media_fiber_log.md"

if [ -z "$CONFIRMATION_URL" ]; then
  echo "Usage: $0 <confirmation_url>"
  exit 1
fi

TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

LOG_ENTRY="## $TIMESTAMP - Tweet Confirmation\n\nTweet successfully posted: $CONFIRMATION_URL\n\n"

printf "%b" "$LOG_ENTRY" >> "$LOG_FILE"

echo "Confirmation logged to $LOG_FILE"
