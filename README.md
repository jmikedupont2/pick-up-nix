# My Nix Configurations

This repository contains my personal Nix configurations for Android (`nix-on-droid`) and other Linux systems (Ubuntu, GitHub Actions), managed via a central `flake.nix`.

The configuration is modular, allowing different package sets to be composed for different use cases.

## Getting Started with Nixification (CRQ-016)

This section provides a quick guide to setting up and using this Nix configuration project, with a focus on the new submodule Nixification workflow.

### Prerequisites

*   **Nix Installation:** Ensure you have Nix installed on your system. If not, follow the official Nix installation guide.
*   **Nix Flakes Enabled:** Make sure Nix flakes are enabled. You can enable them by adding `experimental-features = nix-command flakes` to your `nix.conf` file (usually located at `/etc/nix/nix.conf` or `~/.config/nix/nix.conf`).
*   **Rust Toolchain (Nix-managed):** The project's Rust components are managed via Nix. Ensure you are in a `nix-shell` environment that provides the necessary Rust toolchain (e.g., by running `nix-shell` in the project root).

### 1. Clone the Repository

If you haven't already, clone this repository to your local machine:

```bash
git clone https://github.com/jmikedupont2/pick-up-nix.git
cd pick-up-nix
```

### 2. Initialize and Update Submodules

This project heavily relies on Git submodules, many of which are now Nixified. To ensure you have all necessary components and their Nix flakes are properly set up, run the following:

```bash
git submodule update --init --recursive
bash scripts/update_submodule_flakes.sh # This script will ensure all submodules have their flake.nix
```

### 3. Apply the Nix-on-Droid Configuration

To apply the Nix configuration to your Android device (via Nix-on-Droid), or to other Linux systems, refer to the detailed instructions in the "Building Configurations" section below.

For Nix-on-Droid, the primary command you'll use is:

```bash
nix-on-droid switch --flake .#android
```

## Repository Structure

-   `flake.nix`: The heart of the configuration. It defines all inputs, manages overlays, and exposes the final system and home configurations.
-   `home/`: Contains modular Home Manager configurations for different package sets.
    -   `base.nix`: Core utilities needed in all environments.
    -   `emacs.nix`: Standalone Emacs package.
    -   `scientific.nix`: Toolchains for Coq, OCaml, and Haskell.
-   `configurations/`: Contains top-level modules imported by the flake.
    -   `android.nix`: Base configuration for the `nix-on-droid` mobile environment.
-   `.config/home-manager/`: Contains shared user-level settings managed by Home Manager.
-   `shell.nix`: A standalone, non-flake development shell for quick tasks, now managing the Rust toolchain.
-   `pick-up-nix-cli/`: Contains the Rust-based CLI application, including the `tracenix` command.
-   `vendor/nix/`: **New in CRQ-016.** This directory serves as the central aggregation point for Nix-related submodules. Its `flake.nix` collects and exposes the `flake.nix` files from its subdirectories, simplifying the root project's `flake.nix`.
-   `scripts/`: Contains automation scripts for various tasks, including submodule management and Nixification.
-   `index/`: Stores generated status reports and file indices, such as `submodules_status.txt` and `gitstatus.txt`.

## Usage

### Building Configurations

To apply a configuration, run the appropriate command from the root of this repository:

**Nix-on-Droid (Android):**

```bash
nix-on-droid switch --flake .#android
```

**Home Manager (Ubuntu, etc.)**

You can build and activate a user environment on any Linux system using `home-manager`.

First, choose a profile based on your needs:
-   `github-runner`: Minimal profile for CI.
-   `linux-dev`: Standard development environment with Emacs.
-   `linux-sci`: Full scientific environment with all packages.

Then, run the switch command (replace `linux-dev` with your chosen profile):

```bash
home-manager switch --flake .#linux-dev
```
*Note: This assumes your local username is `user`. You may need to adjust `flake.nix` if your username is different.*

### Using `tracenix`

The `tracenix` command is a Rust-based CLI tool for tracing Nix commands. It's part of the `pick-up-nix-cli` package.

To run `tracenix`, ensure you are in a `nix-shell` environment (by running `nix-shell` in the project root) and then execute:

```bash
cargo run -p pick-up-nix-cli -- tracenix -- <NIX_COMMAND> [NIX_ARGUMENTS...]
```

**Example:** Trace `nix --version`

```bash
cargo run -p pick-up-nix-cli -- tracenix -- --version
```

For more details, refer to `docs/user_guide/tracenix_user_guide.md`.

## Package Management

Packages are managed by adding them to the appropriate module in the `home/` directory:

-   **Core Packages:** Add to `home/base.nix`.
-   **Emacs:** Managed in `home/emacs.nix`.
-   **Scientific Packages:** Add to `home/scientific.nix`.
-   **Shared Settings:** General settings (not packages) can be modified in `.config/home-manager/home.nix`.

## Livestreaming

We are livestreaming our development process on X (formerly Twitter) and other platforms. You can follow our progress and interact with us live at:

