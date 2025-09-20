# Memo: Use Shellcheck Always After Changes

## Purpose

This memo serves as a reminder and best practice guideline for all shell script developers within the project. To maintain high-quality, robust, and error-free shell scripts, it is imperative to run `shellcheck` on every script after any modifications or new development.

## Policy

**Always run `shellcheck` on any shell script (`.sh` files) immediately after making changes and before committing.**

## Why Shellcheck?

`shellcheck` is a static analysis tool that gives warnings and suggestions for bash/sh shell scripts. It helps to:

*   **Identify common syntax errors:** Catch typos and structural mistakes early.
*   **Detect logical flaws:** Point out potential bugs that might not be immediately obvious.
*   **Enforce best practices:** Guide developers towards writing more robust and maintainable scripts.
*   **Improve portability:** Highlight constructs that might behave differently across various shell environments.
*   **Prevent security vulnerabilities:** Identify patterns that could lead to security issues.

## How to Use Shellcheck

To run `shellcheck` on a script, simply execute:

```bash
shellcheck your_script_name.sh
```

If your script has a shebang (e.g., `#!/usr/bin/env bash`), `shellcheck` will automatically detect the shell dialect. For scripts without a shebang or for specific shell dialects, you can specify it:

```bash
shellcheck -s bash your_script_name.sh
shellcheck -s sh your_script_name.sh
```

**Integrate into Workflow:** Consider integrating `shellcheck` into your local pre-commit hooks or CI/CD pipelines to automate this check.

## Compliance

Adherence to this policy is crucial for maintaining the quality and reliability of our automation infrastructure. All new and modified shell scripts are expected to pass `shellcheck` with zero critical errors or warnings.
