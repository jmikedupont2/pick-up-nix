# Nix and Pre-commit Setup Documentation

This document outlines the configuration and usage of Nix and pre-commit hooks within this project, ensuring code quality, consistency, and adherence to project standards.

## 1. Pre-commit Hooks Configuration

The project utilizes `pre-commit` to enforce various checks and formatting rules before code is committed. The primary configuration file for pre-commit hooks is located at:

`/data/data/com.termux.nix/files/home/pick-up-nix2/source/github/meta-introspector/streamofrandom/2025/09/27/7-concepts/1-build-system/.pre-commit-config.yaml`

This configuration includes a mix of local hooks and external hooks from `meta-introspector` repositories.

### 1.1. Local Hooks

The following hooks are defined locally and executed within the Nix development environment:

*   **`nixpkgs-fmt`**: Automatically formats Nix files to ensure consistent styling. This aligns with the "Pattern Discernment" (bott 5) principle by standardizing the structure of Nix expressions.
    *   `files: \.nix$`
*   **`statix`**: Performs static analysis on Nix files to identify potential issues and enforce best practices. This contributes to "Verification and Testing" (bott 10) and "Error Analysis" (bott 9).
    *   `files: \.nix$`
*   **`shellcheck`**: Lints shell scripts to catch common errors and ensure adherence to best practices. This aids in "Verification and Testing" (bott 10).
    *   `files: \.sh$`
*   **`crq-commit-msg-check`**: Enforces a specific format for commit messages, requiring them to start with a Change Request (CRQ) number (e.g., `CRQ-123:`). This promotes clear communication and traceability.
    *   `entry: /data/data/com.termux.nix/files/home/pick-up-nix2/source/github/meta-introspector/streamofrandom/2025/09/27/7-concepts/5-scripts-automation/crq_commit_msg_check.sh`
    *   `stages: [commit-msg]`
*   **`crq-document-check`**: Verifies the existence of CRQ documents referenced in commit messages within the `docs/crqs/` directory. This ensures that all referenced CRQs are properly documented.
    *   `entry: /data/data/com.termux.nix/files/home/pick-up-nix2/source/github/meta-introspector/streamofrandom/2025/09/27/7-concepts/5-scripts-automation/crq_document_check.sh`
    *   `stages: [commit-msg]`
*   **`script-sop-check`**: Checks if scripts (`.sh`, `.py`, `.rs`, `.nix`) have corresponding Standard Operating Procedure (SOP) documentation.
    *   `entry: /data/data/com.termux.nix/files/home/pick-up-nix2/source/github/meta-introspector/streamofrandom/2025/09/27/7-concepts/5-scripts-automation/script_sop_check.sh`
    *   `files: \.(sh|py|rs|nix)$`
*   **`lint-staged`**: Runs linters on staged Git files, improving the quality of commits by ensuring only linted code is committed.
    *   `entry: lint-staged`
    *   `always_run: true`

### 1.2. External Hooks

The project integrates pre-commit hooks from external `meta-introspector` repositories:

*   **`meta-introspector/pre-commit-hooks-collection`**: Provides a collection of general-purpose pre-commit hooks.
    *   `repo: https://github.com/meta-introspector/pre-commit-hooks-collection`
    *   `rev: c58fa2b`
*   **`meta-introspector/vale-precommit`**: Integrates `vale`, a prose linter, to check writing style, grammar, and tone in documentation and other text files.
    *   `repo: https://github.com/meta-introspector/vale-precommit`
    *   `rev: feature/CRQ-016-nixify`

## 2. Nix Configuration

The project leverages Nix flakes to provide a reproducible and consistent development environment. There are two primary `flake.nix` files that define the project's Nix setup:

### 2.1. Project Root `flake.nix`

**Location:** `/data/data/com.termux.nix/files/home/pick-up-nix2/flake.nix`

**Purpose:** This flake defines the overall development environment for Rust projects within the repository.

**Key Features:**

