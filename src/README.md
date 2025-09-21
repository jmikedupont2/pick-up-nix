# `src` Directory Documentation

This directory contains the source code for the `nix-introspector` command-line tool, as well as the Nix files for building and developing it.

## Files

*   `main.rs`: This file contains the main logic for the `nix-introspector` command-line tool. The tool has two subcommands: `evaluate` and `analyze-fixed-point`. The `evaluate` subcommand is designed to test a new tool in a temporary Nix environment, while the `analyze-fixed-point` subcommand performs a more abstract analysis of a "knowledge lattice."
*   `flake.nix`: This file defines the Nix flake for the `nix-introspector` tool. It uses `naersk` to build the Rust code, and it provides a development shell with all the necessary dependencies.
*   `default.nix`: This file is a simple wrapper around the `flake.nix` file that allows it to be used with `nix-build`.
*   `shell.nix`: This file is a simple wrapper around the `flake.nix` file that allows it to be used with `nix-shell`.
*   `fixed_point_enum.rs`: This file defines the `KnowledgeConcept` enum, which is used in the `analyze-fixed-point` subcommand.
*   `fixed_point_traits.rs`: This file defines the `FixedPointAnalysis` traits, which are used in the `analyze-fixed-point` subcommand.
