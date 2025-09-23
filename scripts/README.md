## Scripts Utilizing the `find` Command

Several scripts within this project leverage the `find` command for file system traversal and discovery. Below is a list of these scripts and their primary use of `find`:

*   **`find_submodules.sh`**: Uses `find . -name .gitmodules` to locate all `.gitmodules` files and concatenate their contents into `index/submodules.txt`.
*   **`inspect_nix_env_stack.sh`**: Contains a `find_flake_root` function that uses `find` (likely searching upwards) to locate `flake.nix` files, determining the root of a Nix flake project.
*   **`update_index.sh`**: Executes `find .` to list all files and directories in the current path, redirecting the output to `file.txt`.
*   **`scripts/commit_and_push_flakes.sh`**: Uses `find vendor/nix -mindepth 2 -maxdepth 2 -type f -name "flake.nix"` to discover submodule paths by locating `flake.nix` files within the `vendor/nix` directory.
*   **`scripts/find_x86.sh`**: Employs `find -name flake.nix -exec grep x86 {} \;` to locate `flake.nix` files and then search for the string "x86" within them.
*   **`scripts/nixify_vendor_nix.sh`**: Similar to `commit_and_push_flakes.sh`, it uses `find vendor/nix -mindepth 2 -maxdepth 2 -type f -name "flake.nix"` to identify submodule paths based on `flake.nix` presence.
*   **`scripts/nix_urls.sh`**: Utilizes `find . -name flake.nix -exec grep -H 'url' {} \;` to find `flake.nix` files and extract lines containing "url" from them.
*   **`scripts/review-task.sh`**: Uses `find` multiple times to locate Markdown files (`*.md`) within `docs/sops` and `docs/crqs`, and shell scripts (`*.sh`) within the `scripts/` directory.

## Overview of Key Shell Scripts

This section provides documentation for various shell scripts found in the project's root and `scripts/` directories, outlining their purpose, usage, and dependencies.

### Root Directory Scripts

*   **`_todo_helper.sh`**
    *   **Purpose:** Helper for managing Git submodule remotes, specifically for submodules not already part of the `meta-introspector` organization. It renames the existing `origin` remote to `upstream` and adds a new `origin` pointing to a specified URL. If fetching from the new origin fails, it attempts to fork the repository using the `gh` CLI.
    *   **Usage:** `_todo_helper.sh <submodule_path> <repo_name> <new_origin_url>`
    *   **Dependencies:** `scripts/lib_git_submodule.sh`, `gh` CLI.

*   **`boot.sh`**
    *   **Purpose:** Orchestrates the recording of a `tmux` session using `asciinema` and then launches the Gemini CLI within that session. After the session ends, it performs crash recovery checks by logging Git status, Git diff, and the output of `run_log_processor.sh`.
    *   **Usage:** `boot.sh`
    *   **Dependencies:** `asciinema`, `run_boot.sh`, `run_log_processor.sh`, `git`.

*   **`boot2.sh`**
    *   **Purpose:** Almost identical to `boot.sh`, but uses a different `SESSION_NAME` ("gemini-dev-session-2"). It orchestrates `asciinema` recording of a `tmux` session, launches the Gemini CLI, and performs crash recovery checks.
    *   **Usage:** `boot2.sh`
    *   **Dependencies:** `asciinema`, `run_boot.sh`, `run_log_processor.sh`, `git`.

*   **`build_and_report.sh`**
    *   **Purpose:** Executes all shell scripts found in the `qa.d/` directory as Quality Assurance (QA) scripts and generates a consolidated report of their execution status.
    *   **Usage:** `build_and_report.sh`
    *   **Dependencies:** Scripts in `qa.d/`.

*   **`build_qa_process.sh`**
    *   **Purpose:** Orchestrates a comprehensive build and Quality Assurance (QA) process, including Nix builds, Nix linters, and Nix dependency graph generation, logging all output.
    *   **Usage:** `build_qa_process.sh <LOG_FILE> [TIMEOUT_DURATION] [STRACE_ENABLED] [VERBOSE_MODE]`
    *   **Dependencies:** `qa.d/01_nix_builds.sh`, `nixpkgs-fmt`, `nixpkgs-lint`, `generate_nix_graph.sh`, `strace`, `timeout`.

*   **`commit_all_changes.sh`**
    *   **Purpose:** Commits all changes in the Git repository to the current branch without first running `git status`, designed for scenarios where `git status` is slow.
    *   **Usage:** `commit_all_changes.sh`
    *   **Dependencies:** `git`.