*   **Inputs:**
    *   `nixpkgs`: Pinned to `github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify` for consistent package versions.
    *   `flake-utils`: Pinned to `github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify` for flake utility functions.
    *   `naersk`: Pinned to `github:meta-introspector/naersk?ref=feature/CRQ-016-nixify` for building Rust projects with Nix.
    *   `my-new-flake`: A local flake input.
*   **Packages:**
    *   `logAnalyzer`: A Rust package built using `naersk`.
    *   `my-new-flake`: Package from the local `my-new-flake` input.
*   **Applications:**
    *   `log-analyzer`: An executable application derived from the `logAnalyzer` package.
*   **Development Shell (`devShells.default`):** Provides a comprehensive development environment including:
    *   `rustVersions.nightly_2025_09_16`: A pinned nightly Rust toolchain.
    *   `which`, `gawk`, `jq`, `asciinema`, `ncurses`, `vale`: Essential command-line utilities and the `vale` prose linter.
*   **Rust Versions:** Defines and exposes specific Rust toolchains (stable and a pinned nightly version) for consistent builds and testing.

### 2.2. Build System `flake.nix`

**Location:** `/data/data/com.termux.nix/files/home/pick-up-nix2/source/github/meta-introspector/streamofrandom/2025/09/27/7-concepts/1-build-system/flake.nix`

**Purpose:** This flake specifically focuses on providing the tools necessary for the pre-commit hooks and general build system utilities.

**Key Features:**

*   **Inputs:**
    *   `nixpkgs`: Pinned to `github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify`.
    *   `flake-utils`: Pinned to `github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify`.
*   **Development Shell (`devShells.default`):** Configured to include all tools required by the pre-commit hooks and other build processes:
    *   `pre-commit`: The `pre-commit` framework itself.
    *   `nixpkgs-fmt`: Nix formatter.
    *   `statix`: Nix static analyzer.
    *   `shellcheck`: Shell script linter.
    *   `@commitlint/cli`: Command-line interface for commit message linting.
    *   `vale`: Prose linter.
    *   `nodejs`: Required for `lint-staged`.
    *   `vendoredLintStaged`: A locally vendored version of `lint-staged`.
*   **Checks:**
    *   `simple-test`: A basic check to verify the flake's functionality.
*   **Packages:**
    *   `vendoredLintStaged`: The vendored `lint-staged` package is exposed.

## 3. Git Submodule Management for Nix-related Repositories

The project centrally manages a significant number of Nix-related repositories as Git submodules. These submodules are defined in the main `.gitmodules` file at the project root (`/data/data/com.termux.nix/files/home/pick-up-nix2/.gitmodules`).

This approach allows for:

*   **Centralized Dependency Management:** All external Nix-related dependencies are declared and managed in a single location.
*   **Version Control:** Specific versions (commits) of these external repositories are pinned, ensuring reproducibility and stability.
*   **Local Modifications:** The ability to make local modifications or patches to vendored dependencies within the `meta-introspector` forks, aligning with the project's policy of using `github:meta-introspector` for all external Nix flake inputs.

Many of these submodules are located under the `vendor/nix/` and `source/github/meta-introspector/` directories, and they often contain their own `flake.nix` files, contributing to the overall Nix ecosystem of the project.

## 4. Setup and Usage

To ensure the pre-commit hooks and Nix development environment are correctly set up:

1.  **Install Nix:** Follow the official Nix installation instructions.
2.  **Enable Flakes:** Ensure Nix flakes are enabled in your Nix configuration.
3.  **Initialize and Update Submodules:** After cloning the main repository, initialize and update the submodules:
    ```bash
    git submodule update --init --recursive
    ```
4.  **Enter Development Shell:** Navigate to the project root and run `nix develop` to enter the development environment. This will make all the tools defined in the `devShells.default` of both `flake.nix` files available in your shell.
5.  **Install Pre-commit Hooks:** From within the `nix develop` shell, run `pre-commit install` to set up the Git hooks.

This setup ensures that all contributions adhere to the project's quality and documentation standards, leveraging the reproducibility and power of Nix.