[https://x.com/introsp3ctor/status/1964663185539248630](https://x.com/introsp3ctor/status/1964663185539248630)

All our development steps are logged using `figlet` on the stream and written to a dedicated log stream.

### Social Media

Follow us on other platforms:

*   TikTok: [https://www.tiktok.com/@solfunmeme](https://www.tiktok.com/@solfunmeme)
*   Lemon8: Check out solfunmeme’s posts on Lemon8! [https://v.lemon8-app.com/al/OgsMsbfTMx](https://v.tiktok.com/@solfunmeme)
*   Linktree: [https://linktr.ee/h4km](https://linktr.ee/h4km)

## Building and Using `asciinema` Flake

This project includes a vendored `asciinema` flake. You can build it and use the resulting binary for recording terminal sessions.

To build the `asciinema` flake:

```bash
nix build ./vendor/external/asciinema
```

After a successful build, a symlink named `result` will be created in the root of this repository, pointing to the built `asciinema` package in the Nix store.

You can then use the `asciinema` executable located at `./result/bin/asciinema`. For example:

```bash
./result/bin/asciinema rec my_session.cast
```

## Task Status (CRQ-016: Submodule Nixification and Flake Refactoring)

This section provides an overview of the current status of CRQ-016.

*   **Submodule Nixification:** Completed. All relevant submodules have been processed to include `flake.nix` files and integrated into the main project's Nix ecosystem.
*   **Submodule Git Operations:** Completed. Submodule branches have been created/checked out, changes committed, and pushed to remotes.
*   **Main Repository Updates:** Completed. The main repository's `flake.lock`, `flake.nix`, and other relevant files have been updated, committed, and pushed.
*   **Documentation Updates:** In Progress. `GEMINI.md` and `README.md` are being updated. `docs/sops/` and `docs/tutorials/` are next.

# Emacs Integration

To work with Emacs within the Nix environment:

```bash
cd source/github/meta-introspector/git-submodules-rs-nix/.emacs.d/nix-magit/
nix run .#nix-magit
```

# Current Task Context

The current task is managed via `task.md` in the project root. Relevant prompts are located in `~/pick-up-nix2/source/github/meta-introspector/git-submodule-tools-rs/prompts/`.

# Rust Development

For Rust development within the Nix environment:

```bash
cd ~/nix2/vendor/external/rust/src/tools/nix-dev-shell
nix develop
```

Then, from the project root:

```bash
cd ~/nix2/
~/pick-up-nix2/gemini_cli_recent.sh
```

# Data and Status Reports

*   **Submodule Status:** Generated by `scripts/generate_submodule_status.sh`, which runs `git submodule foreach --recursive 'git status'` and saves to `index/submodules_status.txt`.
*   **Main Repository Git Status:** Generated by `scripts/gitstatus.sh`, which runs `git status --ignore-submodules` and saves to `~/pick-up-nix2/index/gitstatus.txt`.
*   **Nix Store Size:** Run `./scripts/nix_store_size.sh` to produce `~/nix2/index/sizes.txt`, containing the last scan of the Nix store for file sizes.

# High-Level Vision

## Core Vision: Self-Proving, Auditable AI

The central, unifying vision is the creation of "Self-Proving Intelligence" through a paradigm called "Extreme Nixism." This involves building systems that are not just driven by LLMs, but are self-creating, self-optimizing, and self-auditing. The key to this is encapsulating every step of the OODA (Observe, Orient, Decide, Act) loop within Nix derivations. This creates a reproducible, auditable, and verifiable record of the system's evolution.

## Key Initiatives

1.  **On-Chain Software Supply Chain Verification:** This initiative aims to create a system for producing cryptographically verifiable digital assets that represent software components. This involves using Nix to define dependencies, eBPF to trace build processes, and GPG to sign attestations. The ultimate goal is to mint these assets on a blockchain, creating a "proof-of-integrity" and a "proof-of-execution."

2.  **Nix-Introspector:** This is a tool that parses Nix expressions into a universal, intermediate representation (like S-expressions). This allows for interoperability between different package management systems and a deeper understanding of the underlying dependency "monad." The `observe` command is the first step in this initiative.

3.  **Formal Verification of Rust/WASM:** This initiative focuses on replacing TypeScript plugins in "ElizaOS" with formally verified Rust code compiled to WASM. The verification is to be done using the Lean 4 theorem prover, with a 42-step plan to ensure correctness and type compatibility.

## Underlying Philosophy

*   **Extreme Nixism:** The belief that every computational artifact, from a single command to an entire operating system, should be a pure, reproducible Nix derivation.
*   **The OODA Loop as a Derivation Chain:** The idea that the entire decision-making process of an AI system can be modeled as a chain of Nix derivations, making it fully auditable and reproducible.
*   **LLMs as Command Generators:** The concept of using LLMs not just to generate text, but to generate executable commands that can be run in a controlled, reproducible environment.
