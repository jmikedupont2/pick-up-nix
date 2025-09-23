# `if-counter` Directory Documentation

This directory contains the source code for the `if-counter` command-line tool, as well as the Nix files for building and developing it.

## Files

*   `src/main.rs`: This tool counts the number of nested `if` statements in a C file.
*   `flake.nix`: This file defines the Nix flake for the `if-counter` tool. It uses `naersk` to build the Rust code, and it provides a development shell with all the necessary dependencies.
*   `default.nix`: This file is a simple wrapper around the `flake.nix` file that allows it to be used with `nix-build`.
*   `shell.nix`: This file is a simple wrapper around the `flake.nix` file that allows it to be used with `nix-shell`.
