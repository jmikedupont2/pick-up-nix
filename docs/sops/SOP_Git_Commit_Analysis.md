# SOP: Git Commit Analysis for CRQ Context

This Standard Operating Procedure (SOP) outlines a systematic approach to analyzing Git commits, extracting relevant changes, and linking them to specific Change Requests (CRQs) or project initiatives. This process is designed to be thorough and resilient to interruptions, allowing for a detailed understanding of project evolution.

## 1. Generate and Save Commit Log

**Objective:** Obtain a comprehensive list of recent Git commits for analysis.

**Steps:**
1.  Execute the `generate_recent_commits_log.sh` script to capture the commit history for a specified period (e.g., last 4 days).
    ```bash
    /data/data/com.termux.nix/files/home/pick-up-nix2/scripts/generate_recent_commits_log.sh /data/data/com.termux.nix/files/home/pick-up-nix2/index/recent_commits.log
    ```
2.  The output will be saved to `/data/data/com.termux.nix/files/home/pick-up-nix2/index/recent_commits.log`.

## 2. Extract and Document Individual Commit Details

**Objective:** For each commit, extract its full diff, categorize file changes, and identify its relevance to CRQs or project themes.

**Steps:**
1.  **Iterate through `recent_commits.log`:** Read the `recent_commits.log` file. For each commit hash found:
    *   **Extract Commit Hash:** Identify the commit hash (e.g., `6ed7925a0c318e753bfa34cabf229da7e95ca495`).
    *   **Create Commit-Specific Directory:** Create a directory for the commit's analysis, e.g., `tasks/commit_analysis/<commit_hash>/`.
    *   **Get Full Diff:** Obtain the full diff for the commit.
        ```bash
        git show <commit_hash> > tasks/commit_analysis/<commit_hash>/full_diff.txt
        ```
    *   **Get Diff Stats:** Obtain the diff stats (additions/deletions per file).
        ```bash
        git diff-tree --numstat <commit_hash> > tasks/commit_analysis/<commit_hash>/diff_stats.txt
        ```
    *   **Split Diff by File (Manual/Scripted):**
        *   The `full_diff.txt` will contain changes for all files in that commit.
        *   Manually or script-wise, separate the diff for each file into individual files within the commit's directory (e.g., `tasks/commit_analysis/<commit_hash>/<filename_sanitized>.diff`). This helps in focused analysis.
    *   **Analyze and Identify Context:** For each changed file:
        *   **Group Logically:** Categorize the file based on its path (e.g., `docs/`, `scripts/`, `nix/`, `source/`) and type.
        *   **Identify CRQ/Change/Vibe:** Determine which CRQ (e.g., CRQ-035, CRQ-016, CRQ-017) or general project change/theme the file modification belongs to. Look for keywords in the commit message and the diff content.
        *   **Document Findings:** Create a markdown file within the commit's directory (e.g., `tasks/commit_analysis/<commit_hash>/analysis.md`) to document:
            *   Commit message summary.
            *   List of changed files, grouped logically.
            *   For each file:
                *   Summary of changes.
                *   Identified CRQ/Change/Vibe.
                *   Impact on the project or specific CRQ.
                *   Any QA observations or questions.

## 3. Weave Together the Narrative

**Objective:** Synthesize the individual commit analyses into a coherent narrative of project evolution, particularly focusing on CRQ-035.

**Steps:**
1.  **Create a Master Analysis Document:** Create a central markdown file (e.g., `tasks/CRQ-035_Commit_Analysis_Narrative.md`) that aggregates the findings from all individual commit analyses.
2.  **Chronological Ordering:** Present the analysis in a logical order (either chronological or reverse chronological, depending on the goal of the narrative).
3.  **CRQ-Specific Sections:** Create sections for each relevant CRQ (e.g., "CRQ-035 Progress," "CRQ-016 Refinements") and integrate the commit-specific findings into these sections.
4.  **Identify Trends and Dependencies:** Look for patterns, dependencies between commits, and how different changes contribute to larger project goals.
5.  **Update Project Status:** Based on the analysis, update the overall understanding of the project's status and identify any new blockers or next steps.

## 4. Resumption After Interruption

**Objective:** Ensure the analysis process can be easily resumed if interrupted.

**Steps:**
1.  **Check `tasks/commit_analysis/`:** Review the existing directories within `tasks/commit_analysis/` to see which commits have already been processed.
2.  **Consult `recent_commits.log`:** Identify the next unprocessed commit hash from `recent_commits.log`.
3.  **Continue from Last Processed Commit:** Resume the "Extract and Document Individual Commit Details" step for the next unprocessed commit.
4.  **Update Narrative:** Ensure the master analysis document is updated with any newly processed commits.
