#!/usr/bin/env bash
#
# Script to analyze a single Git commit, extract its diffs and stats,
# and save them to files in a commit-specific directory.
#
# Usage: ./analyze_commit.sh <commit_hash>

set -euo pipefail

COMMIT_HASH="$1"
COMMIT_DIR="./tasks/commit_analysis/${COMMIT_HASH}"

echo "Analyzing commit: ${COMMIT_HASH}"
echo "Creating directory: ${COMMIT_DIR}"
mkdir -p "${COMMIT_DIR}"

echo "Getting full diff..."
git show "${COMMIT_HASH}" > "${COMMIT_DIR}/full_diff.txt"

echo "Getting diff stats..."
git diff-tree --numstat "${COMMIT_HASH}" > "${COMMIT_DIR}/diff_stats.txt"

echo "Getting commit message..."
git log --format=%B -n 1 "${COMMIT_HASH}" > "${COMMIT_DIR}/commit_message.txt"

echo "Creating analysis_summary.md..."
{
    echo "# Commit Analysis: ${COMMIT_HASH}"
    echo ""
    echo "## Commit Message"
    echo "See: [commit_message.txt](./commit_message.txt)"
    echo ""
    echo "## Diff Stats"
    echo "See: [diff_stats.txt](./diff_stats.txt)"
    echo ""
    echo "## Full Diff"
    echo "See: [full_diff.txt](./full_diff.txt)"
    echo ""
} > "${COMMIT_DIR}/analysis_summary.md"

echo "Analysis setup complete for ${COMMIT_HASH} in ${COMMIT_DIR}"
