#!/usr/bin/env bash

# This script checks for direct Git command usage in shell scripts,
# enforcing the policy that all Git access must use scripts/lib_git_submodule.sh.

echo "Checking for direct Git command usage in shell scripts..."

# List of common direct Git commands to flag
GIT_COMMANDS="add|commit|push|checkout|remote|branch|pull|fetch|submodule|rev-parse"

# Find all shell scripts (excluding the library itself)
# and grep for direct git commands
find . -type f -name "*.sh" ! -path "./scripts/lib_git_submodule.sh" | while read -r script; do
  if grep -qE "\\bgit\\s+($GIT_COMMANDS)\\b" "$script"; then
    echo "Found direct Git command in: $script"
    grep -nE "\\bgit\\s+($GIT_COMMANDS)\\b" "$script"
    echo ""
  fi
done

echo "Git access policy check complete."
