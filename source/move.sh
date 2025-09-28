#!/bin/bash

# This script moves files listed in crq.txt, sh.txt, and sop.txt to specified directories,
# preserving the directory structure.

set -e

# Process crq.txt
CRQ_DEST_DIR=~/nix/ai-ml-zk-ops/docs/crq
if [ -f crq.txt ]; then
  echo "Creating destination directory: $CRQ_DEST_DIR"
  mkdir -p "$CRQ_DEST_DIR"
  echo "Copying files from crq.txt to $CRQ_DEST_DIR..."
  rsync -av --files-from=crq.txt . "$CRQ_DEST_DIR"
else
  echo "crq.txt not found, skipping."
fi

# Process sh.txt
SH_DEST_DIR=~/nix/ai-ml-zk-ops/scripts
if [ -f sh.txt ]; then
  echo "Creating destination directory: $SH_DEST_DIR"
  mkdir -p "$SH_DEST_DIR"
  echo "Copying files from sh.txt to $SH_DEST_DIR..."
  rsync -av --files-from=sh.txt . "$SH_DEST_DIR"
else
  echo "sh.txt not found, skipping."
fi

# Process sop.txt
SOP_DEST_DIR=~/nix/ai-ml-zk-ops/docs/sops
if [ -f sop.txt ]; then
  echo "Creating destination directory: $SOP_DEST_DIR"
  mkdir -p "$SOP_DEST_DIR"
  echo "Copying files from sop.txt to $SOP_DEST_DIR..."
  rsync -av --files-from=sop.txt . "$SOP_DEST_DIR"
else
  echo "sop.txt not found, skipping."
fi

echo "Done."