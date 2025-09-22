#!/usr/bin/env bash

# scripts/extract_and_vendorize_github_repos.sh
#
# This script extracts unique GitHub repository URLs from a given input file
# (typically index/all_github.txt) and then attempts to fork each unique
# repository into the 'meta-introspector' GitHub organization using the
# lib_github_fork_repo function.

set -euo pipefail

PROJECT_ROOT="$(dirname "$(dirname "$(realpath "$0")")")"
source "${PROJECT_ROOT}/lib/lib_github_fork.sh"

# --- Configuration ---
INPUT_FILE="${PROJECT_ROOT}/index/all_github.txt"
UNIQUE_REPOS_FILE="${PROJECT_ROOT}/index/unique_github_repos.txt"
META_INTROSPECTOR_ORG="meta-introspector"

# --- Functions ---

# Function to log messages
log() {
  echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

# --- Main Script Logic ---

log "Starting extraction and vendorization of GitHub repositories."

if [[ ! -f "${INPUT_FILE}" ]]; then
  log "Error: Input file '${INPUT_FILE}' not found. Please ensure it exists and is populated."
  exit 1
fi

log "Extracting unique GitHub repository URLs from '${INPUT_FILE}'..."

# Extract HTTP/HTTPS URLs
grep -oE 'https?://github.com/[a-zA-Z0-9_.-]+/[a-zA-Z0-9_.-]+' "${INPUT_FILE}" \
  > "${UNIQUE_REPOS_FILE}"

# Extract SSH URLs, convert to HTTPS, and append
grep -oE 'git@github.com:[a-zA-Z0-9_.-]+/[a-zA-Z0-9_.-]+\.git' "${INPUT_FILE}" \
  | sed 's#git@github.com:#https://github.com/#' \
  | sed 's#\.git$##' \
  >> "${UNIQUE_REPOS_FILE}"

# Sort and unique the combined list
sort -u -o "${UNIQUE_REPOS_FILE}" "${UNIQUE_REPOS_FILE}"

log "Found $(wc -l < "${UNIQUE_REPOS_FILE}") unique GitHub repositories. List saved to '${UNIQUE_REPOS_FILE}'."

log "Attempting to vendorize (fork) unique repositories to '${META_INTROSPECTOR_ORG}' organization..."

while IFS= read -r repo_url; do
  if [[ -z "$repo_url" ]]; then
    continue
  fi

  # Extract owner and repo name from the URL
  # Example: https://github.com/owner/repo -> owner/repo
  repo_path=$(echo "$repo_url" | sed -E 's#https?://github.com/##')
  owner=$(echo "$repo_path" | cut -d'/' -f1)
  repo_name=$(echo "$repo_path" | cut -d'/' -f2)

  if [[ -z "$owner" || -z "$repo_name" ]]; then
    log "Warning: Could not parse owner/repo from URL: '${repo_url}'. Skipping."
    continue
  fi

  log "Processing repository: ${owner}/${repo_name}"

  # Call the lib_github_fork_repo function
  if lib_github_fork_repo "${owner}/${repo_name}" "${META_INTROSPECTOR_ORG}" "${repo_name}"; then
    log "Successfully vendorized (forked) ${owner}/${repo_name}."
  else
    log "Error: Failed to vendorize (fork) ${owner}/${repo_name}. See previous logs for details."
  fi
done < "${UNIQUE_REPOS_FILE}"

log "GitHub repository extraction and vendorization process complete."
