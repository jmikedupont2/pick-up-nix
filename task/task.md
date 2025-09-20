# Task: Implement CRQ-002: Nixtract Integration and Quality

This task focuses on implementing the changes outlined in `CRQ_002_Nixtract_Integration_and_Quality.md` to improve the integration and quality control of the `nixtract` submodule.

## Current Status

*   SOPs for `nixtract` usage and Nix graph analysis have been created (`docs/sops/SOP_Nixtract_Usage.md`, `docs/sops/SOP_Nix_Graph_Analysis.md`).
*   CRQ-002 has been created (`docs/crqs/CRQ_002_Nixtract_Integration_and_Quality.md`).

## Detailed Plan

### Phase 1: Initial Submodule Examination and Setup

1.  **Navigate to `vendor/nix/nixtract`**: Change directory into the `nixtract` submodule.
2.  **Examine existing files**: List all files and directories to understand its current structure, especially `flake.nix`, `Cargo.toml`, and any CI/CD configurations (`.github/workflows/`).
3.  **Check `flake.nix`**: Read the `flake.nix` file within `vendor/nix/nixtract` to understand its inputs, outputs, and development shell setup.
4.  **Attempt `nix develop`**: Try to enter the development shell of the `nixtract` submodule to verify its standalone build environment.

### Phase 2: Injecting Quality System

1.  **Identify Quality Tools**: Determine the appropriate linting, formatting, and testing tools for the Rust project within `nixtract` (e.g., `cargo fmt`, `cargo clippy`, `cargo test`).
2.  **Create/Update CI/CD**: If a `.github/workflows/` directory exists, update it to include these quality checks. If not, create a basic CI workflow for linting and testing.
3.  **Add `boot.sh` and Gemini CLI integration**: This is a complex step. It might involve:
    *   Creating a wrapper script in `vendor/nix/nixtract` that can call the main project's `boot.sh`.
    *   Defining a Nix package or `devShell` output in `vendor/nix/nixtract/flake.nix` that provides access to the Gemini CLI environment.
    *   The goal is to enable automated testing and interaction with `nixtract` using the Gemini CLI.

### Phase 3: Standalone Operation Verification

1.  **Build `nixtract` independently**: Verify that `nixtract` can be built and run successfully from within its submodule directory without relying on the main project's Nix environment, using `scripts/build_generic_nix_submodule.sh`.
2.  **Run tests**: Execute any existing or newly added tests within the `nixtract` submodule.

### Phase 4: Reporting and Finalization

1.  **Update `CRQ_002_Nixtract_Integration_and_Quality.md`**: Add associated commit hashes and any new findings.
2.  **Run Git Access Policy Check**: Execute `./rules/git_access/check.sh` to ensure all Git operations adhere to the new policy.
3.  **Update Main Project `flake.lock`**: Run `nix flake update` from the main project root to ensure all dependencies are in sync.
4.  **Commit changes**: Stage and commit all changes made during this task, linking them to CRQ-002.
5.  **Push changes**: Push the committed changes to the remote repository.

## Next Action

Start with Phase 1, Step 1: Navigate to `vendor/nix/nixtract` and list its contents.
