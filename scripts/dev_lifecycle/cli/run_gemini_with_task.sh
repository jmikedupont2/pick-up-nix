#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: run_gemini_with_task.sh
#
#         USAGE: ./scripts/cli/run_gemini_with_task.sh
#
#   DESCRIPTION: This script runs the Gemini CLI with specific arguments,
#                including a pinned model, approval mode, checkpointing, and an
#                interactive prompt with `task.md`.
#
# ==============================================================================

~/nix2/gemini_cli_recent.sh -- --model=gemini-2.5-flash --approval-mode default --checkpointing --prompt-interactive @task.md
