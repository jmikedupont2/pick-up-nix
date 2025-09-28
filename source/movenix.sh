#!/bin/bash

# This script runs move.sh in a nix shell with rsync available.

set -e

echo "Running move.sh in a nix develop shell..."
nix develop -c bash ./move.sh