*   **`dwim.sh`**
    *   **Purpose:** A "Do What I Mean" (DWIM) script that launches the Gemini CLI using the project's Nix flake configuration, acting as a convenient wrapper.
    *   **Usage:** `dwim.sh [arguments_for_gemini_cli]`
    *   **Dependencies:** `nix`, `flake.nix` defining `gemini-cli`.

*   **`enter_and_run_tracenix.sh`**
    *   **Purpose:** Enters a Nix shell environment with verbose logging for Nix, then executes `run_tracenix_verbose.sh` within that shell, redirecting all its output to a temporary log file.
    *   **Usage:** `enter_and_run_tracenix.sh [arguments_for_tracenix]`
    *   **Dependencies:** `nix-shell`, `run_tracenix_verbose.sh`.

*   **`env.sh`**
    *   **Purpose:** Sets the `PROJECT_ROOT` environment variable to the absolute path of the project's root directory, intended to be sourced by other scripts.
    *   **Usage:** `source env.sh`
    *   **Dependencies:** None.

*   **`extract_strace_paths.sh`**
    *   **Purpose:** Extracts unique absolute file paths from a specified `strace` log file and copies these files to a target directory, gathering files accessed during a `strace` run.
    *   **Usage:** `extract_strace_paths.sh` (uses hardcoded paths).
    *   **Dependencies:** `grep`, `sed`, `sort`, `cp`, `mkdir`.

*   **`files.sh`**
    *   **Purpose:** Processes a `file.txt` (list of file paths) and categorizes files based on their extensions, creating separate index files in the `index/` directory for each specified file type.
    *   **Usage:** `files.sh`
    *   **Dependencies:** `file.txt`, `grep`, `mkdir`.

*   **`fix_submodules.sh`**
    *   **Purpose:** Iterates through a hardcoded list of submodule paths, navigates into each, and attempts to stage and commit any uncommitted changes or untracked files within that submodule.
    *   **Usage:** `fix_submodules.sh`
    *   **Dependencies:** `scripts/lib_git_submodule.sh`, `git`.

*   **`gemini_cli_entrypoint.sh`**
    *   **Purpose:** Serves as an entry point to launch the `gemini` CLI application. It changes into the `gemini-cli` project directory and executes the `gemini` command.
    *   **Usage:** `gemini_cli_entrypoint.sh`
    *   **Dependencies:** The `gemini` executable (provided by Nix dev shell).

### `scripts/` Directory Scripts

*   **`create_muse_task.sh`**
    *   **Purpose:** Creates a new task based on `templates/task_template.md`, generating a directory structure `tasks/<muse_name>/2025/<task_title>/task.md`.
    *   **Usage:** `create_muse_task.sh <muse_name> <task_title>`
    *   **Dependencies:** `templates/task_template.md`.

*   **`create_experimental_task.sh`**
    *   **Purpose:** Creates a new *experimental* task, using the current date for the directory structure and delegating content generation to `create_experimental_task_sed.sh`.
    *   **Usage:** `create_experimental_task.sh <task_title> <muse_name>`
    *   **Dependencies:** `lib/lib_time.sh`, `create_experimental_task_sed.sh`.

*   **`generate_submodule_status.sh`**
    *   **Purpose:** Generates a status report for all Git submodules, writing the output of `git submodule foreach --recursive 'git status'` to `index/submodules_status.txt`.
    *   **Usage:** `generate_submodule_status.sh`
    *   **Dependencies:** `git`.

*   **`generate_all_github_urls_index.sh`**
    *   **Purpose:** Generates a comprehensive list of all unique GitHub repository URLs found within the project, saving the list to `index/all_github.txt`.
    *   **Usage:** `generate_all_github_urls_index.sh`
    *   **Dependencies:** `lib/lib_github_search.sh`.

*   **`generate_github_prefix_counts.sh`**
    *   **Purpose:** Processes `index/all_github.txt` to count occurrences of URL prefixes (first 5 slash-separated fields), saving the counts to `index/all_github_5.txt`.
    *   **Usage:** `generate_github_prefix_counts.sh`
    *   **Dependencies:** `index/all_github.txt`, `cut`, `sort`, `uniq`.

*   **`generate_unique_github_urls.sh`**
    *   **Purpose:** Takes the comprehensive list of all GitHub URLs (`index/all_github.txt`) and generates a sorted, unique list, saving it to `index/unique_github_repos.txt`.
    *   **Usage:** `generate_unique_github_urls.sh`
    *   **Dependencies:** `index/all_github.txt`, `sort`.