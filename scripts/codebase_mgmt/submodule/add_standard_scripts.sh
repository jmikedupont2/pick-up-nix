#!/usr/bin/env bash

# ==============================================================================
#
#          FILE: add_standard_scripts.sh
#
#         USAGE: ./scripts/submodule/add_standard_scripts.sh <submodule_path>
#
#   DESCRIPTION: This script adds standard `build.sh` and `test.sh` scripts to a
#                submodule.
#
# ==============================================================================

set -e

SUBMODULE_PATH="$1"

if [ -z "$SUBMODULE_PATH" ]; then
  echo "Usage: $0 <submodule_path>"
  exit 1
fi

echo "Adding standard scripts to submodule: $SUBMODULE_PATH"

# Navigate into the submodule directory
pushd "$SUBMODULE_PATH"

# Create scripts directory
mkdir -p scripts

# Create build.sh
cat << EOF > scripts/build.sh
#!/usr/bin/env bash

set -e

echo "Building $(basename "$PWD")"
cargo build --release
EOF

# Create test.sh
cat << EOF > scripts/test.sh
#!/usr/bin/env bash

set -e

echo "Testing $(basename "$PWD")"
cargo test
EOF

# Make scripts executable
chmod +x scripts/build.sh scripts/test.sh

# Add and commit changes within the submodule
git add scripts/build.sh scripts/test.sh
git commit -m "CRQ-008: Add standard build.sh and test.sh scripts"

# Navigate back to the original directory
popd

echo "Standard scripts added to submodule: $SUBMODULE_PATH"