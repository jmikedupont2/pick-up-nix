# `log_processor` Directory Documentation

This directory contains the source code for the `log_processor` command-line tool, as well as the Nix files for building and developing it.

## Files

*   `src/main.rs`: This tool lists all the files in the Gemini logs and Asciinema recordings directories, along with their last modified times. The paths to these directories are specified in a configuration file that is passed as a command-line argument.
*   `flake.nix`: This file defines the Nix flake for the `log_processor` tool. It uses `naersk` to build the Rust code, and it provides a development shell with all the necessary dependencies.
*   `default.nix`: This file is a simple wrapper around the `flake.nix` file that allows it to be used with `nix-build`.
*   `shell.nix`: This file is a simple wrapper around the `flake.nix` file that allows it to be used with `nix-shell`.
