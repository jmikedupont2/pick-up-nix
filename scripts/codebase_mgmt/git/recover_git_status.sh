#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: recover_git_status.sh
#
#         USAGE: ./scripts/git/recover_git_status.sh
#
#   DESCRIPTION: This script generates submodule status and git status, likely
#                for recovery or diagnostic purposes.
#
# ==============================================================================

bash ./scripts/generate_submodule_status.sh
bash ./scripts/gitstatus.sh
