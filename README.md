# My Nix Configurations

This repository contains my personal Nix configurations for my desktop (NixOS) and Android (`nix-on-droid`) environments. The entire setup is managed centrally via a single `flake.nix`.

## Repository Structure

The repository is organized to separate concerns between system-level configuration, user-level packages, and development shells.

-   `flake.nix`: The heart of the configuration. It defines all inputs (like `nixpkgs` and `nix-on-droid`), manages overlays, and exposes the final system configurations and packages.
-   `shell.nix`: A standalone, non-flake development shell for quick tasks. Note: This provides an environment separate from the main flake configurations.
-   `configurations/`: Contains the top-level configurations for each target system.
    -   `desktop.nix`: The main module for the NixOS desktop system.
    -   `android.nix`: The main module for the `nix-on-droid` mobile environment.
-   `.config/home-manager/`: Contains user-level configuration that can be shared across systems, managed by Home Manager.
-   `.config/nix/`: Contains a detailed, standalone Nix-based configuration for Emacs.

## Usage

### Building Systems

To apply a system configuration, run the appropriate command from the root of this repository:

**NixOS (Desktop):**

```bash
sudo nixos-rebuild switch --flake .#desktop
```

**Nix-on-Droid (Android):**

```bash
nix-on-droid switch --flake .#android
```

### Development Shells

There are two provided shell environments:

**1. Flake Development Shell (Recommended)**

The flake exposes a development shell that includes the common packages. This is the most consistent way to enter a development environment that matches the project's settings.

```bash
nix develop
```

**2. Legacy Shell**

A simple, standalone shell is defined in `shell.nix`.

```bash
nix-shell
```

## Package Management

Packages are added to the system in different locations depending on their purpose:

-   **Common Packages:** To make a package available to both `desktop` and `android` systems, add it to the `commonPackages` set within `flake.nix`.
-   **Desktop-only System Packages:** Add the package to `environment.systemPackages` in `configurations/desktop.nix`.
-   **Android-only System Packages:** Add the package to `environment.packages` in `configurations/android.nix`.
-   **User-specific Packages:** User-level packages should be added to the `home.packages` list in `.config/home-manager/home.nix`.