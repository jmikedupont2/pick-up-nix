# Task: Upgrade Nix Environment and Build with Nix

1.  **`flake.nix` and `nix/devshells.nix` have been refactored to a minimal, best-practice compliant setup.**
2.  **`rust-toolchain.toml` has been created.**
3.  **Nix environment successfully entered and `rustc` version verified.**
    *   `rustc 1.90.0` is now available in the development shell, meeting the requirement of `1.82` or newer.

## Next Steps:
update vendor/nix/flake.nix
to include vendor/nix/*/flake.nix submodules

rules:
each git repo will have a task.md with the next steps in it to run.
those steps will be run in nix.
the input to the nix will include its entire context.
the context is constructed to be passed to gemini via the task.md
a backpack filling algorithm finds the optimal contents for each step in the workflow.
each new bit of code needs an doc/sops/ standard operating procedure
each change should be associated with a doc/crq/ Change ReQuest
each crq should be updated with which commits are part of it.
the crq number is mentioned in each commit message.
look first for scripts/<usefulname>
run all changes via scripts/<usefulname>
commit all changes before your run.
write tests first
create branches first
do not delete anything
do not run git anything for now except to add and commit any new files.
do not commit any deletes
do not rm any files
do not rm .git
carefule that some git commands process in parallel and cause locks.

*   Integrating specific project components into the new flake.
We want to use those nix tools to index
all the nix packages in ~/pick-up-nix2/index/file_nix.txt and to understand  the graphs
and how they fit int our project. and make a report.

*   Defining packages or applications within the flake.

our boot.sh runs gemini

*   Setting up build and test commands for your project.
*   Further refining the `devShell`.
