# `json_to_memes_extractor` Directory Documentation

This directory contains the source code for the `json_to_memes_extractor` command-line tool, as well as the Nix files for building and developing it.

## Files

*   `src/main.rs`: This tool extracts ticket data from concatenated JSON files and converts each ticket into a separate markdown file. The markdown files are saved in the `docs/memes/extracted_tickets/` directory.
*   `flake.nix`: This file defines the Nix flake for the `json_to_memes_extractor` tool. It uses `naersk` to build the Rust code, and it provides a development shell with all the necessary dependencies.
*   `default.nix`: This file is a simple wrapper around the `flake.nix` file that allows it to be used with `nix-build`.
*   `shell.nix`: This file is a simple wrapper around the `flake.nix` file that allows it to be used with `nix-shell`.
