# Managing Your Nix-on-Droid Configuration with Git

This guide will walk you through the process of using a Git repository to manage your Nix-on-Droid configuration. This will allow you to keep track of your changes, share your configuration with others, and easily roll back to previous versions.

## The Plan

1.  **Install `gh` CLI:** We will install the GitHub CLI to make it easier to interact with GitHub.
2.  **Clone Repositories:** We will clone two repositories:
    *   `jmikedupont2/pick-up-nix`: A template repository for managing Nix configurations.
    *   `nix-community/nix-on-droid`: The official Nix-on-Droid repository, for reference and documentation.
3.  **Update Your Configuration:** We will move your current Nix-on-Droid configuration into the `pick-up-nix` repository.
4.  **Apply the New Configuration:** We will apply the new configuration from the Git repository.

## Step 1: Install `gh` CLI

First, we will add the `gh` package to your `nix-on-droid.nix` file and apply the changes.

## Step 2: Clone Repositories

Next, we will clone the two repositories into your home directory.

```bash
git clone https://github.com/jmikedupont2/pick-up-nix.git
git clone https://github.com/nix-community/nix-on-droid.git
```

## Step 3: Update Your Configuration

We will then copy your current Nix-on-Droid configuration files (`flake.nix` and `nix-on-droid.nix`) into the `pick-up-nix` repository. This will allow you to manage your configuration using Git.

## Step 4: Apply the New Configuration

Finally, we will apply the new configuration from the `pick-up-nix` repository. This will involve running the `nix-on-droid switch` command with the `--flake` flag pointing to the new location of your `flake.nix` file.

This will set you up with a Git-based workflow for managing your Nix-on-Droid configuration.
