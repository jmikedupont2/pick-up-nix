# Tutorial: Submodule Nixification and Flake Refactoring

This tutorial guides you through the process of standardizing and integrating Nix flakes across your project's submodules, specifically those under the `vendor/nix/` directory. By the end of this tutorial, you will have a consistent, reproducible, and automated approach to managing Nix environments within your submodules.

## Prerequisites

Before you begin, ensure you have the following:

*   A working Git environment with access to the project repository.
*   `nix` package manager installed and configured.
*   `gh` (GitHub CLI) installed and authenticated.
*   Basic understanding of Git and Nix flake concepts.
*   The `scripts/` directory in your project contains the necessary automation scripts (documented in `docs/scripts/`).
*   The `scripts/flake.template` file exists and contains the desired base `flake.nix` structure.

## Step 1: Initial Setup and Verification

1.  **Navigate to Project Root**: Open your terminal and navigate to the root directory of your main project.

    ```bash
    cd /path/to/your/project
    ```

2.  **Review `flake.template`**: Ensure that `scripts/flake.template` contains the desired standard `flake.nix` content for your submodules. This template will be used to create or update `flake.nix` files in each submodule.

    ```bash
    cat scripts/flake.template
    ```

3.  **Verify Automation Scripts**: Confirm that all necessary scripts in your `scripts/` directory are present and executable. You can list them and check permissions:

    ```bash
    ls -l scripts/
    ```

## Step 2: Applying Nixification to Submodules

This step involves using the automation scripts to create or update `flake.nix` files in your submodules and then committing these changes.

1.  **Perform a Dry Run (Optional but Recommended)**: Before making any changes, run the `nixify_vendor_nix.sh` script in dry-run mode. This will show you what changes would be made without actually applying them.

    ```bash
    ./scripts/nixify_vendor_nix.sh
    ```

    Review the output carefully to understand the proposed modifications to your `flake.nix` files in the `vendor/nix/` submodules.

2.  **Apply Nixification Changes**: If the dry-run output is satisfactory, execute the script with the `--apply` flag to create or update the `flake.nix` files in the submodules.

    ```bash
    ./scripts/nixify_vendor_nix.sh --apply
    ```

    This command will:
    *   Discover all submodules under `vendor/nix/` that contain a `flake.nix` file.
    *   For each submodule, it will create a `flake.nix` (if missing) or update an existing one using the content from `scripts/flake.template`.
    *   Existing `flake.nix` files will be backed up to `flake.nix.bak` before being overwritten.

3.  **Commit and Push Submodule Changes**: After the `flake.nix` files have been created/updated, you need to commit these changes within each submodule and push them to their respective remote repositories. The `commit_and_push_flakes.sh` script automates this process.

    ```bash
    ./scripts/commit_and_push_flakes.sh
    ```

    This script will perform the following actions for each affected submodule:
    *   **Branch Management**: It will ensure that a dedicated feature branch named `feature/CRQ-016-nixify` is checked out. If this branch does not exist, it will be created.
    *   **Commit Changes**: It will commit the `flake.nix` changes (and any other staged changes within the submodule) using a CRQ-prefixed commit message.
    *   **Remote Handling**: It will ensure the `origin` remote points to the `meta-introspector` organization and will fork the repository if necessary.
    *   **Push Changes**: It will push the new branch and an "alpha" tag to the submodule's remote repository.

## Step 3: Verifying Changes

It's crucial to verify that the Nixification process has been applied correctly.

1.  **Check Git Status**: Confirm that all changes are committed and that your submodules are on the correct branches.

    ```bash
    git status
    git submodule foreach 'git status'
    ```

2.  **Inspect `flake.nix` files**: Manually inspect a few `flake.nix` files in the `vendor/nix/*` submodules to ensure they match the `flake.template` and contain the expected content.

    ```bash
    cat vendor/nix/your-submodule-name/flake.nix
    ```

3.  **Test `nix develop`**: Enter the development shell of one or more submodules to ensure the Nix environment is functional and includes the expected tools.

    ```bash
    cd vendor/nix/nixtract
    nix develop
    # Verify tools like bash, git, shellcheck are available
    which bash
    which git
    which shellcheck
    exit
    ```

## Step 4: Root `flake.nix` Integration

Ensure your main project's `flake.nix` is configured to use the newly aggregated submodule flakes.

1.  **Update Root `flake.nix`**: The root `flake.nix` should now reference `vendor/nix/flake.nix` as a local input, rather than individual GitHub URLs for each submodule. This step was part of the CRQ implementation and should already be done.

    ```nix
    # Example of updated input in root flake.nix
    inputs = {
      # ... other inputs ...
      vendor-nix-flakes.url = "./vendor/nix";
    };

    outputs = { self, nixpkgs, flake-utils, vendor-nix-flakes, ... }@inputs:
      let
        nix-tool-inputs = with vendor-nix-flakes; [
          nixtract-flake
          nix-flake
          # ... other submodule flakes ...
        ];
        # ... rest of your outputs ...
      };
    ```

2.  **Commit Root `flake.nix` Changes**: Ensure any changes made to the root `flake.nix` in the main repository are committed.

## Troubleshooting

*   **"No meta-introspector repositories found"**: If `nixify_vendor_nix.sh` or `commit_and_push_flakes.sh` fails with this error, ensure the scripts are updated to correctly discover submodules by finding `flake.nix` files in `vendor/nix` subdirectories (as per CRQ-016 modifications).
*   **Git Push Rejected**: If a `git push` operation is rejected, it likely means the remote repository has changes not present locally. Ensure the correct branch (`feature/CRQ-016-nixify`) is checked out in the submodule. The scripts are designed to create new branches to avoid this, but conflicts can still occur if the remote branch already exists with different history.
*   **`flake.nix.bak` files**: These are backups of previous `flake.nix` files. Review them if unexpected changes occurred or if you need to revert to a previous state.

This concludes the tutorial on Submodule Nixification and Flake Refactoring. You now have a standardized and automated way to manage Nix environments in your submodules!