#!/bin/bash

# This script removes the files listed in crq.txt.

set -e

if [ -f crq.txt ]; then
  echo "Removing files listed in crq.txt..."
  xargs -a crq.txt rm -f
  echo "Cleanup of crq.txt files done."
else
  echo "crq.txt not found, skipping cleanup."
fi

if [ -f sh.txt ]; then
  echo "Removing files listed in sh.txt..."
  xargs -a sh.txt rm -f
  echo "Cleanup of sh.txt files done."
else
  echo "sh.txt not found, skipping cleanup."
fi

if [ -f sop.txt ]; then
  echo "Removing files listed in sop.txt..."
  xargs -a sop.txt rm -f
  echo "Cleanup of sop.txt files done."
else
  echo "sop.txt not found, skipping cleanup."
fi
