# Tutorial: Vendorizing and Forking Git Submodules

## Introduction

In a Nix-centric development environment, especially when working with a monorepo or a project that requires strict control over dependencies, it's often beneficial to "vendorize" external Git repositories as submodules. This tutorial will guide you through the process of adding an external Git repository as a submodule, ensuring it's forked under the `meta-introspector` organization, and configured to use a specific development branch (`feature/CRQ-016-nixify`).

## Learning Objectives

By the end of this tutorial, you will be able to:

*   Understand the concept of vendorizing Git submodules.
*   Use the `vendorize_and_fork_submodule.sh` script to automate the process.
*   Verify that a submodule has been correctly added, forked, and branched.
*   Troubleshoot common issues during the vendorization process.

## Prerequisites

*   A working Git installation.
*   `gh` (GitHub CLI) installed and authenticated with write access to the `meta-introspector` organization on GitHub.
*   The `pick-up-nix` project cloned to your local machine.

## Step-by-Step Guide

### Step 1: Understand the Need for Vendorization

Vendorizing a submodule means bringing a copy of an external repository directly into your project's version control. This provides several benefits:

*   **Reproducibility:** You control the exact version of the dependency, preventing unexpected changes from upstream.
*   **Offline Builds:** Once vendorized, you don't need external network access to build the dependency.
*   **Customization:** You can apply project-specific patches or modifications to the vendored code.
*   **Security:** You have more control over the supply chain of your dependencies.

### Step 2: Locate the `vendorize_and_fork_submodule.sh` Script

Navigate to the `scripts/` directory in your main project. You will find a script named `vendorize_and_fork_submodule.sh`.

```bash
cd /data/data/com.termux.nix/files/home/pick-up-nix2/
ls scripts/vendorize_and_fork_submodule.sh
```

### Step 3: Execute the Vendorization Script

For this tutorial, we will vendorize `flake-utils` from `numtide` and place it under `vendor/nix/flake-utils`.

Execute the script as follows:

```bash
./scripts/vendorize_and_fork_submodule.sh github:numtide/flake-utils vendor/nix/flake-utils
```

*   **`github:numtide/flake-utils`**: This is the original repository you want to vendorize.
*   **`vendor/nix/flake-utils`**: This is the local path within your project where the submodule will be added.

*   **Expected Output:**
    The script will output messages indicating its progress, including adding the submodule, setting up remotes, fetching branches, and pushing to your `meta-introspector` fork. You might be prompted by `gh cli` if it needs to create a fork.

### Step 4: Verify the Submodule Integration

After the script completes, verify the submodule has been correctly added and configured:

1.  **Check `git status`**: You should see changes related to the new submodule.
    ```bash
git status
    ```
2.  **Check `.gitmodules`**: Confirm that the new submodule entry is present.
    ```bash
cat .gitmodules
    ```
3.  **Navigate into the submodule and check its remotes and branch**: 
    ```bash
cd vendor/nix/flake-utils
git remote -v
git branch
    ```
    You should see `meta-introspector` as a remote and be on the `feature/CRQ-016-nixify` branch.

### Step 5: Update `flake.nix` to Use the Local Submodule

Now that `flake-utils` is vendorized, you should update any `flake.nix` files that were using the external `flake-utils` input to point to your local submodule instead. For example, in `vendor/nix/nixtract/flake.nix`, you would change:

```nix
flake-utils.url = "github:numtide/flake-utils";
```

to:

```nix
flake-utils.url = "../../flake-utils"; # Relative path from nixtract to flake-utils
```

Or, if the main project's `flake.nix` is managing the submodule, you might use a path relative to the main project.

### Step 6: Run `nix flake update`

After updating the `flake.nix` to use the local submodule, run `nix flake update` to ensure the `flake.lock` file is updated correctly.

```bash
nix flake update
```

## Troubleshooting Common Issues

*   **`gh` CLI not authenticated:** Run `gh auth login` to authenticate with GitHub.
*   **Forking issues:** Ensure you have the necessary permissions in the `meta-introspector` organization.
*   **Branch not found:** If the `feature/CRQ-016-nixify` branch doesn't exist in the `meta-introspector` fork, you might need to create it manually and push it.

## Conclusion

You have successfully vendorized and forked a Git submodule, integrating it into your project's controlled environment. This practice enhances reproducibility and allows for project-specific modifications.

## Related Documentation

*   [SOP: Vendorizing and Forking a Git Submodule](docs/sops/SOP_Vendorize_And_Fork_Submodule.md)
*   [SOP: Building a Generic Nix Submodule](docs/sops/SOP_Build_Generic_Nix_Submodule.md)
*   [CRQ-002: Nixtract Integration and Quality](docs/crqs/CRQ_002_Nixtract_Integration_and_Quality.md)
