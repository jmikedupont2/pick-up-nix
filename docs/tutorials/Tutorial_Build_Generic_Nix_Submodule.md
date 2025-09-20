# Tutorial: Building Generic Nix Submodules

## Introduction

This tutorial guides you through the process of building a Nix-enabled Git submodule. Understanding how to build submodules independently is crucial for developing and testing components in isolation, ensuring their quality and reusability.

## Learning Objectives

By the end of this tutorial, you will be able to:

*   Understand the purpose of building Nix submodules independently.
*   Use the provided script to build a generic Nix submodule.
*   Interpret the output of a successful Nix build.
*   Troubleshoot common build issues.

## Prerequisites

*   A working Nix installation with `nix-command` and `flakes` experimental features enabled.
*   Basic familiarity with Git submodules.
*   The `pick-up-nix` project cloned and its submodules initialized and updated.

## Step-by-Step Guide

### Step 1: Ensure Submodules are Initialized and Updated

Before you can build a submodule, ensure that all submodules in your project are correctly initialized and updated. From the root of your `pick-up-nix` project, run:

```bash
git submodule update --init --recursive
```

This command fetches any missing submodules and checks out the correct commits for them.

### Step 2: Locate the `build_generic_nix_submodule.sh` Script

Navigate to the `scripts/` directory in your main project. You will find a script named `build_generic_nix_submodule.sh`.

```bash
cd /data/data/com.termux.nix/files/home/pick-up-nix2/
ls scripts/build_generic_nix_submodule.sh
```

### Step 3: Execute the Build Script

The `build_generic_nix_submodule.sh` script takes one argument: the relative path to the Nix submodule from the project root. It also accepts an optional `--offline` flag.

Execute the script as follows:

```bash
./scripts/build_generic_nix_submodule.sh [--offline] vendor/nix/my-submodule
```

*   `vendor/nix/my-submodule`: This is an example relative path to a Nix submodule from the project root.

*   **Expected Output:**
    You will see output indicating the build process. If successful, you should see messages similar to:
    ```
    Attempting to build Nix submodule at: /data/data/com.termux.nix/files/home/pick-up-nix2/vendor/nix/my-submodule
    --- Nix Build Plan (Dry Run) ---
    ... (Nix dry run output) ...
    --- Starting Actual Nix Build ---
    ... (Nix build output) ...
    Nix submodule built successfully!
    You can find the result in: /nix/store/...-my-submodule-...
    ```

### Step 4: Verify the Build Result

After a successful build, Nix creates a symlink named `result` in the directory where the `nix build` command was executed (in this case, the project root). This `result` symlink points to the built package in the Nix store.

You can inspect the contents of the built package. For example, if the submodule builds an executable named `my-tool`:

```bash
ls -l result/bin/my-tool
```

### Step 5: Run the Built Tool (Optional)

You can now run the independently built tool directly:

```bash
./result/bin/my-tool --help
```

This will display the help message for the tool, confirming that it was built and is executable.

## Troubleshooting Common Issues

*   **"Usage: ..." error from the script:** Make sure you provide the path to the Nix submodule as an argument to the `build_generic_nix_submodule.sh` script.
*   **Nix build failures:** Read the error messages carefully. Common causes include:
    *   **Missing dependencies:** Ensure your `flake.lock` is up-to-date (`nix flake update`).
    *   **Syntax errors in `flake.nix`:** Double-check the `flake.nix` file in the submodule.
    *   **Network issues:** Verify your internet connection if Nix is trying to fetch external resources. If using `--offline`, ensure all dependencies are available locally.
*   **`nix-command` or `flakes` not enabled:** Add `experimental-features = nix-command flakes` to your `nix.conf`.

## Conclusion

You have successfully built a Nix submodule independently using Nix. This process demonstrates how to ensure the standalone operation of submodules, which is a key aspect of maintaining a robust and modular Nix project.

## Related Documentation

*   [SOP: Building a Generic Nix Submodule](docs/sops/SOP_Build_Generic_Nix_Submodule.md)
*   [SOP: Nixtract Usage and Graph Generation](docs/sops/SOP_Nixtract_Usage.md)
*   [CRQ-002: Nixtract Integration and Quality](docs/crqs/CRQ_002_Nixtract_Integration_and_Quality.md)
