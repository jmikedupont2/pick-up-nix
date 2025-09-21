# Tutorial: Nix Development Basics

This tutorial provides a foundational understanding of Nix development within this project. It covers essential Nix concepts and commands necessary for working with our Nix-powered environment.

## 1. What is Nix and Nix Flakes?

Nix is a purely functional package manager that aims for reproducible and reliable software deployments. Nix Flakes are a new, experimental feature of Nix that simplify dependency management and project setup by providing a standardized way to define project inputs and outputs.

*   **Reproducibility:** Nix ensures that building a project always yields the same result, regardless of the environment.
*   **Declarative Configuration:** You define your development environment and dependencies in `flake.nix` files, and Nix handles the provisioning.
*   **Atomic Upgrades and Rollbacks:** Changes to your environment are atomic, meaning they either succeed completely or fail without affecting your existing setup. You can easily roll back to previous configurations.

## 2. Essential Nix Commands

### 2.1. Entering a Development Shell (`nix develop`)

The `nix develop` command is your primary entry point into a project's Nix-defined development environment. When you run `nix develop` in a directory containing a `flake.nix`, Nix will build and activate a shell with all the tools and dependencies specified in that `flake.nix`.

```bash
nix develop
```

*   **Purpose:** This command sets up your shell with the correct versions of compilers, libraries, and other tools needed for development, without polluting your system-wide environment.
*   **Exiting:** Type `exit` or press `Ctrl+D` to leave the development shell.

### 2.2. Building Project Components (`nix build`)

The `nix build` command is used to build specific outputs defined in a `flake.nix`. This can be a package, an application, or any other derivation.

```bash
nix build .#<attribute_path>
```

*   `.#`: Refers to the current directory's `flake.nix`.
*   `<attribute_path>`: Specifies the particular output you want to build (e.g., `packages.x86_64-linux.my-app`, `devShells.default`).

**Example: Building a specific tool (like `template-generator-bin`):**

```bash
nix build .#template-generator-bin
```

After a successful build, Nix creates a symlink named `result` in your current directory, pointing to the built output in the Nix store. You can then execute the built binary (e.g., `./result/bin/template-generator-bin`).

### 2.3. Running Commands Directly (`nix run`)

The `nix run` command allows you to run an executable defined in a flake without explicitly building it or entering a development shell. This is convenient for quick executions.

```bash
nix run .#<attribute_path> -- <arguments>
```

*   `--`: Separates arguments for `nix run` from arguments for the executable itself.

**Example: Running `tracenix`:**

```bash
nix run .#tracenix -- --version
```

### 2.4. Updating Flake Inputs (`nix flake update`)

To update the dependencies (inputs) of your `flake.nix` to their latest versions and record these new versions in `flake.lock`:

```bash
nix flake update
```

*   **Purpose:** Keeps your project's dependencies up-to-date while maintaining reproducibility through the `flake.lock` file.

## 3. Understanding `flake.nix` and `flake.lock`

*   **`flake.nix`**: This file declaratively defines your project's inputs (dependencies) and outputs (packages, applications, development shells). It's written in the Nix language.
*   **`flake.lock`**: This file precisely records the exact versions (Git commit hashes, content hashes) of all your flake inputs. This ensures that your builds are always reproducible, even if upstream repositories change.

**Important:** Always commit both `flake.nix` and `flake.lock` to your version control system.

## 4. Troubleshooting Common Nix Issues

*   **"Git tree is dirty"**: This often means you have uncommitted changes. Commit or stash your changes before running Nix commands that build or update flakes.
*   **"No such file or directory" for a source:** Ensure the `src` attribute in your `flake.nix` correctly points to the source directory and that the source is properly tracked by Git.
*   **Build failures after `nix flake update`:** An updated dependency might have introduced breaking changes. You may need to pin the dependency to an older version in `flake.nix` or adapt your code.

## 5. Related Documentation

*   `docs/tutorials/Onboarding_Guide.md`
*   `docs/tutorials/Git_Submodule_Guide.md`
*   `docs/sops/SOP_Nix_First_Policy.md`
*   Official Nix Manual: [https://nixos.org/manual/nix/stable/](https://nixos.org/manual/nix/stable/)

This tutorial provides a basic understanding of Nix development. For more advanced topics, refer to the official Nix documentation and other project-specific SOPs and tutorials.
