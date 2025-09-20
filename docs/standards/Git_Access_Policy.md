# Git Access Policy

## 1. Purpose

This document defines the policy for accessing Git functionalities within shell scripts across the project. The primary goal is to centralize Git operations, enhance maintainability, improve consistency, and reduce the risk of errors by leveraging a reusable bash library.

## 2. Policy Statement

All shell scripts (`.sh` files) within this project that perform Git operations (e.g., `git add`, `git commit`, `git push`, `git checkout`, `git remote`, `git branch`, `git pull`, `git fetch`, `git submodule`, `git rev-parse`) **must** utilize the functions provided by the `scripts/lib_git_submodule.sh` library.

Direct invocation of `git` commands within shell scripts is prohibited, except within the `scripts/lib_git_submodule.sh` library itself.

## 3. Rationale

*   **Consistency:** Ensures a uniform approach to Git interactions across the codebase.
*   **Maintainability:** Changes or updates to Git workflows can be managed in a single location (`scripts/lib_git_submodule.sh`), reducing the effort required to update multiple scripts.
*   **Error Reduction:** Encapsulating complex Git logic in well-tested functions minimizes the chance of introducing bugs in individual scripts.
*   **Readability:** Scripts become cleaner and easier to understand by abstracting away low-level Git commands.
*   **Security:** Centralized control over Git operations can help enforce best practices and prevent unintended actions.

## 4. Enforcement

The `rules/git_access/check.sh` script is provided to automatically identify violations of this policy. This script should be run as part of the project's continuous integration (CI) pipeline or as a pre-commit hook to ensure adherence to this policy.

## 5. Exceptions

*   The `scripts/lib_git_submodule.sh` library itself is exempt from this policy, as it is the designated location for direct Git command implementations.
*   Temporary debugging scripts may be exempt, but should not be committed to the main branch without adhering to the policy.

## 6. Related Documentation

*   [SOP: Git Access Policy Check](docs/sops/SOP_Git_Access_Check.md)
*   [scripts/lib_git_submodule.sh](scripts/lib_git_submodule.sh)
