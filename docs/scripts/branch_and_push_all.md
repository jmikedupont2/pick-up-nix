## `scripts/branch_and_push_all.sh` Documentation

This script automates the process of creating a `flake.nix` file from a template, committing it, and pushing it to a new branch in multiple Git submodules. It's designed to standardize `flake.nix` across several repositories under the `meta-introspector` GitHub organization.

**Key Features:**
*   **Configuration**: Defines the branch name (`feature/CRQ-016-nixify`), CRQ number (`016`), commit description (`Standardize flake.nix from template`), and the path to the `flake.template` file.
*   **GitHub CLI Check**: Verifies the presence of the `gh` (GitHub CLI) tool, which is essential for repository operations like forking.
*   **Template Validation**: Ensures the `flake.template` file exists before proceeding.
*   **Submodule Discovery**: Identifies relevant submodules by parsing `flake.nix` for `github:meta-introspector` entries. It assumes these correspond to submodules located under `vendor/nix/`.
*   **Nixification**: For each identified submodule:
    *   It backs up any existing `flake.nix` file.
    *   Creates a new `flake.nix` file using the content of `scripts/flake.template`.
*   **Git Operations**: Within each submodule's directory:
    *   Creates and switches to a new Git branch (`feature/CRQ-016-nixify`).
    *   Stages and commits the newly created `flake.nix` with a standardized commit message including the CRQ number. It uses `--no-verify` to bypass pre-commit hooks.
    *   Handles Git remotes: If the `origin` remote doesn't point to `meta-introspector`, it renames `origin` to `upstream` and adds `meta-introspector` as the new `origin`.
    *   Forks the repository to the `meta-introspector` organization if it doesn't already exist.
    *   Pushes the new branch to the `origin` remote.

**Usage**:
This script is intended to be run from the project root directory. It iterates through specific submodules, applies a `flake.nix` template, and manages Git branching and pushing for each.
