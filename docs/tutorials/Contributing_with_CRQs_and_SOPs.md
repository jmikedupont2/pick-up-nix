# Contributing with CRQs and SOPs

This tutorial outlines the process for contributing to the project using Change Request (CRQ) documents and Standard Operating Procedures (SOPs).

## 1. Understanding CRQs

Change Request (CRQ) documents are formal proposals for significant changes to the project. They provide a structured way to:

*   **Define the Problem:** Clearly articulate the issue or enhancement being addressed.
*   **Propose a Solution:** Detail the planned approach to resolve the problem.
*   **Outline Scope:** Define the boundaries of the change.
*   **Technical Details:** Provide in-depth technical specifications.
*   **Testing Plan:** Describe how the changes will be verified.
*   **Rollback Plan:** Outline steps to revert the changes if necessary.

CRQs are stored in the `docs/crqs/` directory. Each CRQ is assigned a unique identifier (e.g., `CRQ_016`).

## 2. Understanding SOPs

Standard Operating Procedures (SOPs) are detailed, step-by-step instructions for performing recurring tasks within the project. They ensure consistency, reproducibility, and efficiency.

SOPs are stored in the `docs/sops/` directory. Each SOP is named descriptively (e.g., `SOP_Submodule_Nixification.md`).

## 3. Contribution Workflow

When making a significant contribution, follow these steps:

### 3.1. Create a New CRQ (if applicable)

If your contribution involves a substantial change or new feature, create a new CRQ document in `docs/crqs/`. Use the existing CRQs as a template. Ensure you:

*   Assign a new, unique CRQ number.
*   Fill in all sections comprehensively.
*   Get approval from relevant stakeholders (if required by project policy).

### 3.2. Develop According to the CRQ

Implement your changes based on the approved CRQ. During development:

*   **Reference the CRQ:** Mention the CRQ number in your commit messages (e.g., `feat: Implement feature X (CRQ-0XX)`).
*   **Adhere to SOPs:** Follow any relevant SOPs for tasks like submodule management, Nixification, or code style.
*   **Create New SOPs (if applicable):** If your contribution introduces a new recurring task or significantly alters an existing one, create a new SOP in `docs/sops/` or update an existing one.

### 3.3. Update the CRQ with Commit Information

Once your changes are committed, update your CRQ document to include references to the commits that are part of that CRQ. This provides an auditable trail of changes.

### 3.4. Review and Testing

Ensure your changes are thoroughly reviewed and tested as per the testing plan outlined in your CRQ.

### 3.5. Documentation Updates

Update any relevant documentation (e.g., `README.md`, `GEMINI.md`, other tutorials) to reflect your changes.

## Example

Let's say you are implementing a new Nixification workflow. You would:

1.  Create `docs/crqs/CRQ_016_Submodule_Nixification.md`.
2.  Develop the Nixification scripts and `flake.nix` files, referencing `CRQ-016` in your commit messages.
3.  Create `docs/sops/SOP_Submodule_Nixification.md` to document the step-by-step process.
4.  Update `CRQ_016_Submodule_Nixification.md` with the relevant commit SHAs.
5.  Update `GEMINI.md` to summarize the Nixification efforts.

By following this workflow, we ensure that all significant changes are well-documented, traceable, and maintainable.