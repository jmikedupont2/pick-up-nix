# Contributing with CRQs and SOPs

This tutorial outlines the process for contributing to the project using Change ReQuests (CRQs) and Standard Operating Procedures (SOPs).

## 1. Understanding CRQs

Change ReQuests (CRQs) are formal documents that define and track significant changes within the project. They provide a comprehensive overview of the problem, proposed solution, scope, technical details, testing, and rollback plan for a given change.

*   **Purpose:** To ensure all major changes are well-thought-out, documented, and reviewed.
*   **Location:** `docs/crqs/`
*   **Key Elements:** Problem statement, proposed solution, scope, technical details, testing plan, rollback plan.

## 2. Understanding SOPs

Standard Operating Procedures (SOPs) are detailed, step-by-step instructions for performing recurring tasks within the project. They ensure consistency, reproducibility, and efficiency in project operations.

*   **Purpose:** To standardize common tasks and provide clear guidance.
*   **Location:** `docs/sops/`
*   **Key Elements:** Prerequisites, step-by-step instructions, verification, troubleshooting.

## 3. Contribution Workflow

1.  **Identify a need for change or a new task:** This could be a bug fix, a new feature, a refactoring effort, or a new operational procedure.
2.  **Draft a CRQ (if applicable):** For significant changes, create a new CRQ document in `docs/crqs/`. Follow the existing CRQ structure as a template.
3.  **Develop or update SOPs (if applicable):** If your change involves a new recurring task or modifies an existing one, create or update the relevant SOP in `docs/sops/`.
4.  **Implement the change:** Write code, update configurations, or perform the necessary actions as described in your CRQ and SOPs.
5.  **Test and Verify:** Ensure your changes work as expected and do not introduce regressions.
6.  **Update CRQ with commit details:** Once the changes are committed, update the CRQ document to reference the relevant commit hashes.
7.  **Submit for Review:** Follow the project's standard code review process.

## 4. Best Practices

*   **Adhere to existing conventions:** Maintain consistency with the project's coding style, documentation standards, and architectural patterns.
*   **Be thorough:** Provide clear and complete information in CRQs and SOPs.
*   **Link related documents:** Reference CRQs in SOPs and vice-versa where appropriate.
*   **Use descriptive commit messages:** Include the CRQ number in your commit messages.
