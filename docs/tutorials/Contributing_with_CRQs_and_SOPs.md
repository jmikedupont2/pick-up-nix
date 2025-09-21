# Contributing with CRQs and SOPs

This tutorial outlines the process for contributing to the project by adhering to Change ReQuests (CRQs) and Standard Operating Procedures (SOPs). Following these guidelines ensures consistency, maintainability, and auditable changes within the project.

## 1. Understanding CRQs (Change ReQuests)

CRQs are formal documents that define significant changes to the project. They provide:
*   **Problem Statement:** What issue is being addressed.
*   **Proposed Solution:** How the issue will be resolved.
*   **Scope:** The boundaries of the change.
*   **Technical Details:** In-depth explanation of the implementation.
*   **Testing Plan:** How the change will be verified.
*   **Rollback Plan:** How to revert the change if necessary.

**When contributing:**
*   Always check the `docs/crqs/` directory for existing CRQs related to your task.
*   If your contribution is significant and not covered by an existing CRQ, propose a new one.
*   Reference the relevant CRQ number in your commit messages.

## 2. Adhering to SOPs (Standard Operating Procedures)

SOPs are detailed, step-by-step instructions for performing recurring tasks. They ensure consistency and reproducibility.

**When contributing:**
*   Consult the `docs/sops/` directory for SOPs relevant to your task (e.g., submodule management, Nixification).
*   Follow the instructions precisely.
*   If an SOP is outdated or missing for a common task, propose an update or a new SOP.

## 3. General Contribution Workflow

1.  **Identify a Task:** This could be a bug fix, a new feature, or a refactoring effort.
2.  **Check for CRQs:** See if an existing CRQ covers your task. If not, consider creating one.
3.  **Consult SOPs:** Review relevant SOPs for guidance on how to perform the task.
4.  **Create a Branch:** Always work on a new branch for your changes.
5.  **Implement Changes:** Write code, update configurations, etc., following project conventions.
6.  **Write Tests:** Ensure your changes are covered by appropriate tests.
7.  **Update Documentation:** If your changes affect functionality or procedures, update relevant documentation (e.g., `README.md`, `docs/tutorials/`, `docs/sops/`).
8.  **Commit Changes:**
    *   Write clear and concise commit messages.
    *   **Always reference the CRQ number** (e.g., `CRQ-016: Implement feature X`).
9.  **Push Changes:** Push your branch to the remote repository.
10. **Create a Pull Request:** Submit a pull request for review.

By following this process, your contributions will be well-documented, easily auditable, and seamlessly integrated into the project.