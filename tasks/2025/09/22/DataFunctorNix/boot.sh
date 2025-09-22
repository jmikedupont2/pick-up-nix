#!/usr/bin/env bash

# boot.sh for DataFunctorNix experiment

# This script sets up the Nix development environment for the experiment
# and provides a way to run the experiment's main logic.

# Experiment-specific configuration
EXPERIMENT_NAME="DataFunctorNix"
MUSE_NAME="DigitalMycology"
EXPERIMENT_DIR="$(dirname "$0")" # Directory of this script

echo "Starting experiment: ${EXPERIMENT_NAME} (Muse: ${MUSE_NAME})"
echo "Experiment directory: ${EXPERIMENT_DIR}"

# Enter Nix development shell
echo "Entering Nix development shell..."
nix develop --command bash -c "
    echo 'Nix development shell entered for ${EXPERIMENT_NAME}.'
    echo 'You can now run your experiment-specific commands.'
    echo 'For example: bash ${EXPERIMENT_DIR}/run_experiment.sh'
    
    # Keep the shell open
    exec bash
"

echo "Exiting experiment: ${EXPERIMENT_NAME}"
