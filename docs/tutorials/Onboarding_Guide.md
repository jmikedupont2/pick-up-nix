# Onboarding Guide: Getting Started with the Nixified Project

Welcome to the project! This guide will help you get started with our Nix-powered development environment and understand the project's structure and workflows.

## 1. Welcome to the Project

This project leverages Nix and Nix Flakes to provide a reproducible and consistent development environment across all contributors. We use Git submodules extensively, and many of them are now "Nixified" to ensure their dependencies and development shells are managed by Nix.

## 2. What is Nix and Nix Flakes?

Nix is a powerful package manager that enables reproducible builds and declarative system configurations. Nix Flakes are a new, experimental feature of Nix that simplify dependency management and project setup by providing a standardized way to define project inputs and outputs.

*   **Reproducibility:** Nix ensures that your development environment is identical to everyone else's, eliminating "it works on my machine" issues.
*   **Declarative Configuration:** You define your environment and dependencies in `flake.nix` files, and Nix handles the rest.

For a deeper dive into Nix and Nix Flakes, refer to the official Nix documentation and our internal `docs/FLAKE_TUTORIAL.md`.

## 3. Project Structure Overview

Our project has a modular structure. Key directories include:

*   `flake.nix`: The main project flake, defining overall inputs and outputs.
*   `home/`: Contains Home Manager configurations for different user environments.
*   `configurations/`: Top-level NixOS/Home Manager modules.
*   `vendor/nix/`: This is a crucial directory! It aggregates Nix-related submodules, each with its own `flake.nix`.
*   `scripts/`: Automation scripts for various tasks, including submodule management and Nixification.
*   `docs/`: Project documentation, including SOPs, CRQs, and other tutorials.
*   `index/`: Stores generated status reports and file indices.

For a more detailed overview of the repository structure, please see the main `README.md`.

## 4. Setting up Your Development Environment

Follow these steps to get your development environment ready. We will primarily use helper scripts to streamline the process.

### Prerequisites

*   **Nix Installation:** Install Nix on your system. Follow the official Nix installation guide.
*   **Nix Flakes Enabled:** Enable Nix flakes by adding `experimental-features = nix-command flakes` to your `nix.conf` file (e.g., `/etc/nix/nix.conf` or `~/.config/nix/nix.conf`).

### Cloning and Initializing

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/jmikedupont2/pick-up-nix.git
    cd pick-up-nix
    ```

2.  **Initialize and Update Submodules:** This step is critical as many project components are submodules. This command will fetch all submodules and check out their correct versions.
    ```bash
    git submodule update --init --recursive
    ```

3.  **Nixify Submodules:** To ensure all relevant submodules have their `flake.nix` files and are integrated into the Nix ecosystem, run the Nixification script. This script will create or update `flake.nix` files in submodules under `vendor/nix/`.
    ```bash
    bash scripts/nixify_vendor_nix.sh --apply
    ```

4.  **Commit Submodule Changes:** After Nixifying, commit any changes within the submodules (e.g., newly created `flake.nix` files) and push them to their remotes. This script automates that process.
    ```bash
    bash scripts/commit_all_submodule_changes.sh
    ```

## 5. Working with Nixified Submodules

Each Nixified submodule under `vendor/nix/` has its own `flake.nix` that defines its development environment. You can enter a submodule's development shell directly:

```bash
cd vendor/nix/your-submodule-name
nix develop
```

This will drop you into a shell with all the dependencies and tools defined in that submodule's `flake.nix`.

For a detailed guide on the submodule Nixification process, refer to `docs/tutorials/Submodule_Nixification_Tutorial.md`.

## 6. Common Commands and Status Checks

Here are some frequently used commands and scripts to check the project's status:

*   **Enter the main project's development shell:**
    ```bash
    nix develop
    ```
*   **Build a specific flake output (e.g., `asciinema`):**
    ```bash
    nix build ./vendor/external/asciinema
    ```
*   **Get a comprehensive status report (main repository and submodules):**
    ```bash
    bash scripts/recover.sh
    ```
    This script will generate `index/gitstatus.txt` (for the main repo) and `index/submodules_status.txt` (for all submodules).

*   **Check Git status for the main repository (ignoring submodules):**
    ```bash
    bash scripts/gitstatus.sh
    ```
    The output will be saved to `index/gitstatus.txt`.

*   **Check Git status for all submodules:**
    ```bash
    bash scripts/generate_submodule_status.sh
    ```
    The output will be saved to `index/submodules_status.txt`.

## 7. Where to Find More Information

*   **Project Overview:** `README.md`
*   **Standard Operating Procedures (SOPs):** `docs/sops/` (e.g., `docs/sops/SOP_Submodule_Nixification.md`)
*   **Change Request Documents (CRQs):** `docs/crqs/` (e.g., `docs/crqs/CRQ_016_Flake_Refactor_and_Nixify.md`)
*   **Other Tutorials:** `docs/tutorials/`
*   **Nix Documentation:** [https://nixos.org/manual/nix/stable/](https://nixos.org/manual/nix/stable/)

We encourage you to explore the documentation and don't hesitate to ask questions!