#!/usr/bin/env bash
#
# Script to process recent Git commits, calling analyze_commit.sh for each.
# It keeps track of processed commits to allow for resumption.
#
# Usage: ./process_recent_commits.sh <repo_root_path>
#
# repo_root_path: The absolute path to the root of the repository being analyzed.

set -euo pipefail

REPO_ROOT="$1" # The absolute path to the repository being analyzed
RECENT_COMMITS_LOG="${REPO_ROOT}/index/recent_commits.log"
PROCESSED_COMMITS_FILE="${REPO_ROOT}/index/processed_commits.txt"
ANALYZE_COMMIT_SCRIPT="/data/data/com.termux.nix/files/home/pick-up-nix2/scripts/analyze_commit.sh" # Absolute path to analyze_commit.sh

# Ensure the processed commits file exists
touch "${PROCESSED_COMMITS_FILE}"

# Read commits from the log, in reverse order (oldest first)
# git log outputs newest first, so we need to reverse it to process oldest first
COMMITS=$(grep '^commit' "${RECENT_COMMITS_LOG}" | awk '{print $2}' | tac)

for COMMIT_HASH in ${COMMITS}; do
    if grep -q "${COMMIT_HASH}" "${PROCESSED_COMMITS_FILE}"; then
        echo "Skipping already processed commit: ${COMMIT_HASH}"
        continue
    fi

    echo "Processing commit: ${COMMIT_HASH}"
    # Call analyze_commit.sh, passing the commit hash and changing directory to REPO_ROOT
    (cd "${REPO_ROOT}" && "${ANALYZE_COMMIT_SCRIPT}" "${COMMIT_HASH}")
    echo "${COMMIT_HASH}" >> "${PROCESSED_COMMITS_FILE}"
    echo "Finished processing commit: ${COMMIT_HASH}"
    echo "--------------------------------------------------"
done

echo "All recent commits processed."
