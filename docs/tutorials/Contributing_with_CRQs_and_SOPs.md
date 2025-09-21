# Contributing with CRQs and SOPs

This tutorial outlines the process of contributing to the project using Change Request (CRQ) documents and Standard Operating Procedures (SOPs).

## What are CRQs?

Change Request (CRQ) documents are formal proposals for significant changes to the project. They provide a structured way to:

*   Describe the problem.
*   Propose a solution.
*   Outline the scope of the change.
*   Detail technical implementation.
*   Plan for testing and rollback.

Every significant change should be associated with a CRQ, and the CRQ number should be referenced in all related commit messages.

## What are SOPs?

Standard Operating Procedures (SOPs) are detailed, step-by-step instructions for performing recurring tasks within the project. They ensure consistency, reproducibility, and efficiency.

Every new bit of code or significant process should have an associated SOP.

## How to Contribute with CRQs and SOPs

1.  **Identify a need for change or a new process.**
2.  **Create a new CRQ document** in `docs/crqs/` if the change is significant. Follow the existing CRQ format.
3.  **Develop the solution or process.**
4.  **Create or update relevant SOPs** in `docs/sops/` to document the new process or changes to existing ones.
5.  **Implement the changes**, referencing the CRQ number in your commit messages.
6.  **Ensure all changes are tested and verified.**
7.  **Update `GEMINI.md`** and other relevant documentation to reflect the changes.
