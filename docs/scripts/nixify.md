## `scripts/nixify.sh` Documentation

This script automates the creation or update of a `flake.nix` file within a specified submodule, based on a predefined template. It supports both dry-run and apply modes.

**Key Features:**
*   **Usage**: Requires `submodule_path` as the first argument. An optional second argument `--apply` can be provided to make actual changes; otherwise, it runs in dry-run mode.
*   **Error Handling**: Checks if `submodule_path` is provided and if the `scripts/flake.template` file exists.
*   **Template Loading**: Reads the content of `scripts/flake.template` to use as the basis for the `flake.nix` file.
*   **`flake.nix` Creation (if not exists)**:
    *   In dry-run mode, it prints what the new `flake.nix` would contain.
    *   In apply mode (`--apply`), it creates a new `flake.nix` file in the submodule with the template's content.
*   **`flake.nix` Update (if exists)**:
    *   Compares the existing `flake.nix` with the template.
    *   If they are identical, it reports that the file is up to date.
    *   If they differ:
        *   In dry-run mode, it shows a `diff` of the changes that would be applied.
        *   In apply mode (`--apply`), it backs up the existing `flake.nix` to `flake.nix.bak` and then overwrites it with the template's content.

**Usage Example**:
*   Dry run: `./scripts/nixify.sh vendor/nix/my-submodule`
*   Apply changes: `./scripts/nixify.sh vendor/nix/my-submodule --apply`
