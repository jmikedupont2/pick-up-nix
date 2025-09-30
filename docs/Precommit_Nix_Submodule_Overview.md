# Pre-commit Hooks, Nix Packages, and Git Submodule Overview

This document provides a comprehensive overview of the pre-commit hooks configured in the project, the Nix packages that support them, and the Git submodules that are integrated for centralized dependency management.

## 1. Pre-commit Hooks and Nix Package Mapping

The following table details each pre-commit hook, its purpose, type (local or external), and the corresponding Nix package that provides the necessary tool within the development environment.

| Hook ID                   | Description                                       | Type      | Nix Package (from `devShells.default`) | Git Submodule (if applicable)                               | Git URL                                                              | Git Branch/Rev (if applicable) |
| :------------------------ | :------------------------------------------------ | :-------- | :------------------------------------- | :---------------------------------------------------------- | :------------------------------------------------------------------- | :----------------------------- |
| `nixpkgs-fmt`             | Formats Nix files.                                | Local     | `pkgs.nixpkgs-fmt`                     | `vendor/nixpkgs`                                            | `https://github.com/meta-introspector/nixpkgs`                       | `feature/CRQ-016-nixify` (via flake input) |
| `statix`                  | Static analysis for Nix files.                    | Local     | `pkgs.statix`                          | -                                                           | -                                                                    | -                              |
| `shellcheck`              | Lints shell scripts.                              | Local     | `pkgs.shellcheck`                      | `vendor/lint/shellcheck`                                    | `https://github.com/koalaman/shellcheck`                             | -                              |
| `crq-commit-msg-check`    | Enforces CRQ numbering in commit messages.        | Local     | - (script)                             | -                                                           | -                                                                    | -                              |
| `crq-document-check`      | Checks for referenced CRQ documents.              | Local     | - (script)                             | -                                                           | -                                                                    | -                              |
| `script-sop-check`        | Checks for SOP documentation for scripts.         | Local     | - (script)                             | -                                                           | -                                                                    | -                              |
| `pre-commit-hooks-collection` | General-purpose pre-commit hooks.                 | External  | `pkgs.pre-commit`                      | -                                                           | `https://github.com/meta-introspector/pre-commit-hooks-collection` | `c58fa2b`                      |
| `vale`                    | Prose linter for writing style, grammar, and tone.| External  | `pkgs.vale`                            | `vendor/hooks/vale-precommit`                               | `https://github.com/meta-introspector/vale-precommit`                | `feature/CRQ-016-nixify`       |
| `lint-staged`             | Runs linters on staged Git files.                 | Local     | `vendoredLintStaged`                   | -                                                           | -                                                                    | -                              |

## 2. Nix Flake Inputs from GitHub Meta-Introspector

The project adheres to a strict policy of sourcing all external Nix flake inputs from the `github:meta-introspector` organization and pinning them to specific branches. This ensures reproducibility, control, and security.

| Flake Input Name | GitHub URL                                                              | Branch/Ref                     |
| :--------------- | :---------------------------------------------------------------------- | :----------------------------- |
| `nixpkgs`        | `github:meta-introspector/nixpkgs`                                      | `feature/CRQ-016-nixify`       |
| `flake-utils`    | `github:meta-introspector/flake-utils`                                  | `feature/CRQ-016-nixify`       |
| `naersk`         | `github:meta-introspector/naersk`                                       | `feature/CRQ-016-nixify`       |
| `rust-overlay`   | `github:meta-introspector/rust-overlay`                                 | `feature/CRQ-016-nixify`       |
| `treefmt-nix`    | `github:meta-introspector/treefmt-nix`                                  | `feature/CRQ-016-nixify`       |
| `sops-nix`       | `github:meta-introspector/sops-nix`                                     | - (implicitly `feature/CRQ-016-nixify` via policy) |

## 3. Centralized Git Submodule Management

The project utilizes Git submodules to manage a wide array of external repositories, many of which are Nix-related or provide tools used in the development workflow. These submodules are defined in the project's root `.gitmodules` file.

