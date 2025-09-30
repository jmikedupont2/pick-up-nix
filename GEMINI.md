# Gemini CLI Task Context

This document provides context for the current task being performed by the Gemini CLI.

## Current Task

The current task involves:
1.  **Submodule Nixification and Flake Refactoring (CRQ-016):** Standardizing Nix flakes across project submodules.
2.  **Updating Documentation:** Ensuring `GEMINI.md`, `README.md`, `docs/sops/`, and `docs/tutorials/` reflect the new Nixification workflow and provide an onboarding guide.

## Project Root

`/data/data/com.termux.nix/files/home/pick-up-nix2/`

## Relevant Directories

*   `docs/sops/`: Standard Operating Procedures.
*   `docs/crqs/`: Change Request documents.
*   `docs/tutorials/`: Tutorials and onboarding guides.
*   `scripts/`: Automation scripts for Nixification and Git operations.
*   `vendor/nix/`: Aggregation point for Nix-related submodules.
*   `index/`: Stores status reports and file indices.

## Recent Progress and Current Status (CRQ-016):

*   **Submodule Branching and Pushing:** The `scripts/commit_and_push_flakes.sh` script has been updated and executed, creating/checking out the `feature/CRQ-016-nixify-workflow` branch in relevant submodules and pushing changes.
*   **Deleted File Restoration:** The `scripts/restore_deleted_submodule_files.sh` script was created and refined to sequentially restore deleted files in submodules.
*   **Submodule Status Generation:** The `scripts/generate_submodule_status.sh` script was created to generate `index/submodules_status.txt` for reviewing submodule states.
*   **Documentation Updates:** A memo `docs/review_findings/Git_Lock_File_Issue.md` was created. The `GEMINI.md` operational guidelines were updated with a strict "Git Operations Policy".
*   **Documentation Enhancement (CRQ-017) Progress**:
    *   Created `docs/tutorials/Contributing_with_CRQs_and_SOPs.md`.
    *   Reviewed and updated all existing SOPs in `docs/sops/` for accuracy and completeness, ensuring references to CRQ-016 and the Shellcheck memo are integrated.
    *   Created `docs/crqs/CRQ_019_Secure_Credential_Handling_in_Nix_Scripts.md` and `docs/sops/SOP_Secure_Credential_Handling_in_Nix_Scripts.md`.
    *   Created `docs/crqs/CRQ_020_Automated_Solution_Discovery_and_Vendorization.md`.
    *   Created `docs/crqs/CRQ_035_Monster_Group_Clifford_Multivector.md`.
    *   Created `docs/sops/SOP_Original_Content_Sourcing.md`.
    *   Created `scripts/lib_github_parsing.sh` and refactored several scripts (`scripts/automate_dependency_forking.sh`, `scripts/branch_and_push_all.sh`, `scripts/extract_and_vendorize_github_repos.sh`, `scripts/generate_dependency_list.sh`, `scripts/generate_update_lock_command.sh`, `scripts/onboard_project.sh`, `scripts/update_flake_lock.sh`) to use the new library functions for GitHub URL parsing.
*   **`vendor/nix/flake.nix` Review:** Confirmed that `vendor/nix/flake.nix` is correctly configured for submodule aggregation.
*   **Submodule Commit and Push:** The `scripts/commit_all_submodule_changes.sh` script was executed, committing and pushing remaining modified/untracked files or new commits within the submodules.
*   **Main Repository Commit and Push:** Changes in the main repository (including `.gitignore` modifications, submodule gitlink updates, and new files like `nixboot.sh`) have been staged, committed, and pushed to the remote.
*   **New Script Creation:** Created `scripts/onboard_project.sh` for project onboarding into the quality system, `scripts/create_muse_task.sh` for general task creation, and `scripts/create_experimental_task.sh` for experimental tasks.
*   **New SOP Creation:** Created `docs/sops/SOP_Digital_Mycology_Experiment_Workflow.md` to define the workflow for LLM-based science experiments.
    *   Documented `docs/Nix_and_Precommit_Setup.md` detailing the project's Nix and pre-commit configurations, including Git submodule management.
    *   Created `docs/sops/SOP_Nix_Github_Meta_Introspector_Policy.md` documenting the policy for Nix flake inputs from `github:meta-introspector` and branch-only references.
    *   Created `docs/Precommit_Nix_Submodule_Overview.md` providing a table of pre-commit hooks, Nix packages, and Git submodule information.
    *   Created `docs/Precommit_Nix_Submodule_Summary.md` providing a focused summary table of pre-commit hooks, their associated submodules, branch/revision, and Nixification status.
*   **New Meme Creation:** Created `docs/memes/solfunmeme-mycology.md` describing the application of quality and agile frameworks to digital alife and meme mycology.

## Next Steps:

1.  **Continue Documentation Enhancement (CRQ-017):**
    *   Review `README.md` for necessary updates.
    *   Review `docs/tutorials/` and create an "onboarding guide for n00bs" incorporating the Nixification workflow.
    *   Ensure `docs/memos/Shellcheck_Always_After_Changes.md` is properly referenced and integrated into relevant SOPs.
2.  **Integrate Project Components into Flake:** Use Nix tools to index all Nix packages in `~/pick-up-nix2/index/file_nix.txt`, understand their graphs, and make a report.
3.  **Define Packages/Applications within Flake.**
4.  **Set up Build and Test Commands for the Project.**
5.  **Further Refine the `devShell`.**