# Contributing with CRQs and SOPs

This tutorial outlines the process for contributing to the project using Change Requests (CRQs) and Standard Operating Procedures (SOPs).

## 1. Understanding CRQs

Change Requests (CRQs) are formal documents that describe significant changes to the project. They provide a structured approach to proposing, reviewing, and implementing changes.

*   **Purpose:** To document the rationale, scope, technical details, and impact of a change.
*   **Location:** CRQ documents are stored in the `docs/crqs/` directory.
*   **Key Elements:** Each CRQ typically includes a problem statement, proposed solution, scope, technical design, testing plan, and rollback strategy.

## 2. Understanding SOPs

Standard Operating Procedures (SOPs) are detailed, step-by-step instructions for performing recurring tasks within the project. They ensure consistency, reproducibility, and efficiency.

*   **Purpose:** To provide clear, unambiguous instructions for common operations.
*   **Location:** SOP documents are stored in the `docs/sops/` directory.
*   **Content:** SOPs cover prerequisites, step-by-step procedures, verification methods, and troubleshooting tips.

## 3. Contribution Workflow

When contributing a significant change or a new recurring task, follow these general steps:

1.  **Propose a CRQ (if applicable):** For major changes, start by drafting a CRQ document in `docs/crqs/` outlining your proposed change.
2.  **Develop an SOP (if applicable):** If your change introduces a new recurring task or significantly alters an existing one, create or update an SOP in `docs/sops/`.
3.  **Implement the Change:** Make your code changes, adhering to project conventions and best practices.
4.  **Update Documentation:** Ensure all relevant documentation, including `README.md`, `GEMINI.md`, and any affected tutorials, are updated to reflect your changes.
5.  **Testing and Verification:** Thoroughly test your changes and verify that they meet the requirements outlined in your CRQ and SOP.
6.  **Submit for Review:** Submit your changes for review, ensuring all CRQ and SOP documents are included and up-to-date.

## 4. Referencing CRQs and SOPs in Commits

Always reference the relevant CRQ number in your commit messages. This helps link code changes directly to the documented change request.

Example Commit Message:

```
feat: Implement new user authentication flow (CRQ-016)

This commit introduces the new user authentication flow as defined in CRQ-016.
It includes updates to the login module and associated tests.
```

## 5. Shellcheck Integration

After any changes to shell scripts, always run `shellcheck` to ensure script quality and adherence to best practices. Refer to `docs/memos/Shellcheck_Always_After_Changes.md` for detailed instructions.