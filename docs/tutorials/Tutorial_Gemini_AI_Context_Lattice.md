# Tutorial: Navigating and Contributing to the Gemini AI Context Primorial Knowledge Lattice

This tutorial provides a guide to understanding, navigating, and contributing to the "Gemini AI Context Primorial Knowledge Lattice" within this project. This lattice is a structured system designed to enhance Gemini's contextual awareness and operational efficiency.

## 1. What is the Primorial Knowledge Lattice?

The Primorial Knowledge Lattice is a formalized system for organizing and storing contextual information directly within the project's filesystem. It leverages the natural hierarchy of directories and files to create a network of interconnected knowledge.

*   **Nodes**: Key pieces of information, primarily found in `GEMINI.md` files, CRQ documents, SOPs, and other documentation.
*   **Edges**: The relationships between these nodes are defined by the filesystem's directory structure. A file within a directory is inherently related to that directory's context.
*   **Primorial Elements**: Directories themselves, along with fundamental concepts (like CRQ numbers, script names, or module purposes), act as foundational "primorial" elements that classify and anchor information within the lattice.

The goal is to make Gemini's understanding of the project more explicit, consistent, and easily retrievable.

## 2. Why is this important?

By formalizing this knowledge lattice, we aim to:
*   **Improve Gemini's Contextual Understanding**: Provide Gemini with a richer, more structured understanding of the project, reducing the need for repeated information retrieval.
*   **Enhance Operational Efficiency**: Enable Gemini to quickly locate and apply relevant information, leading to faster and more accurate task execution.
*   **Increase Consistency**: Ensure Gemini adheres to project conventions and best practices by making these explicit within the lattice.
*   **Facilitate Knowledge Transfer**: Make the project's operational knowledge more transparent and accessible to both AI and human contributors.

## 3. Navigating the Knowledge Lattice

The primary way to navigate the knowledge lattice is by exploring the project's directory structure and examining the `GEMINI.md` files within them.

*   **Root `GEMINI.md`**: Start with the `GEMINI.md` file in the project's root directory (`./GEMINI.md`). This file provides a high-level overview of major project initiatives and key contextual summaries.
*   **Directory-Specific `GEMINI.md`**: As you delve into subdirectories (e.g., `vendor/nix/`, `scripts/`, `docs/crqs/`), look for `GEMINI.md` files within those directories. These files contain information specific to that particular part of the project.
*   **Cross-Referencing**: `GEMINI.md` files, CRQs, SOPs, and tutorials will often contain links to related documents, allowing you to traverse the lattice and gather more detailed information.

**Example Navigation Path:**
1.  Read `GEMINI.md` (root) for an overview of CRQ-016 (Submodule Nixification).
2.  Navigate to `docs/crqs/` and read `docs/crqs/GEMINI.md` for context on CRQ documents.
3.  Read `docs/crqs/CRQ_016_Submodule_Nixification.md` for full details on CRQ-016.
4.  Navigate to `docs/sops/` and read `docs/sops/GEMINI.md` for context on SOPs.
5.  Read `docs/sops/SOP_Submodule_Nixification.md` for the step-by-step procedure.
6.  Navigate to `scripts/` and read `scripts/GEMINI.md` for an overview of the automation scripts.
7.  Navigate to `vendor/nix/` and read `vendor/nix/GEMINI.md` for its role as the aggregation point for submodule flakes.

## 4. Contributing to the Knowledge Lattice

Maintaining an accurate and comprehensive knowledge lattice is a continuous process.

### 4.1. When to Create/Update a `GEMINI.md`

*   **New Major Feature/Module**: When introducing a new significant feature or module, create a `GEMINI.md` in its root directory to provide an overview.
*   **Significant Changes**: If a directory's purpose or its key contents change significantly, update its `GEMINI.md`.
*   **New CRQ/SOP/Tutorial**: When creating a new CRQ, SOP, or tutorial, ensure it's linked from relevant `GEMINI.md` files.
*   **Missing Context**: If you find yourself (or Gemini) repeatedly searching for information about a specific directory, it's a good indicator that a `GEMINI.md` is needed or needs updating.

### 4.2. `GEMINI.md` Content Guidelines

Refer to `docs/sops/SOP_Gemini_AI_Context_Lattice.md` for detailed guidelines on structuring and writing `GEMINI.md` content. Key principles include:
*   Conciseness and high-value summaries.
*   Clear description of the directory's purpose.
*   Inclusion of a "Key Information" section.
*   Links to related detailed documents.

### 4.3. Git Workflow

Always commit changes to `GEMINI.md` files to Git. Use clear and descriptive commit messages, following the convention: `docs(gemini): <action> GEMINI.md for <directory_path>`.

## 5. Troubleshooting

*   **Gemini Lacks Context**: If Gemini seems to be missing information, first check the `GEMINI.md` in the relevant directory and its parent directories. Ensure the information is present and up-to-date.
*   **Redundant Information**: Avoid duplicating large blocks of text. Instead, summarize and link to the authoritative source (e.g., a CRQ or SOP).

## 6. Related Documents

*   CRQ-017: Formalizing Gemini AI Context as a Primorial Knowledge Lattice
*   SOP_Gemini_AI_Context_Lattice.md
*   All CRQ documents in `docs/crqs/`
*   All SOP documents in `docs/sops/`
*   All tutorial documents in `docs/tutorials/`
