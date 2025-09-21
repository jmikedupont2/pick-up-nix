# `pick-up-nix-cli` Directory Documentation

This directory contains the source code for the `pick-up-nix-cli` command-line tool, as well as the Nix files for building and developing it.

## Files

*   `src/main.rs`: This file contains the main logic for the `pick-up-nix-cli` command-line tool. The tool has three subcommands: `evaluate`, `trace`, and `tracenix`.
*   `src/events/mod.rs`: This file defines the data structures for the system events that are captured by the `trace` and `tracenix` commands.
*   `src/generator/mod.rs`: This file contains the `StraceGenerator`, which is responsible for tracing the system calls of a command.
*   `flake.nix`: This file defines the Nix flake for the `pick-up-nix-cli` tool. It uses `naersk` to build the Rust code, and it provides a development shell with all the necessary dependencies.
*   `default.nix`: This file is a simple wrapper around the `flake.nix` file that allows it to be used with `nix-build`.
*   `shell.nix`: This file is a simple wrapper around the `flake.nix` file that allows it to be used with `nix-shell`.
