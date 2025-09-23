#!/usr/bin/env bash

# boot.sh for NumerologicalAnalysisMeme experiment

# This script sets up the Nix development environment for the experiment
# and then launches the Gemini CLI within that environment, configured for this experiment.

# Experiment-specific configuration
EXPERIMENT_NAME="NumerologicalAnalysisMeme"
MUSE_NAME="DigitalMycology"
EXPERIMENT_DIR="$(dirname "$0")" # Directory of this script
TASK_FILE="${EXPERIMENT_DIR}/task.md" # Path to the experiment's task.md

echo "Starting experiment: ${EXPERIMENT_NAME} (Muse: ${MUSE_NAME})"
echo "Experiment directory: ${EXPERIMENT_DIR}"

# Enter Nix development shell and launch Gemini CLI
echo "Entering Nix development shell and launching Gemini CLI..."
nix develop --command bash -c "
    echo 'Nix development shell entered for ${EXPERIMENT_NAME}'.
    echo 'Launching Gemini CLI with task: ${TASK_FILE}'
    
    # Launch gemini-cli, which is now available in PATH
    gemini-cli --task-file \"${TASK_FILE}\" 
    
    echo 'Gemini CLI session ended.'
"

echo "Exiting experiment: ${EXPERIMENT_NAME}"