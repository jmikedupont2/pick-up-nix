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
    *   Reviewed and confirmed accuracy and completeness of all SOPs in `docs/sops/` with CRQ-016 implementation, including adding CRQ-016 and Shellcheck memo references where appropriate.
*   **`vendor/nix/flake.nix` Review:** Confirmed that `vendor/nix/flake.nix` is correctly configured for submodule aggregation.
*   **Submodule Commit and Push:** The `scripts/commit_all_submodule_changes.sh` script was executed, committing and pushing remaining modified/untracked files or new commits within the submodules.
*   **Main Repository Commit and Push:** Changes in the main repository (including `.gitignore` modifications, submodule gitlink updates, and new files like `nixboot.sh`) have been staged, committed, and pushed to the remote.

## Next Steps:

1.  **Review and Update Documentation:**
    *   Review `README.md` for necessary updates.
    *   Review `docs/sops/` and create/update SOPs related to the Nixification workflow.
    *   Review `docs/tutorials/` and create an "onboarding guide for n00bs" incorporating the Nixification workflow.
2.  **Integrate Project Components into Flake:** Use Nix tools to index all Nix packages in `~/pick-up-nix2/index/file_nix.txt`, understand their graphs, and make a report.
3.  **Define Packages/Applications within Flake.**
4.  **Set up Build and Test Commands for the Project.**
5.  **Further Refine the `devShell`.**