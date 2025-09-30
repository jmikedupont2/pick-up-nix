# Pre-commit Hooks, Nixification, and Git Submodule Summary

This document provides a concise summary of the project's pre-commit hooks, indicating their associated Git submodules (if any), the specific branch or revision used, and whether the tool is managed or provided via Nix.

| Pre-commit Hook           | Submodule (if applicable)             | Branch/Rev                     | Nixified |
| :------------------------ | :------------------------------------ | :----------------------------- | :------- |
| `nixpkgs-fmt`             | `vendor/nixpkgs`                      | `feature/CRQ-016-nixify`       | Yes      |
| `statix`                  | -                                     | -                              | Yes      |
| `shellcheck`              | -                                     | -                              | Yes      |
| `crq-commit-msg-check`    | -                                     | -                              | No       |
| `crq-document-check`      | -                                     | -                              | No       |
| `script-sop-check`        | -                                     | -                              | No       |
| `pre-commit-hooks-collection` | `meta-introspector/pre-commit-hooks-collection` | `c58fa2b`                      | Yes      |
| `vale`                    | `vendor/hooks/vale-precommit`         | `feature/CRQ-016-nixify`       | Yes      |
| `lint-staged`             | -                                     | -                              | Yes      |
