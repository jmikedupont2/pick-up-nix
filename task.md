# Project Rundown

This project is focused on setting up a development environment using Nix, specifically for Android (nix-on-droid) and other Linux systems. We are using Nix flakes for configuration management.

## Current Activities:

1.  **Building `asciinema` with Nix Flakes:** We have successfully built a vendored `asciinema` flake.
2.  **Automating Session Recording:** We are setting up `boot.sh` and `run_boot.sh` scripts to automatically record development sessions using the built `asciinema` binary within a `tmux` session.
3.  **Gemini CLI Integration:** The `run_boot.sh` script is configured to launch the Gemini CLI within the recorded `tmux` session.

## Next Steps:

*   Verify the complete workflow of `boot.sh` launching `asciinema` and `tmux`, and then starting the Gemini CLI.
*   Continue with development tasks within the Gemini CLI.

## Project Information

### Log Locations

Asciinema recordings of development sessions are stored in:
`${HOME}/logs/gemini/`

Each session will have a unique filename based on the timestamp (e.g., `session_YYYYMMDD_HHMMSS.cast`).

### Building the Project

To build the `asciinema` flake (which is a core component for session recording), run the following command from the project root:

```bash
nix build ./vendor/external/asciinema
```

Upon successful completion, a symlink named `result` will be created in the project root, pointing to the built `asciinema` package in the Nix store. The executable can then be found at `./result/bin/asciinema`.