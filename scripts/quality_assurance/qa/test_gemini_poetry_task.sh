#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: test_gemini_poetry_task.sh
#
#         USAGE: ./scripts/qa/test_gemini_poetry_task.sh
#
#   DESCRIPTION: This script simply prints the current working directory and
#                then calls `gemini_split.sh` with `poetry_task.md`. It seems
#                to be a test script for launching Gemini with a specific task.
#
# ==============================================================================

pwd
bash /data/data/com.termux.nix/files/home/pick-up-nix/gemini_split.sh poetry_task.md