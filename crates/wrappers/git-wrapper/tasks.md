# `git-wrapper` - Next Tasks

This document outlines potential future tasks and improvements for the `git-wrapper` crate.

## Core Functionality Enhancements

-   **Improve `GitItem` Data:**
    -   Expand `MyCommit` to include author, committer, and commit date.
    -   Expand `MyTree` to include entries (files and subtrees) with their names and object IDs.
    -   Expand `MyBlob` to include its content (e.g., as `Vec<u8>` or `String` for text blobs).
    -   Expand `MyTag` to include tagger, tag date, and message.

-   **Implement More `Readable` Methods:**
    -   Add methods to read Git objects by path within a tree (e.g., `read_blob_by_path`).
    -   Implement functionality to list the contents of a `MyTree` object.
    -   Add methods to resolve references (e.g., branch names, tags) to object IDs.

-   **Refine Error Handling:**
    -   Replace `Box<dyn std::error::Error>` with more specific custom error types for better error management and user feedback.

-   **Comprehensive Testing:**
    -   Add more unit tests for each `GitItem` type and their data extraction.
    -   Implement integration tests that simulate various Git repository scenarios.

## Nix Flake Enhancements

-   **Correct `RUST_SRC_PATH`:**
    -   Investigate and implement the correct way to set the `RUST_SRC_PATH` environment variable within the `devShell` for better IDE and language server support.

-   **Flake Usage Examples:**
    -   Add examples to `README.md` demonstrating how to build and run the `git-wrapper` package directly using `nix build` and `nix run`.

-   **Flake Checks and Formatting:**
    -   Integrate `cargo check`, `cargo fmt`, and `cargo clippy` into the flake's `checks` attribute for automated code quality checks.

## Application Development

-   **CLI Application:**
    -   Develop a simple command-line interface (CLI) application that leverages the `git-wrapper` library to perform basic Git object inspection tasks.

## Performance and Optimization

-   **Performance Profiling:**
    -   Profile the `read_from_repo` method and other object access patterns to identify and optimize performance bottlenecks, especially for large repositories.
