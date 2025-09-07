# My Nix Configurations

This repository contains my personal Nix configurations for Android (`nix-on-droid`) and other Linux systems (Ubuntu, GitHub Actions), managed via a central `flake.nix`.

The configuration is modular, allowing different package sets to be composed for different use cases.

## Repository Structure

-   `flake.nix`: The heart of the configuration. It defines all inputs, manages overlays, and exposes the final system and home configurations.
-   `home/`: Contains modular Home Manager configurations for different package sets.
    -   `base.nix`: Core utilities needed in all environments.
    -   `emacs.nix`: Standalone Emacs package.
    -   `scientific.nix`: Toolchains for Coq, OCaml, and Haskell.
-   `configurations/`: Contains top-level modules imported by the flake.
    -   `android.nix`: Base configuration for the `nix-on-droid` mobile environment.
-   `.config/home-manager/`: Contains shared user-level settings managed by Home Manager.
-   `shell.nix`: A standalone, non-flake development shell for quick tasks.

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

## Package Management

Packages are managed by adding them to the appropriate module in the `home/` directory:

-   **Core Packages:** Add to `home/base.nix`.
-   **Emacs:** Managed in `home/emacs.nix`.
-   **Scientific Packages:** Add to `home/scientific.nix`.
-   **Shared Settings:** General settings (not packages) can be modified in `.config/home-manager/home.nix`.