| Submodule Name                                      | Path                                      | URL                                                                    | Branch/Rev (if specified)      |
| :-------------------------------------------------- | :---------------------------------------- | :--------------------------------------------------------------------- | :----------------------------- |
| `vendor/rust-index-guix`                            | `vendor/rust-index-guix`                  | `https://github.com/meta-introspector/rust-index-guix`                 | -                              |
| `.github/actions/install-nix-action`                | `.github/actions/install-nix-action`      | `https://github.com/meta-introspector/install-nix-action`              | -                              |
| `.github/actions/nix-github-actions`                | `.github/actions/nix-github-actions`      | `https://github.com/meta-introspector/nix-github-actions`              | -                              |
| `.github/actions/nix-installer-action`              | `.github/actions/nix-installer-action`    | `https://github.com/meta-introspector/nix-installer-action`            | -                              |
| `.github/actions/cache-nix-action`                  | `.github/actions/cache-nix-action`        | `https://github.com/meta-introspector/cache-nix-action`                | -                              |
| `.github/actions/cache`                             | `.github/actions/cache`                   | `https://github.com/meta-introspector/cache`                           | -                              |
| `.github/actions/checkout`                          | `.github/actions/checkout`                | `https://github.com/meta-introspector/checkout`                        | -                              |
| `vendor/rnix-parser`                                | `vendor/rnix-parser`                      | `https://github.com/nix-community/rnix-parser`                         | -                              |
| `.github/actions/upload-artifact`                   | `.github/actions/upload-artifact`         | `https://github.com/meta-introspector/upload-artifact`                 | -                              |
| `vendor/nix-on-droid`                               | `vendor/nix-on-droid`                     | `https://github.com/nix-community/nix-on-droid`                        | -                              |
| `vendor/nix/nix`                                    | `vendor/nix/nix`                          | `https://github.com/NixOS/nix`                                         | -                              |
| `source/github/jmikedupont2/orgs/Escaped-RDFa/namespace` | `source/github/jmikedupont2/orgs/Escaped-RDFa/namespace` | `https://github.com/Escaped-RDFa/namespace`                            | -                              |
| `source/github/meta-introspector/git-submodule-tools-rs` | `source/github/meta-introspector/git-submodule-tools-rs` | `https://github.com/meta-introspector/git-submodule-tools-rs`          | -                              |
| `vendor/external/git-submodule-tools-rs`            | `vendor/external/git-submodule-tools-rs`  | `https://github.com/meta-introspector/git-submodule-tools-rs`          | -                              |
| `source/github/meta-introspector/solfunmeme`        | `source/github/meta-introspector/solfunmeme` | `https://github.com/meta-introspector/solfunmeme`                      | -                              |
| `source/github/meta-introspector/lean4`             | `vendor/lean/lean4`                       | `https://github.com/meta-introspector/lean4`                           | -                              |
| `vendor/external/forgejo-python`                    | `vendor/external/forgejo-python`          | `https://github.com/meta-introspector/forgejo-python`                  | -                              |
| `vendor/external/tmux`                              | `vendor/external/tmux`                    | `https://github.com/tmux/tmux`                                         | -                              |
| `vendor/external/minizinc-introspector`             | `vendor/external/minizinc-introspector`   | `https://github.com/meta-introspector/minizinc-introspector`           | -                              |
| `vendor/external/tmux-interface-rs`                 | `vendor/external/tmux-interface-rs`       | `https://github.com/meta-introspector/tmux-interface-rs`               | -                              |
| `vendor/external/n00b`                              | `vendor/external/n00b`                    | `https://github.com/meta-introspector/n00b`                            | -                              |
| `vendor/external/monomcp-rust`                      | `vendor/external/monomcp-rust`            | `https://github.com/meta-introspector/monomcp-rust`                    | -                              |
| `vendor/external/hugging-face-dataset-validator-rust` | `vendor/external/hugging-face-dataset-validator-rust` | `https://github.com/meta-introspector/hugging-face-dataset-validator-rust` | -                              |
| `vendor/external/turbomcp`                          | `vendor/external/turbomcp`                | `https://github.com/meta-introspector/turbomcp`                        | -                              |
| `vendor/external/bitchat-solana-zos-solfunmeme`     | `vendor/external/bitchat-solana-zos-solfunmeme` | `https://github.com/meta-introspector/bitchat-solana-zos-solfunmeme` | -                              |
| `vendor/external/trident`                           | `vendor/external/trident`                 | `https://github.com/meta-introspector/trident`                         | -                              |
| `vendor/external/solfunmeme-banner`                 | `vendor/external/solfunmeme-banner`       | `https://github.com/meta-introspector/solfunmeme-banner`               | -                              |
| `vendor/external/ragit`                             | `vendor/external/ragit`                   | `https://github.com/meta-introspector/ragit`                           | -                              |
| `vendor/external/bootstrap-meme`                    | `vendor/external/bootstrap-meme`          | `https://github.com/meta-introspector/bootstrap-meme`                  | -                              |
| `vendor/external/emojis-rs`                         | `vendor/external/emojis-rs`               | `https://github.com/meta-introspector/emojis-rs`                       | -                              |
| `vendor/external/introspector-llc`                  | `vendor/external/introspector-llc`        | `https://github.com/meta-introspector/introspector-llc`                | -                              |
| `vendor/external/coccinelleforrust_personal_mirror` | `vendor/external/coccinelleforrust_personal_mirror` | `https://github.com/meta-introspector/coccinelleforrust_personal_mirror` | -                              |
| `vendor/external/solfunmeme-model-builder-quiz`     | `vendor/external/solfunmeme-model-builder-quiz` | `https://github.com/meta-introspector/solfunmeme-model-builder-quiz` | -                              |
| `vendor/external/solfunmeme-dioxus`                 | `vendor/external/solfunmeme-dioxus`       | `https://github.com/meta-introspector/solfunmeme-dioxus`               | -                              |
| `vendor/external/sophia_rs`                         | `vendor/external/sophia_rs`               | `https://github.com/meta-introspector/sophia_rs`                       | -                              |
| `vendor/external/solfunmeme-metameme`               | `vendor/external/solfunmeme-metameme`     | `https://github.com/meta-introspector/solfunmeme-metameme`             | -                              |
| `vendor/external/amazon-q-developer-cli`            | `vendor/external/amazon-q-developer-cli`  | `https://github.com/meta-introspector/amazon-q-developer-cli`          | -                              |
| `vendor/external/grok-cli`                          | `vendor/external/grok-cli`                | `https://github.com/meta-introspector/grok-cli`                        | -                              |
| `vendor/external/tclifford`                         | `vendor/external/tclifford`               | `https://github.com/meta-introspector/tclifford`                       | -                              |
| `vendor/external/meta-meme`                         | `vendor/external/meta-meme`               | `https://github.com/meta-introspector/meta-meme`                       | -                              |
| `vendor/external/gemini-cli`                        | `vendor/external/gemini-cli`              | `https://github.com/meta-introspector/gemini-cli`                      | -                              |
| `source/github/meta-introspector/streamofrandom`    | `source/github/meta-introspector/streamofrandom` | `https://github.com/meta-introspector/streamofrandom`                  | -                              |
| `source/github/meta-introspector/lattice-introspector` | `source/github/meta-introspector/lattice-introspector` | `https://github.com/meta-introspector/lattice-introspector`            | -                              |
| `vendor/external/rust`                              | `vendor/external/rust`                    | `https://github.com/meta-introspector/rust`                            | -                              |
| `vendor/external/asciinema-scenario`                | `vendor/external/asciinema-scenario`      | `https://github.com/garbas/asciinema-scenario`                         | -                              |
| `vendor/external/nix-asciinema-agg`                 | `vendor/external/nix-asciinema-agg`       | `https://github.com/a-h/nix-asciinema-agg`                             | -                              |
| `vendor/external/asciinema`                         | `vendor/external/asciinema`               | `https://github.com/asciinema/asciinema`                               | -                              |
| `vendor/nix/nixtract`                               | `vendor/nix/nixtract`                     | `https://github.com/tweag/nixtract`                                    | -                              |
| `vendor/nix/nixpkgs-lint`                           | `vendor/nix/nixpkgs-lint`                 | `https://github.com/nix-community/nixpkgs-lint`                        | -                              |
| `vendor/guix/mes`                                   | `vendor/guix/mes`                         | `https://github.com/meta-introspector/mes`                             | -                              |
| `vendor/guix/guix`                                  | `vendor/guix/guix`                        | `https://github.com/meta-introspector/guix`                            | -                              |
| `vendor/lang-c`                                     | `vendor/lang-c`                           | `https://github.com/vickenty/lang-c`                                   | -                              |
| `vendor/steel`                                      | `vendor/steel`                            | `https://github.com/mattwparas/steel`                                  | -                              |
| `vendor/strace/dutchcoders-trace`                   | `vendor/strace/dutchcoders-trace`         | `https://github.com/dutchcoders/trace`                                 | -                              |
| `vendor/strace/intentrace`                          | `vendor/strace/intentrace`                | `https://github.com/sectordistrict/intentrace`                         | -                              |
| `vendor/strace/lurk`                                | `vendor/strace/lurk`                      | `https://github.com/JakWai01/lurk`                                     | -                              |
| `vendor/strace/rstrace`                             | `vendor/strace/rstrace`                   | `https://github.com/thundergolfer/strace-rs`                           | -                              |
| `source/github/meta-introspector/quasi-meta-meme`   | `source/github/meta-introspector/quasi-meta-meme` | `https://github.com/meta-introspector/quasi-meta-meme`                 | -                              |
| `source/github/meta-introspector/hackathon`         | `source/github/meta-introspector/hackathon` | `https://github.com/meta-introspector/hackathon`                       | -                              |
| `vendor/external/github-issues-export-rs`           | `vendor/external/github-issues-export-rs` | `https://github.com/boxdot/github-issues-export-rs`                    | -                              |
| `source/github/meta-introspector/minizinc-introspector` | `source/github/meta-introspector/minizinc-introspector` | `https://github.com/meta-introspector/minizinc-introspector`           | -                              |
| `source/github/meta-introspector/time`              | `source/github/meta-introspector/time`    | `https://github.com/meta-introspector/time/`                           | -                              |
| `source/github/meta-introspector/neo`               | `source/github/meta-introspector/neo`     | `https://github.com/meta-introspector/neo`                             | -                              |
| `source/github/meta-introspector/neo2`              | `source/github/meta-introspector/neo2`    | `https://github.com/meta-introspector/neo`                             | -                              |
| `vendor/nixpkgs`                                    | `vendor/nixpkgs`                          | `https://github.com/meta-introspector/nixpkgs`                         | -                              |
| `vendor/plantuml-stdlib/C4-PlantUML`                | `vendor/plantuml-stdlib/C4-PlantUML`      | `https://github.com/plantuml-stdlib/C4-PlantUML`                       | -                              |
| `vendor/ebpf/aya`                                   | `vendor/ebpf/aya`                         | `https://github.com/meta-introspector/aya`                             | -                              |
| `vendor/ebpf/bpfjit`                                | `vendor/ebpf/bpfjit`                      | `https://github.com/meta-introspector/bpfjit`                          | -                              |
| `vendor/ebpf/bpfman`                                | `vendor/ebpf/bpfman`                      | `https://github.com/bpfman/bpfman`                                     | -                              |
| `vendor/ebpf/clean-dns-bpf`                         | `vendor/ebpf/clean-dns-bpf`               | `https://github.com/ihciah/clean-dns-bpf`                              | -                              |
| `vendor/ebpf/eadb`                                  | `vendor/ebpf/eadb`                        | `https://github.com/tiann/eadb`                                        | -                              |
| `vendor/ebpf/ebpfguard`                             | `vendor/ebpf/ebpfguard`                   | `https://github.com/deepfence/ebpfguard`                               | -                              |
| `vendor/ebpf/libbpf-rs`                             | `vendor/ebpf/libbpf-rs`                   | `https://github.com/libbpf/libbpf-rs`                                  | -                              |
| `vendor/ebpf/rbpf`                                  | `vendor/ebpf/rbpf`                        | `https://github.com/qmonnet/rbpf`                                      | -                              |
| `source/github/meta-introspector/git-submodules-rs-nix` | `source/github/meta-introspector/git-submodules-rs-nix` | `https://github.com/meta-introspector/git-submodules-rs-nix.git`       | -                              |
| `vendor/mkAIDerivation`                             | `vendor/mkAIDerivation`                   | `https://github.com/meta-introspector/mkAIDerivation.git`              | -                              |
| `vendor/nix/renix`                                  | `vendor/nix/renix`                        | `https://github.com/meta-introspector/renix.git`                       | -                              |
| `vendor/nix/nix-config-merger`                      | `vendor/nix/nix-config-merger`            | `https://github.com/spectropaws/nix-config-merger`                     | -                              |
| `vendor/nix/nix-files-comparator`                   | `vendor/nix/nix-files-comparator`         | `https://github.com/yashghogre/nix-files-comparator`                   | -                              |
| `vendor/nix/rnix-parser-tester`                     | `vendor/nix/rnix-parser-tester`           | `https://github.com/darichey/rnix-parser-tester`                       | -                              |
| `source/github/meta-introspector/introspector-llc`  | `source/github/meta-introspector/introspector-llc` | `https://github.com/meta-introspector/introspector-llc/`               | -                              |
| `vendor/nix/nix-direnv`                             | `vendor/nix/nix-direnv`                   | `https://github.com/nix-community/nix-direnv`                          | -                              |
| `vendor/hooks/shellcheck-precommit`                 | `vendor/hooks/shellcheck-precommit`       | `https://github.com/koalaman/shellcheck-precommit`                     | -                              |
| `vendor/hooks/rusty-hook`                           | `vendor/hooks/rusty-hook`                 | `https://github.com/swellaby/rusty-hook`                               | -                              |
| `vendor/hooks/shebling`                             | `vendor/hooks/shebling`                   | `https://github.com/MariaSolOs/shebling`                               | -                              |
| `vendor/nix/tvix`                                   | `vendor/nix/tvix`                         | `https://github.com/tvlfyi/tvix`                                       | -                              |
| `vendor/nix/nil`                                    | `vendor/nix/nil`                          | `https://github.com/oxalica/nil`                                       | -                              |
| `vendor/lint/shellcheck`                            | `vendor/lint/shellcheck`                  | `https://github.com/koalaman/shellcheck`                               | -                              |
| `vendor/lint/git-hooks.nix`                         | `vendor/lint/git-hooks.nix`               | `https://github.com/cachix/git-hooks.nix`                              | -                              |
| `vendor/lint/cachix-git-hooks.nix`                  | `vendor/lint/cachix-git-hooks.nix`        | `https://github.com/cachix/git-hooks.nix`                              | -                              |
| `vendor/nix/nixpacks`                               | `vendor/nix/nixpacks`                     | `https://github.com/meta-introspector/nixpacks`                        | -                              |
| `source/github/meta-introspector/ragit`             | `source/github/meta-introspector/ragit`   | `https://github.com/meta-introspector/ragit`                           | -                              |
| `vendor/nix/flake-utils`                            | `vendor/nix/flake-utils`                  | `https://github.com/meta-introspector/flake-utils`                     | -                              |
| `vendor/tools/detect-duplicates`                    | `vendor/tools/detect-duplicates`          | `https://github.com/meta-introspector/detect-duplicates`               | -                              |
| `vendor/nix/fenix`                                  | `vendor/nix/fenix`                        | `https://github.com/nix-community/fenix.git`                           | -                              |
| `vendor/nix/nix-systems-default`                    | `vendor/nix/nix-systems-default`          | `https://github.com/nix-systems/default.git`                           | -                              |
| `vendor/nix/nix-systems-default-fork`               | `vendor/nix/nix-systems-default-fork`     | `https://github.com/nix-systems/default.git`                           | -                              |
| `vendor/nix/home-manager`                           | `vendor/nix/home-manager`                 | `https://github.com/nix-community/home-manager.git`                    | -                              |
| `vendor/nix/nix-asciinema-agg`                      | `vendor/nix/nix-asciinema-agg`            | `https://github.com/a-h/nix-asciinema-agg.git`                         | -                              |
| `vendor/external/fenix`                             | `vendor/external/fenix`                   | `https://github.com/nix-community/fenix`                               | -                              |
| `vendor/rust/just`                                  | `vendor/rust/just`                        | `https://github.com/casey/just`                                        | -                              |
| `source/github/meta-introspector/bootstrap`         | `source/github/meta-introspector/bootstrap` | `https://github.com/meta-introspector/bootstrap`                       | -                              |
| `vendor/nix/nix-nar-rs`                             | `vendor/nix/nix-nar-rs`                   | `https://gitlab.com/abstract-binary/nix-nar-rs`                        | -                              |
| `source/github/meta-introspector/ai-ml-zk-ops`      | `source/github/meta-introspector/ai-ml-zk-ops` | `https://github.com/meta-introspector/ai-ml-zk-ops`                    | -                              |
| `vendor/nix/rust-overlay`                           | `vendor/nix/rust-overlay`                 | `https://github.com/meta-introspector/rust-overlay`                    | `feature/CRQ-016-nixify`       |
| `vendor/nix/naersk`                                 | `vendor/nix/naersk`                       | `https://github.com/meta-introspector/naersk`                          | `feature/CRQ-016-nixify`       |
| `vendor/nix/flake-parts`                            | `vendor/nix/flake-parts`                  | `https://github.com/meta-introspector/flake-parts`                     | `feature/CRQ-016-nixify`       |
| `vendor/nix/treefmt-nix`                            | `vendor/nix/treefmt-nix`                  | `https://github.com/meta-introspector/treefmt-nix`                     | `feature/CRQ-016-nixify`       |
| `vendor/nix/yarnpnp2nix`                            | `vendor/nix/yarnpnp2nix`                  | `https://github.com/madjam002/yarnpnp2nix`                              | -                              |
| `vendor/external/copilot-cli`                       | `vendor/external/copilot-cli`             | `https://github.com/github/copilot-cli.git`                            | -                              |
| `source/github/meta-introspector/solfunmeme-gitbook` | `source/github/meta-introspector/solfunmeme-gitbook` | `https://github.com/meta-introspector/solfunmeme-gitbook.git`          | -                              |
| `source/github/meta-introspector/solfunmeme-metameme` | `source/github/meta-introspector/solfunmeme-metameme` | `https://github.com/meta-introspector/solfunmeme-metameme.git`         | -                              |
| `vendor/nix/factorio-mods-nix`                      | `vendor/nix/factorio-mods-nix`            | `https://github.com/YellowOnion/factorio-mods-nix`                     | -                              |
| `vendor/nix/vpsfree-cz-configuration`               | `vendor/nix/vpsfree-cz-configuration`     | `https://github.com/meta-introspector/vpsfree-cz-configuration`        | -                              |
| `vendor/nix/sops-nix`                               | `vendor/nix/sops-nix`                     | `https://github.com/meta-introspector/sops-nix`                        | -                              |
| `nix/vendor/nix/croissong-system`                   | `nix/vendor/nix/croissong-system`         | `https://github.com/croissong/system`                                  | -                              |
| `nix/vendor/nix/bbigras-nix-config`                 | `nix/vendor/nix/bbigras-nix-config`       | `https://github.com/bbigras/nix-config`                                | -                              |
| `nix/vendor/nix/gmkonan-flake`                      | `nix/vendor/nix/gmkonan-flake`            | `https://github.com/GMkonan/flake`                                     | -                              |
| `nix/vendor/nix/jpetrucciani-nix`                   | `nix/vendor/nix/jpetrucciani-nix`         | `https://github.com/jpetrucciani/nix`                                  | -                              |
| `nix/vendor/nix/stites-configs-mirror`              | `nix/vendor/nix/stites-configs-mirror`    | `https://github.com/stites/configs-mirror`                             | -                              |
| `nix/vendor/nix/privatevoid-depot`                  | `nix/vendor/nix/privatevoid-depot`        | `https://github.com/privatevoid-net/depot`                             | -                              |
| `nix/vendor/nix/catircservices-org`                 | `nix/vendor/nix/catircservices-org`       | `https://github.com/catircservices/catircservices.org`                 | -                              |
| `nix/vendor/nix/duck1123-k3s-fleetops`              | `nix/vendor/nix/duck1123-k3s-fleetops`    | `https://github.com/duck1123/k3s-fleetops`                             | -                              |
| `nix/vendor/nix/dominicegginton-dotfiles`           | `nix/vendor/nix/dominicegginton-dotfiles` | `https://github.com/dominicegginton/dotfiles`                          | -                              |
| `nix/vendor/nix/fort-nix-bitcoin`                   | `nix/vendor/nix/fort-nix-bitcoin`         | `https://github.com/fort-nix/nix-bitcoin`                              | -                              |
| `nix/vendor/nix/bojeran-dotfiles`                   | `nix/vendor/nix/bojeran-dotfiles`         | `https://github.com/bojeran/dotfiles`                                  | -                              |
| `nix/vendor/nix/sheeeng-nix`                        | `nix/vendor/nix/sheeeng-nix`              | `https://github.com/sheeeng/nix`                                       | -                              |
| `nix/vendor/nix/fjolne-dotfiles`                    | `nix/vendor/nix/fjolne-dotfiles`          | `https://github.com/fjolne/dotfiles`                                   | -                              |
| `nix/vendor/nix/vpsfreecz-config`                   | `nix/vendor/nix/vpsfreecz-config`         | `https://github.com/vpsfreecz/vpsfree-cz-configuration`                | -                              |
| `nix/vendor/nix/disassembler-network`               | `nix/vendor/nix/disassembler-network`     | `https://github.com/disassembler/network`                              | -                              |
| `vendor/hooks/vale-precommit`                       | `vendor/hooks/vale-precommit`             | `https://github.com/meta-introspector/vale-precommit`                  | -                              |
| `vendor/hooks/vale`                                 | `vendor/hooks/vale`                       | `https://github.com/meta-introspector/vale`                            | -                              |
