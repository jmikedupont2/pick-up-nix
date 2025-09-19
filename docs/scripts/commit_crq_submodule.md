## `scripts/commit_crq_submodule.sh` Documentation

This script is designed to automate the process of committing changes within a specified Git submodule, linking the commit to a Change ReQuest (CRQ).

**Key Features:**
*   **Usage**: Requires `SUBMODULE_PATH` and `CRQ_NUMBER` as arguments. An optional `COMMIT_MESSAGE_DESCRIPTION` can also be provided.
*   **Error Handling**: Checks if the required arguments are provided and displays a usage message if not.
*   **Path Resolution**: Constructs the full absolute path to the submodule using the `ROOT_DIR` environment variable.
*   **Navigation**: Navigates into the specified submodule's directory.
*   **Staging Changes**: Stages all changes within the submodule's working directory using `git add .`.
*   **Change Detection**: Checks if there are any staged changes to commit. If not, it prints a message indicating no changes.
*   **Commit Message Construction**: Generates a standardized commit message in the format `feat(<submodule_name>): CRQ-<CRQ_NUMBER> - <COMMIT_MESSAGE_DESCRIPTION>`. The submodule name is extracted from the `SUBMODULE_PATH`.
*   **Commit Execution**: Commits the staged changes, bypassing Git hooks (`-n` flag) to ensure the commit proceeds without interruption from pre-commit checks.
*   **Directory Restoration**: Returns to the original directory after the commit operation.

**Usage Example**:
`./scripts/commit_crq_submodule.sh vendor/nix/nixtract 123 "Implement feature X"`
