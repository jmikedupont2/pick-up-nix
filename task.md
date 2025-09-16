# Project Rundown

This project is focused on setting up a development environment using Nix, specifically for Android (nix-on-droid) and other Linux systems. We are using Nix flakes for configuration management.

## Recent Accomplishments:
-   Implemented Nix-based Git submodule management, including reproducible checkouts and automated flake generation.
-   Integrated mkAIDerivation as a Git submodule, with associated helper scripts found at `task/ainix/add_mkaiderivation_submodule.sh` and `task/ainix/update_all_submodules.sh` (also present in `source/github/meta-introspector/git-submodule-tools-rs/tools/`).
-   Enhanced Gemini CLI prompt processing with a sliding window context.
-   Developed and integrated Emacs Lisp functions for Gemini CLI interaction, enabling interactive commands and automated task processing within Emacs. (See prompts/task_001_emacs_lisp.md.out1.md for details and usage instructions).
-   Created GitHub Actions workflow for automated submodule updates.
-   Documented automated submodule updates and Nix submodule integration.
-   Consolidated generated prompt outputs into base task files and cleaned up temporary files.
-   Standardized task documentation with SOPs and CRQs.

## Current Activities:
-   Implementing and refining documentation SOPs, including those for meme identification and general task documentation.
-   Generating and documenting executable memes in Rust, supported by Nix flake generation for submodules.
-   Creating a comprehensive table of meme correspondences.
-   Generating reflection memes for all existing memes.
-   Reviewing and standardizing `prompts/task_X.md` files, with enhanced prompt processing.
-   Consolidating numerous CRQs into new, focused task files.
-   Grouped and proposed new tasks for `Cargo.toml` file groups.
-   Continuing development of a podcast episode generator for submodule commits.

## Next Steps:
-   Begin work on the newly defined tasks for `Cargo.toml` file groups.
-   Further refining the SOPs based on ongoing observations and challenges.
-   Continuously identifying and documenting new memes from various project sources.
-   Always initiate crash recovery on boot, following the MIB Crash Retrieval Protocol.
-   **Deferred**: Submodule migration of `vendor/quasi-meta-meme` to `source/github/meta-introspector/quasi-meta-meme`. This will be addressed in a future task after SOPs and CRQs are updated.

## Project Information

### Log Locations

Asciinema recordings of development sessions are stored in:
`${HOME}/logs/gemini/`

Each session will have a unique filename based on the timestamp (e.g., `session_YYYYMMDD_HHMMSS.cast`).

### Building the Project

# Standards

ITIL
GMP
6sigma
OODA
ISO9k
Agile
Extreme Programming
Pure functional monotonic mondaic lattice oriented code
the vibe is the vector is the function is the poem is the code.



For a catalog of memes and their associated emojis, see [Meme Catalog](docs/memes/meme_catalog.md)