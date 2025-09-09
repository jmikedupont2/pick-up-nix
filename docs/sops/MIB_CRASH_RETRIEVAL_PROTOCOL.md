# MIB Crash Retrieval Protocol

## 1. Assess Git Repository State After Crash

In the event of a system crash and potential memory corruption, it is crucial to immediately assess the state of the Git repository to identify any uncommitted changes or discrepancies.

### 1.1 Check Git Status

Execute the following command to view the current status of the Git working directory and staging area:

```bash
git status
```

*   **Purpose:** This command will show which files are untracked, modified, or staged for commit. It helps in understanding what changes were present at the time of the crash.

### 1.2 Document Git Differences

To get a detailed view of the changes in modified files, execute the following command:

```bash
git diff HEAD
```

*   **Purpose:** This command displays the differences between the working directory and the last commit (`HEAD`). This is essential for documenting the exact state of files that were being worked on.

### 1.3 Stage All Changes

If there are untracked or modified files that need to be preserved, stage them for commit.

```bash
git add .
```

*   **Purpose:** This command adds all changes in the current directory to the staging area. Use with caution, as it stages all changes, including potentially unwanted ones.

### 1.4 Document Staged Differences

To get a detailed view of the changes that have been staged, execute the following command:

```bash
git diff --staged
```

*   **Purpose:** This command displays the differences between the staging area and the last commit (`HEAD`). This is essential for reviewing what will be committed.

### 1.5 Record Output

Record the output of `git status`, `git diff HEAD`, `git add .` (if executed), and `git diff --staged` commands. This documentation is critical for post-crash analysis and recovery efforts.
