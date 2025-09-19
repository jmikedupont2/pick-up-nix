## Gemini Added Memories
- The user wants to keep the file '.git_commit_message.txt' in the project root directory and prefers to use the '-F' flag for git commits, always.
- User prefers to use 'git status --ignore-submodules' for speed (30 sec).
- Rust toolchain management is handled via `shell.nix` using the `master` branch of `nixpkgs`.

## Operational Principle
- Always Observe and Orient before Deciding and Acting. Check first.

## Submodule Nixification Task Summary (CRQ-016)

This section summarizes the recent work on standardizing and integrating Nix flakes across the project's submodules, particularly those under `vendor/nix/`.

**Key Outcomes:**
*   **Standardized `flake.nix`**: All `vendor/nix/*` submodules now have a consistent `flake.nix` generated from `scripts/flake.template`.
*   **Automated Workflow**: A suite of scripts (`scripts/branch_and_push_all.sh`, `scripts/commit_and_push_flakes.sh`, `scripts/commit_crq_submodule.sh`, `scripts/fix_submodule.sh`, `scripts/inject_submodule_env.sh`, `scripts/nixify.sh`, `scripts/nixify_vendor_nix.sh`, `scripts/commit_workflow.sh`) has been developed and documented to automate the Nixification process.
*   **Root `flake.nix` Refactoring**: The main project's `flake.nix` now aggregates submodule flakes via a local `vendor/nix/flake.nix`, improving modularity.
*   **Dedicated Branching**: Changes were applied on a dedicated `feature/CRQ-016-nixify` branch within each submodule.
*   **Documentation**: Comprehensive CRQ (CRQ-016), SOP, and a tutorial (`docs/tutorials/Submodule_Nixification_Tutorial.md`) have been created to guide future maintenance and development.

**Relevant Directories and Files:**
*   `vendor/nix/`: Contains the aggregated `flake.nix` and individual submodule `flake.nix` files.
*   `scripts/`: Houses all automation scripts for the Nixification process.
*   `docs/crqs/`: Contains the CRQ document for this task.
*   `docs/sops/`: Contains the SOP document for this task.
*   `docs/tutorials/`: Contains the tutorial for this task.