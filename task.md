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
current change request :   docs/crqs/CRQ_018_Automated_GitHub_Forking.md Read and understand and update

## Next Steps:

1.  **Continue Documentation Enhancement (CRQ-017):**
    *   Create `docs/tutorials/Contributing_with_CRQs_and_SOPs.md`.
    *   Review and update all existing SOPs in `docs/sops/` for accuracy and completeness.
    *   Update `GEMINI.md` (project root) to summarize documentation efforts.
    *   Ensure `docs/memos/Shellcheck_Always_After_Changes.md` is properly referenced and integrated into relevant SOPs.
2.  **Address `nixpacks` submodule issue:**
    *   Run `scripts/vendorize_and_fork_submodule.sh` for `nixpacks` to fork it under `meta-introspector` and update its remote.
    *   Update the main repository's `.gitmodules` to point to the new `meta-introspector` fork.
    *   Commit and push changes in the main repository.
    *   Re-run `scripts/commit_all_submodule_changes.sh` to push `flake.nix` changes within `nixpacks`.
    *   Verify the status.
3.  **Implement CRQ-018: Automated GitHub Forking for Nix Flake Dependencies:**
    *   Develop `scripts/automate_dependency_forking.sh` as outlined in `docs/crqs/CRQ_018_Automated_GitHub_Forking.md`.
    *   Document the process in `docs/tutorials/Automated_Dependency_Forking_Tutorial.md`.
    *   **Note:** Full implementation of forking functionality is dependent on the completion of CRQ-019 (Secure Credential Handling).

## Recent Progress and Current Status:

*   **Submodule Branching and Pushing:** The `scripts/commit_and_push_flakes.sh` script has been updated and executed. It successfully created/checked out the `feature/CRQ-016-nixify-workflow` branch in relevant submodules and pushed their changes.
*   **Deleted File Restoration:** The `scripts/restore_deleted_submodule_files.sh` script was created and refined to sequentially restore deleted files in submodules.
*   **Submodule Status Generation:** The `scripts/generate_submodule_status.sh` script was created to generate `index/submodules_status.txt` for reviewing submodule states.
*   **Documentation Updates:**
    *   A memo `docs/review_findings/Git_Lock_File_Issue.md` was created to explain the Git lock file issue, emphasizing its cause (parallel operations) and the resolution (sequential processing).
    *   The `GEMINI.md` operational guidelines were updated with a strict "Git Operations Policy" to prevent accidental deletion of Git files/locks and to enforce the use of branches and rewrites.
*   **`vendor/nix/flake.nix` Review:** It was confirmed that `vendor/nix/flake.nix` is already correctly configured and does not require further updates for submodule aggregation.
*   **Tagging:** Tagging of submodules is currently skipped as per user request.
*   **URL Vendorization:** `scripts/vendorize_flake_urls.sh` and `scripts/apply_vendorized_urls.sh` were created and executed to update `flake.nix` URLs to point to `meta-introspector` forks with the `feature/CRQ-016-nixify` branch.
*   **Documentation Enhancement CRQ:** `docs/crqs/CRQ_017_Documentation_Enhancement.md` has been created to formalize the plan for documentation improvements.
*   **New Tutorials:** `docs/tutorials/Onboarding_Guide.md`, `docs/tutorials/Git_Submodule_Guide.md`, and `docs/tutorials/Nix_Development_Basics.md` have been created.
*   **CRQ-018 Implementation (Automated GitHub Forking):**
    *   `scripts/automate_dependency_forking.sh` has been developed and documented in `docs/tutorials/Automated_Dependency_Forking_Tutorial.md`.
    *   The script successfully runs in report mode, identifying dependencies and existing forks.
    *   Full implementation of forking functionality is pending the secure credential handling solution from CRQ-019.
*   **CRQ-019 (Secure Credential Handling):**
    *   `docs/crqs/CRQ_019_Secure_Credential_Handling_in_Nix_Scripts.md` and `docs/sops/SOP_Secure_Credential_Handling_in_Nix_Scripts.md` have been created to formalize the approach to secure credential management.
*   **CRQ-020 (Automated Solution Discovery and Vendorization):**
    *   `docs/crqs/CRQ_020_Automated_Solution_Discovery_and_Vendorization.md` has been created to formalize the process of automated solution discovery and vendorization.

## Next Steps:

1.  **Continue Documentation Enhancement (CRQ-017):**
    *   Create `docs/tutorials/Contributing_with_CRQs_and_SOPs.md`.
    *   Review and update all existing SOPs in `docs/sops/` for accuracy and completeness.
    *   Update `GEMINI.md` (project root) to summarize documentation efforts.
    *   Ensure `docs/memos/Shellcheck_Always_After_Changes.md` is properly referenced and integrated into relevant SOPs.
2.  **Address `nixpacks` submodule issue:**
    *   Run `scripts/vendorize_and_fork_submodule.sh` for `nixpacks` to fork it under `meta-introspector` and update its remote.
    *   Update the main repository's `.gitmodules` to point to the new `meta-introspector` fork.
    *   Commit and push changes in the main repository.
    *   Re-run `scripts/commit_all_submodule_changes.sh` to push `flake.nix` changes within `nixpacks`.
    *   Verify the status.
