# `emoji_llm_machine_rust` Directory Documentation

This directory contains the source code for the `emoji_llm_machine_rust` command-line tool, as well as the Nix files for building and developing it.

## Files

*   `src/main.rs`: This tool is an "emoji bytecode" interpreter. It takes a string of emojis and "executes" them by printing a corresponding action to the console.
*   `flake.nix`: This file defines the Nix flake for the `emoji_llm_machine_rust` tool. It uses `naersk` to build the Rust code, and it provides a development shell with all the necessary dependencies.
*   `default.nix`: This file is a simple wrapper around the `flake.nix` file that allows it to be used with `nix-build`.
*   `shell.nix`: This file is a simple wrapper around the `flake.nix` file that allows it to be used with `nix-shell`.
