# SOP: Nix Flake Inputs - GitHub Meta-Introspector and Branch-Only Policy

## 1. Purpose

This Standard Operating Procedure (SOP) documents the mandatory policy for defining Nix flake inputs within this project. All external Nix flake inputs **must** originate from the `github:meta-introspector` organization and **must** specify a particular branch using the `?ref=` syntax. This policy ensures:

*   **Reproducibility:** Pinning to specific branches (rather than arbitrary commits or `main`/`master`) provides a stable and predictable dependency graph, crucial for consistent builds across different environments and over time.
*   **Control and Security:** By exclusively using forks within the `meta-introspector` GitHub organization, the project maintains direct control over its dependencies. This mitigates risks associated with upstream changes, allows for internal modifications or patches, and facilitates security audits.
*   **Alignment with bott Principles:** This approach embodies the "Integration/Pattern Recognition" (bott 17) and "Foundational Log Processing" (bott 2, 3, 5) principles by establishing a controlled and structured input mechanism for all external components, ensuring a consistent architectural genome.
*   **Transparency:** All external dependencies are explicitly declared and sourced from a known, controlled origin.

## 2. Scope

This SOP applies to all `flake.nix` files within the project that define external inputs.

## 3. Policy Details

### 3.1. GitHub Organization Requirement

All external Nix flake inputs **must** use the `github:meta-introspector` prefix in their URL. Direct references to other GitHub organizations or repositories are prohibited.

**Correct Example:**

```nix
inputs = {
  nixpkgs.url = "github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify";
};
```

**Incorrect Example:**

```nix
inputs = {
  nixpkgs.url = "github:NixOS/nixpkgs"; // Prohibited: Not from meta-introspector
};
```

### 3.2. Branch Reference Requirement

All external Nix flake inputs **must** specify a branch using the `?ref=` query parameter in their URL. Using `main`, `master`, or omitting the `ref` entirely (which defaults to `main`/`master`) is prohibited for external dependencies.

**Correct Example:**

```nix
inputs = {
  flake-utils.url = "github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify";
};
```

**Incorrect Examples:**

```nix
inputs = {
  flake-utils.url = "github:meta-introspector/flake-utils"; // Prohibited: No ref specified
  naersk.url = "github:meta-introspector/naersk?ref=main"; // Prohibited: Using 'main' branch
};
```

### 3.3. Local Inputs

Local flake inputs (e.g., `./path/to/flake`) are permitted as they are internal to the project and do not introduce external dependency management concerns.

## 4. Compliance and Enforcement

*   All new `flake.nix` files and modifications to existing ones must adhere to this policy.
*   Automated checks (e.g., pre-commit hooks, CI/CD pipelines) may be implemented to enforce this policy.
*   Any deviations from this policy require explicit approval via a Change Request (CRQ).

## 5. Related Documents

*   `GEMINI.md`: Project operational guidelines and context.
*   `docs/Nix_and_Precommit_Setup.md`: General documentation on Nix and pre-commit configurations.
*   `docs/crqs/CRQ-016_Submodule_Nixification_and_Flake_Refactoring.md`: Details the initial Nixification effort.
