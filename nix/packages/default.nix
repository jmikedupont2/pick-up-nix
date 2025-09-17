{ self, nixpkgs, nixpkgs-unstable, nixtract-src, nixpkgs-lint-src, streamofrandom, git-submodule-tools-rs, ... }:

{
  commonPackages = pkgs: geminiCliSrc:
    {
      hello = pkgs.hello;
      figlet = pkgs.figlet;
      which = pkgs.which;
      gemini-cli = pkgs.callPackage ./pkgs/gemini-cli { inherit geminiCliSrc; };
      batch-task-processor = pkgs.writeShellApplication {
        name = "batch-task-processor";
        runtimeInputs = [ pkgs.bash ];
        text = ''
          #!/usr/bin/env bash

          # Script for batch processing of tasks using gemini-cli

          # Function to log messages
          log() {
            echo "[INFO] $(date '+%Y-%m-%d %H:%M:%S') $1"
          }

          # Function to log errors
          error() {
            echo "[ERROR] $(date '+%Y-%m-%d %H:%M:%S') $1" >&2
            exit 1
          }

          # Check if at least one task file is provided
          if [ "$#" -eq 0 ]; then
            error "Usage: $0 <task_file1> [task_file2 ... ]"
          fi

          log "Starting batch task processing..."

          # Loop through each provided task file
          for task_file in "$@"; do
            if [ -f "$task_file" ]; then
              log "Processing task file: $task_file"

              # Extract the base task file name (e.g., prompts/task_001_emacs_lisp.md)
              base_task_file=$(echo "$task_file" | sed -E 's/\\.out.*//')

              if [ -f "$base_task_file" ]; then
                log "Consolidating output from '$task_file' into '$base_task_file'"
                printf "\n\n--- Output from %s ---\n" "$task_file" >> "$base_task_file"
                cat "$task_file" >> "$base_task_file"
                log "Deleting processed output file: $task_file"
                rm "$task_file"
              else
                error "Base task file '$base_task_file' not found for '$task_file'. Skipping consolidation."
              fi
            else
              log "Warning: Task file not found, skipping: $task_file"
            fi
          done

          log "Batch task processing completed."
        '';
      };
      tiktok_cli_adaptor = pkgs.callPackage "${streamofrandom}/livestream-tiktok-plugin/tiktok_cli_adaptor/default.nix" {};

      # Vendored tools
      # Now reference the inputs directly
      nixtract = pkgs.callPackage "${nixtract-src}/default.nix" {}; # Use the input path
      nixpkgs-lint = nixpkgs-lint-src.packages.${pkgs.system}.default; # Access its default package

      # Gemini Interaction package
      gemini-interaction = pkgs.callPackage ./pkgs/gemini-interaction { geminiCli = self.packages.${pkgs.system}.gemini-cli; };
      runprompt1-builder = pkgs.writeShellApplication {
        name = "runprompt1-builder";
        runtimeInputs = [ pkgs.bash ];
        text = builtins.readFile (git-submodule-tools-rs + "/runprompt1.sh");
      };

      hello-world-rust = pkgs.stdenv.mkDerivation rec {
        pname = "hello-world-rust";
        version = "0.1.0";

        src = builtins.path { path = self.inputs.self.outPath + "/tasks/hello-world-rust"; name = "hello-world-rust-src"; };

        buildInputs = with pkgs; [
          rustc
          cargo
        ];

        buildPhase = builtins.readFile ./tasks/hello-world-rust/build_phase.sh;

        installPhase = builtins.readFile ./tasks/hello-world-rust/install_phase.sh;

        meta = with pkgs.lib; {
          description = "A simple Rust 'Hello World' program as a Nix derivation.";
          homepage = "https://example.com/hello-world-rust";
          license = licenses.mit;
          platforms = platforms.linux;
        };
      };
    };
}