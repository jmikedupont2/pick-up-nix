#!/usr/bin/env bash
#
# Script to generate a log of git commits from the last 4 days.
#
# Usage: ./generate_recent_commits_log.sh <output_file_path>
#
# The output file path should be relative to the current working directory
# (the repository root where this script is executed).

set -euo pipefail

OUTPUT_FILE="${1:-./index/recent_commits.log}" # Default to index/recent_commits.log within current repo
OUTPUT_DIR=$(dirname "${OUTPUT_FILE}")

# Create the output directory if it doesn't exist
mkdir -p "${OUTPUT_DIR}"

echo "Generating git log for the last 4 days and saving to ${OUTPUT_FILE}..."
git log --since="4 days ago" > "${OUTPUT_FILE}"
echo "Done."
