#!/usr/bin/env bash

# tests/lib/test_lib_github_fork.sh
#
# This script performs integration tests for the lib_github_fork_repo function.
# It assumes the 'gh' CLI is installed and authenticated with sufficient permissions
# to fork repositories into the 'meta-introspector' organization.
#
# IMPORTANT: This test will attempt to interact with GitHub. It is recommended
# to use a dedicated test GitHub account and organization to avoid unintended
# forks or rate limiting issues.

set -euo pipefail

PROJECT_ROOT="$(dirname "$(dirname "$(dirname "$(realpath "$0")")")")"
source "${PROJECT_ROOT}/lib/lib_github_fork.sh"

# --- Configuration for Testing ---
TEST_ORG="meta-introspector" # The GitHub organization to fork into
# A public repository that can be used for testing. Choose one that you have
# permissions to fork into TEST_ORG, or one that is already forked.
TEST_REPO_OWNER="cli"
TEST_REPO_NAME="cli"
TEST_REPO_FULL="${TEST_REPO_OWNER}/${TEST_REPO_NAME}"
TEST_FORK_NAME="${TEST_REPO_NAME}-test-fork-$(date +%s)" # Unique name for the fork

# --- Helper Functions ---
log_info() { echo "[INFO] $1"; }
log_success() { echo "[SUCCESS] $1"; }
log_fail() { echo "[FAIL] $1"; exit 1; }

# --- Test Cases ---

log_info "Starting integration tests for lib_github_fork_repo..."

# Test Case 1: Attempt to fork a non-existent repository (should fail)
log_info "Test Case 1: Forking a non-existent repository..."
if ! lib_github_fork_repo "nonexistent/repo" "${TEST_ORG}" "nonexistent-fork"; then
    log_success "Test Case 1: Correctly failed to fork non-existent repository."
else
    log_fail "Test Case 1: Unexpectedly succeeded in forking a non-existent repository."
fi

# Test Case 2: Attempt to fork a valid repository (should succeed)
# This test assumes that the TEST_REPO_FULL can be forked into TEST_ORG.
# If it already exists, lib_github_fork_repo should handle it gracefully.
log_info "Test Case 2: Forking a valid repository (${TEST_REPO_FULL})..."
if lib_github_fork_repo "${TEST_REPO_FULL}" "${TEST_ORG}" "${TEST_FORK_NAME}"; then
    log_success "Test Case 2: Successfully forked or handled existing fork of ${TEST_REPO_FULL}."
    log_info "Please manually verify that ${TEST_ORG}/${TEST_FORK_NAME} exists on GitHub."
    # Clean up the created fork if it was new
    # gh repo delete "${TEST_ORG}/${TEST_FORK_NAME}" --confirm || true
else
    log_fail "Test Case 2: Failed to fork ${TEST_REPO_FULL}. Check gh CLI authentication and permissions."
fi

# Test Case 3: Attempt to fork the same valid repository again (should succeed gracefully)
log_info "Test Case 3: Forking the same valid repository again (${TEST_REPO_FULL})..."
if lib_github_fork_repo "${TEST_REPO_FULL}" "${TEST_ORG}" "${TEST_FORK_NAME}"; then
    log_success "Test Case 3: Successfully handled re-forking of ${TEST_REPO_FULL}."
else
    log_fail "Test Case 3: Failed to handle re-forking of ${TEST_REPO_FULL}."
fi

log_info "All integration tests for lib_github_fork_repo completed. Manual verification may be required."
