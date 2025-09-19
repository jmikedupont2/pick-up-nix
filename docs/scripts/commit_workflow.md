## `scripts/commit_workflow.sh` Documentation

This script automates the process of creating a new Git branch, staging all changes, generating a standardized commit message, and then committing those changes. It's designed to encapsulate a specific development workflow, particularly for initial setup or significant feature introductions.

**Key Features:**
*   **Configuration**: Defines the `BRANCH_NAME` (`feature/CRQ-016-nixify-workflow`), the `COMMIT_MESSAGE_FILE` (`.git_commit_message.txt`), and the detailed `COMMIT_MESSAGE_CONTENT`.
*   **Branch Creation**: Creates and switches to a new Git branch with the specified `BRANCH_NAME`.
*   **Staging Changes**: Stages all new and modified files in the current working directory using `git add .`.
*   **Commit Message Generation**: Creates a temporary file (`.git_commit_message.txt`) containing a predefined, detailed commit message.
*   **Commit Execution**: Commits the staged changes using the content of the generated commit message file via `git commit -F`.

**Usage**:
This script is intended to be run from the project root directory to create a new branch and commit all pending changes with a comprehensive message.
