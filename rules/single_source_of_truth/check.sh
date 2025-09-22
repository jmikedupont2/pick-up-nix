#!/usr/bin/env bash

# This script checks for direct usage of commands that should be centralized in libraries.

echo "Checking for direct usage of centralized commands..."

# List of commands to check, and the library they should be in.
# Format: "<command_regex>;<library_path>"
CENTRALIZED_COMMANDS=(
  "gh\s+repo\s+fork;lib/lib_github.sh"
  "git\s+;lib/lib_git_submodule.sh"
)

for item in "${CENTRALIZED_COMMANDS[@]}"; do
  IFS=';' read -r command library <<< "$item"

  # Find all shell scripts in the current directory and scripts/ directory
  # Exclude the library itself
  find . -maxdepth 1 -type f -name "*.sh" -print0 | \
  xargs -0 -I {} echo {} | \
  grep -v "${library}" | \
  while read -r script; do
    if [[ -f "$script" ]]; then
      if grep -qE "${command}" "$script"; then
        echo "Found direct usage of '${command}' in: $script"
        grep -nE "${command}" "$script"
        echo ""
      fi
    fi
  done

  find scripts/ -maxdepth 1 -type f -name "*.sh" -print0 | \
  xargs -0 -I {} echo {} | \
  grep -v "${library}" | \
  while read -r script; do
    if [[ -f "$script" ]]; then
      if grep -qE "${command}" "$script"; then
        echo "Found direct usage of '${command}' in: $script"
        grep -nE "${command}" "$script"
        echo ""
      fi
    fi
  done
done

echo "Centralized command usage check complete."