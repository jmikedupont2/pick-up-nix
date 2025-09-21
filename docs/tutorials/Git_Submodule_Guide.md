# Tutorial: Understanding and Using Git Submodules

Git submodules allow you to keep a Git repository as a subdirectory of another Git repository. This is useful for managing project dependencies, external libraries, or components that are developed independently but need to be part of a larger project.

## 1. Why This Project Uses Git Submodules

Our project leverages Git submodules for several key reasons:

*   **Modularity:** Breaking down a large project into smaller, manageable, and independently versioned components.
*   **Dependency Management:** Including external libraries or tools directly within the project, ensuring specific versions are used.
*   **Reproducibility:** Pinning dependencies to specific commits, ensuring that everyone working on the project uses the exact same versions of all components.
*   **Nix Integration:** Many of our submodules are "Nixified," meaning they include their own `flake.nix` files to define their development environments and dependencies, further enhancing reproducibility.

## 2. Basic Submodule Operations

### 2.1. Initializing and Updating Submodules

When you first clone this repository, or if new submodules are added, you need to initialize and update them. This fetches the submodule repositories and checks out the correct commits.

```bash
git submodule update --init --recursive
```

*   `--init`: Initializes the submodules, registering them in your `.git/config`.
*   `--recursive`: Ensures that nested submodules (submodules within submodules) are also initialized and updated.

### 2.2. Cloning a Repository with Submodules

If you clone the main repository and forget the `--recursive` flag, you can initialize and update submodules afterward:

```bash
git clone <repository_url>
cd <repository_name>
git submodule update --init --recursive
```

### 2.3. Checking Submodule Status

To see the current status of your submodules, including any uncommitted changes or if they are on a detached HEAD:

```bash
git submodule status
```

For a more detailed Git status within each submodule, you can use:

```bash
git submodule foreach 'git status'
```

Or, use our convenience script:

```bash
bash scripts/generate_submodule_status.sh
```

### 2.4. Committing Changes Within a Submodule

If you make changes within a submodule (e.g., modify a `flake.nix` file), these changes need to be committed within the submodule's own repository first.

1.  **Navigate into the submodule directory:**
    ```bash
    cd path/to/your/submodule
    ```
2.  **Stage and commit your changes:**
    ```bash
    git add .
    git commit -m "feat: My changes in submodule"
    ```
3.  **Push your changes (if you have push access to the submodule's remote):**
    ```bash
    git push
    ```
4.  **Navigate back to the main repository root:**
    ```bash
    cd -
    ```
5.  **Commit the submodule update in the main repository:** The main repository tracks the specific commit of its submodules. After committing in the submodule, the main repository will show the submodule as modified.
    ```bash
    git add path/to/your/submodule
    git commit -m "chore: Update submodule_name to new commit"
    ```

Alternatively, you can use our script to commit changes in all submodules:

```bash
bash scripts/commit_all_submodule_changes.sh
```

## 3. Working with Nixified Submodules

Many submodules in this project are Nix-enabled. This means they have a `flake.nix` file that defines their development environment and outputs.

### 3.1. Entering a Submodule's Development Shell

To work within a submodule's defined Nix environment:

```bash
cd path/to/your/submodule
nix develop
```

This will drop you into a shell with all the tools and dependencies specified in that submodule's `flake.nix`.

### 3.2. Nixifying Submodules

If a submodule is not yet Nixified, or its `flake.nix` needs to be updated to our standard template, you can use the `nixify.sh` script:

```bash
bash scripts/nixify.sh path/to/your/submodule --apply
```

To Nixify all relevant submodules under `vendor/nix/`:

```bash
bash scripts/nixify_vendor_nix.sh --apply
```

## 4. Troubleshooting Common Submodule Issues

*   **Detached HEAD:** Submodules often operate in a detached HEAD state. This is normal, as the main repository tracks a specific commit, not a branch. If you want to work on a branch within a submodule, you need to explicitly check out that branch.
*   **Submodule not initialized:** If `git submodule status` shows empty lines or errors, run `git submodule update --init --recursive`.
*   **Permission denied when pushing submodule changes:** If you don't have write access to the submodule's original remote, you'll need to fork the repository (if it's a GitHub repo) and update the submodule's remote to point to your fork. Our `scripts/vendorize_and_fork_submodule.sh` can help with this.
*   **`flake.nix` changes not reflected:** Ensure you have committed the changes within the submodule and then committed the submodule update in the main repository.

## 5. Related Documentation

*   `docs/tutorials/Onboarding_Guide.md`
*   `docs/sops/SOP_Submodule_Nixification.md`
*   `docs/sops/SOP_Vendorize_And_Fork_Submodule.md`
*   `git help submodule`

This guide should provide a solid foundation for working with Git submodules in this project. Happy coding!