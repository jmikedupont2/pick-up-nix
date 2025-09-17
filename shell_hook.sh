#!/usr/bin/env bash

echo "Current PATH: $PATH"
echo "Contents of unstablePkgs.cargo/bin: $(ls ${unstablePkgs.cargo}/bin)"
# No need to export PATH again, it's already there from buildInputs
echo "Attempting to run cargo check..."
bash -c "cargo check"
