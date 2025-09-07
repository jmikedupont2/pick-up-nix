# Standard Operating Procedure (SOP): Git Commit Messages

**Document ID:** PI-SOP-003, Rev 1.0 (Placeholder ID)
**Applicable Standards:** Git Best Practices, Project Readability

---

## 1.0 Purpose

To define a consistent and clear standard for writing Git commit messages within this project. Adhering to this SOP ensures that commit history is readable, informative, and easily searchable, facilitating collaboration and project understanding.

## 2.0 Scope

This SOP applies to all Git commits made within the `pick-up-nix` repository and its submodules.

## 3.0 Principles of a Good Commit Message

A good commit message serves several purposes:
*   **Explains *why* the change was made, not just *what* was changed.**
*   **Provides context for future readers (including your future self).**
*   **Facilitates code review and debugging.**
*   **Contributes to a clean and understandable project history.**

## 4.0 Procedure: Writing Commit Messages

All commit messages **MUST** be written using a file, not directly inline with the `-m` flag, especially for multi-line messages or those requiring detailed explanations.

### 4.1 Step 1: Stage Your Changes

Before writing the commit message, ensure all relevant changes are staged using `git add`.

```bash
git add <files_or_directories>
```

### 4.2 Step 2: Create the Commit Message File

Create a temporary file (e.g., `.git_commit_message.txt`) and write your commit message into it.

**Format:**

*   **First Line (Subject Line):** A concise summary of the change (50-72 characters). Use the imperative mood (e.g., "Fix: ...", "Feat: ...", "Chore: ...").
*   **Second Line:** Always blank.
*   **Subsequent Lines (Body):** A more detailed explanation of the change.
    *   Explain the problem being solved.
    *   Describe the approach taken.
    *   Mention any relevant context, decisions, or trade-offs.
    *   Use bullet points or paragraphs for readability.
    *   Wrap lines at 72 characters.

**Example Content for `.git_commit_message.txt`:**

```
feat: Implement new feature X

This commit introduces feature X, which addresses the problem of Y.
The implementation uses Z approach to achieve the desired outcome.

- Added new module for X.
- Updated configuration files.
- Fixed related bug in A.
```

### 4.3 Step 3: Commit Using the File

Use the `git commit -F` flag to read the commit message from the file.

```bash
git commit -F .git_commit_message.txt
```

### 4.4 Step 4: Clean Up (Optional but Recommended)

After a successful commit, you can remove the temporary commit message file.

```bash
rm .git_commit_message.txt
```

## 5.0 Commit Message Types (Prefixes)

Use the following prefixes for your subject line to categorize the type of change:

*   **`feat:`**: A new feature.
*   **`fix:`**: A bug fix.
*   **`docs:`**: Documentation only changes.
*   **`style:`**: Changes that do not affect the meaning of the code (white-space, formatting, missing semicolons, etc.).
*   **`refactor:`**: A code change that neither fixes a bug nor adds a feature.
*   **`perf:`**: A code change that improves performance.
*   **`test:`**: Adding missing tests or correcting existing tests.
*   **`chore:`**: Other changes that don't modify src or test files (e.g., build process, auxiliary tools, libraries).
*   **`ci:`**: Changes to our CI configuration files and scripts.
*   **`build:`**: Changes that affect the build system or external dependencies.
*   **`revert:`**: Reverts a previous commit.

---
