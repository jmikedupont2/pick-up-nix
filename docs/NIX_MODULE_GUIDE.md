# Nix Module Guide

This document outlines the new modular structure of the `flake.nix` and provides guidance on how to add and test new Nix modules, packages, and development environments.

## Overview of the New Structure

The main `flake.nix` has been refactored to improve organization and maintainability. Instead of a single monolithic file, it now composes smaller, specialized Nix files located in the `nix/` directory.

Key components are now separated:

- `nix/overlays.nix`: Defines Nixpkgs overlays.
- `nix/packages/default.nix`: Contains the `commonPackages` function, which defines various packages and derivations.
- `nix/nix-on-droid.nix`: Manages Nix-on-Droid specific configurations.
- `nix/home-configurations.nix`: Defines Home Manager configurations for different systems.
- `nix/devshells.nix`: Defines development shells.

These files are imported and composed within the main `flake.nix` using `builtins.import`.

## Adding New Modules and Packages

### Adding a New Package or Derivation

To add a new package or derivation, you should typically define it within `nix/packages/default.nix` inside the `commonPackages` function. This function takes `pkgs` (the Nixpkgs set) and `geminiCliSrc` (the source for `gemini-cli`) as arguments.

**Steps:**

1.  Open `nix/packages/default.nix`.
2.  Inside the `commonPackages = pkgs: geminiCliSrc: { ... };` attribute set, add your new package definition. Follow the existing patterns for defining derivations (e.g., `pkgs.stdenv.mkDerivation` for Rust projects, `pkgs.writeShellApplication` for shell scripts).

    Example (adding a simple `my-tool` shell script):
    ```nix
          my-tool = pkgs.writeShellApplication {
            name = "my-tool";
            runtimeInputs = [ pkgs.bash ];
            text = ''
              #!/usr/bin/env bash
              echo "Hello from my-tool!"
            '';
          };
    ```

3.  Ensure proper Nix syntax, including semicolons after each attribute definition (except the last one in a set).

### Adding a New Home Manager Module

Home Manager configurations are defined in `nix/home-configurations.nix` and `nix/nix-on-droid.nix`.

**Steps:**

1.  If your module is a general Home Manager configuration, add it to `nix/home-configurations.nix`.
2.  If it's specific to Nix-on-Droid, add it to `nix/nix-on-droid.nix`.
3.  Define your module as a Nix expression that returns an attribute set of Home Manager options.

    Example (adding a new Home Manager module in `home/my-module.nix`):
    ```nix
    { pkgs, ... }:

    {
      home.packages = with pkgs; [
        cowsay
      ];
      programs.bash.initExtra = "cowsay 'Moo!'";
    }
    ```

4.  Import your new module into the relevant `homeConfigurations` or `nixOnDroidConfigurations` block in `nix/home-configurations.nix` or `nix/nix-on-droid.nix` respectively.

    Example (importing `home/my-module.nix`):
    ```nix
                imports = [
                  ./.config/home-manager/home.nix
                  ./home/base.nix
                  ./home/emacs.nix
                  ./home/my-module.nix # Add your new module here
                ];
    ```

### Adding a New Development Shell

Development shells are defined in `nix/devshells.nix`.

**Steps:**

1.  Open `nix/devshells.nix`.
2.  Inside the `devShells = lib.genAttrs lib.systems.flakeExposed (system: { ... });` attribute set, add a new attribute for your development shell.

    Example (adding a new `my-dev-shell`):
    ```nix
    my-dev-shell = pkgs.mkShell {
      buildInputs = with pkgs; [
        nodejs
        yarn
      ];
      shellHook = ''
        echo "Welcome to my-dev-shell!"
      '';
    };
    ```

## Testing New Modules and Packages

After adding or modifying Nix modules, you can test them using the `nix` command-line tools.

### Building a Specific Package

To build a specific package defined in your flake, use `nix build` with the package's attribute path:

```bash
nix build .#<package-name>
```

Example (building `batch-task-processor`):

```bash
nix build .#batch-task-processor
```

### Entering a Development Shell

To enter a specific development shell defined in your flake, use `nix develop`:

```bash
nix develop .#<devshell-name>
```

Example (entering the default devShell):

```bash
nix develop
```

Example (entering `my-dev-shell` if you defined it):

```bash
nix develop .#my-dev-shell
```

### Running a Package Directly

If a package is an executable (e.g., a shell script or a compiled binary), you can run it directly using `nix run`:

```bash
nix run .#<package-name>
```

Example (running `batch-task-processor`):

```bash
nix run .#batch-task-processor -- <arguments-for-script>
```

### Checking Nix Syntax

To check for basic Nix syntax errors without building, you can use `nix flake check`:

```bash
nix flake check
```

This will evaluate your flake and report any syntax issues.

## Committing Changes

After making changes and verifying them, remember to commit your changes to Git:

```bash
git add .
git commit -m "feat: Add new module/package and update documentation"
```
