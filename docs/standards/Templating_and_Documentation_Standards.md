# Templating and Documentation Standards

## Date: 2025-09-19

## Purpose

This document establishes the standard practices for templating and documentation within this project. Adherence to these standards ensures consistency, maintainability, and clarity across all project artifacts.

## Core Principles

*   **No Heredocs in Shell Scripts:** Heredocs (`<<EOF`) are prohibited for embedding multi-line strings or documents directly within shell scripts. This practice can lead to readability issues, syntax errors, and makes content management difficult.
*   **No Inline Documentation:** Extensive inline documentation (e.g., large blocks of comments or multi-line strings serving as documentation) within code files should be avoided. Documentation should reside in dedicated, version-controlled documentation files.
*   **Standard Template Files Only:** All generated content (e.g., commit messages, configuration files, boilerplate code) must be produced from external, standardized template files. These templates ensure consistency and separation of concerns.
*   **Rust Templating Tool Standardization:** For all templating needs, a single, designated Rust-based templating tool will be used across the project. This standardizes the templating syntax and ecosystem, promoting reusability and reducing cognitive load.

## Implementation Guidelines

### Documentation

*   All significant processes, workflows, and architectural decisions must be documented in dedicated Markdown files within the `docs/` directory (e.g., `docs/sops/`, `docs/crqs/`, `docs/standards/`).
*   Code comments should be concise and explain *why* a piece of code exists or its non-obvious logic, rather than *what* it does.

### Templating

*   **Template Location:** Template files should be stored in a designated `templates/` directory, organized logically by their purpose (e.g., `templates/commit_messages/`, `templates/flake_nix/`).
*   **Rust Templating Tool: Tera**
    *   Tera will be the standardized Rust templating tool for all dynamic content generation.
    *   All scripts or programs requiring dynamic content generation from templates must invoke a Rust program that utilizes Tera.
    *   The Rust program will read the template file, process any variables, and output the final content.

## Rationale

These standards are established to:
*   Improve code readability and maintainability by separating logic from documentation and content.
*   Reduce errors caused by improper escaping or syntax in embedded strings.
*   Promote reusability of content and structure through centralized template files.
*   Streamline development by standardizing on a single, powerful templating solution.
