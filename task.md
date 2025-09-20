## rules to add to gemini.md
each git repo will have a task.md with the next steps in it to run.
those steps will be run in nix.
the input to the nix will include its entire context.
the context is constructed to be passed to gemini via the task.md
a backpack filling algorithm finds the optimal contents for each step in the workflow.
each new bit of code needs an doc/sops/ standard operating procedure
each change should be associated with a doc/crq/ Change ReQuest
each crq should be updated with which commits are part of it.
the crq number is mentioned in each commit message.
look first for scripts/<usefulname>
run all changes via scripts/<usefulname>
commit all changes before your run.
write tests first
create branches first
do not delete anything
do not run git anything for now except to add and commit any new files.
do not commit any deletes
do not rm any files
do not rm .git
careful that some git commands process in parallel and cause locks. do not run many git commits from gemini.

*   Integrating specific project components into the new flake.
We want to use those nix tools to index
all the nix packages in ~/pick-up-nix2/index/file_nix.txt and to understand  the graphs
and how they fito int our project. and make a report.

*   Defining packages or applications within the flake.

our boot.sh runs gemini

*   Setting up build and test commands for your project.
*   Further refining the `devShell`.


# Task: Upgrade Nix Environment and Build with Nix
CWD:  /data/data/com.termux.nix/files/home/pick-up-nix2 aka ~/nix2 (via ln)
On branch feature/CRQ-016-nixify-workflow
current change request :   docs/crqs/CRQ_016_Flake_Refactor_and_Nixify.md Read and understand and update

## Recent Progress and Current Status:

*   **Submodule Branching and Pushing:** The `scripts/commit_and_push_flakes.sh` script has been updated and executed. It successfully created/checked out the `feature/CRQ-016-nixify-workflow` branch in relevant submodules and pushed their changes.
*   **Deleted File Restoration:** The `scripts/restore_deleted_submodule_files.sh` script was created and refined to sequentially restore deleted files in submodules. This script is designed to be idempotent and prevent Git lock issues by avoiding parallel operations.
*   **Submodule Status Generation:** The `scripts/generate_submodule_status.sh` script was created to generate `index/submodules_status.txt` for reviewing submodule states.
*   **Documentation Updates:**
    *   A memo `docs/review_findings/Git_Lock_File_Issue.md` was created to explain the Git lock file issue, emphasizing its cause (parallel operations) and the resolution (sequential processing).
    *   The `GEMINI.md` operational guidelines were updated with a strict "Git Operations Policy" to prevent accidental deletion of Git files/locks and to enforce the use of branches and rewrites.
*   **`vendor/nix/flake.nix` Review:** It was confirmed that `vendor/nix/flake.nix` is already correctly configured and does not require further updates for submodule aggregation.
*   **Tagging:** Tagging of submodules is currently skipped as per user request.

## Next Steps:

1.  **Execute Submodule Commit and Push Script:** Run `scripts/commit_all_submodule_changes.sh` to commit and push any remaining modified/untracked files or new commits within the submodules. This script processes submodules sequentially to avoid Git lock issues.
2.  **Commit Main Repository Changes:** Stage and commit changes in the main repository, including:
    *   `.gitignore` modifications.
    *   Updates to submodule gitlink entries (which reflect the submodule commits).
    *   New untracked files like `logs/inject_submodule_env.log` and `scripts/commit_workflow.sh`.
    Use a commit message associated with CRQ-016.
3.  **Push Main Repository Changes:** Push the committed changes in the main repository to its remote.