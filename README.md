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

