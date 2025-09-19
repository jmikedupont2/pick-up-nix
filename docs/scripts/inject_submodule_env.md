## `scripts/inject_submodule_env.sh` Documentation

This script is designed to inject a pre-configured Gemini CLI development environment into a specified Git submodule. This environment includes a `boot.sh` script for launching the Gemini CLI within a `tmux` session and `asciinema` recording, a `flake.nix` for a Nix development shell, and a `.pre-commit-config.yaml` for `shellcheck`. It also copies relevant documentation.

**Key Features:**
*   **Usage**: Requires `TARGET_SUBMODULE_PATH` and `CRQ_NUMBER` as arguments.
*   **Error Handling**: Checks for required arguments.
*   **Path Resolution**: Resolves the full absolute path to the target submodule.
*   **`boot.sh` Generation**: Creates a `boot.sh` script within the submodule that:
    *   Sets up `asciinema` recording for the session.
    *   Launches the Gemini CLI within a `tmux` session, using `nix develop` to enter the development shell.
    *   Performs crash recovery checks by logging `git status --ignore-submodules` and `git diff HEAD`.
*   **`flake.nix` Generation**: Creates a `flake.nix` file for the submodule, defining a `devShell` that includes `bash`, `git`, `asciinema`, `pre-commit`, and `shellcheck`. It also installs `pre-commit` hooks upon entering the shell.
*   **`.pre-commit-config.yaml` Generation**: Creates a `.pre-commit-config.yaml` file to configure `shellcheck` as a pre-commit hook. It includes a warning if the file already exists, suggesting a new LLM task for merging.
*   **Documentation Copying**:
    *   Creates a `docs` directory within the submodule.
    *   Copies the main `README.md` from the project root to the submodule's `docs/README.md`.
    *   Creates a `docs/crqs` directory.
    *   Finds and copies the specific CRQ Markdown file (e.g., `CRQ_016_*.md`) from the project's `docs/crqs` to the submodule's `docs/crqs`.

**Usage Example**:
`./scripts/inject_submodule_env.sh vendor/nix/my-submodule 016`
