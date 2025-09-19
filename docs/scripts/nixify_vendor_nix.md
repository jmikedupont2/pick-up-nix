## `scripts/nixify_vendor_nix.sh` Documentation

This script automates the Nixification process for all Nix-related submodules located under `vendor/nix/`. It acts as a wrapper around `scripts/nixify.sh`, applying it to multiple submodules.

**Key Features:**
*   **Usage**: Can be run with an optional `--apply` argument. Without `--apply`, it runs `nixify.sh` in dry-run mode for all submodules. With `--apply`, it passes the `--apply` flag to `nixify.sh`, causing actual changes to be made.
*   **Submodule Discovery**: Identifies relevant submodules by parsing `flake.nix` for `github:meta-introspector` entries. It assumes these correspond to submodules located under `vendor/nix/`.
*   **Orchestration**: Iterates through each discovered submodule and executes `scripts/nixify.sh` on it, passing the appropriate `--apply` flag.

**Usage Example**:
*   Dry run for all `vendor/nix` submodules: `./scripts/nixify_vendor_nix.sh`
*   Apply changes to all `vendor/nix` submodules: `./scripts/nixify_vendor_nix.sh --apply`
