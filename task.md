
## rules to add to gemini.md
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
careful that some git commands process in parallel and cause locks. do not run many git commits from gemini.

*   Integrating specific project components into the new flake.
We want to use those nix tools to index
all the nix packages in ~/pick-up-nix2/index/file_nix.txt and to understand  the graphs
and how they fito int our project. and make a report.

*   Defining packages or applications within the flake.

our boot.sh runs gemini

*   Setting up build and test commands for your project.
*   Further refining the `devShell`.


# Task: Upgrade Nix Environment and Build with Nix
CWD:  /data/data/com.termux.nix/files/home/pick-up-nix2 aka ~/nix2 (via ln)
On branch feature/CRQ-016-nixify-workflow
current change request :   docs/crqs/CRQ_016_Flake_Refactor_and_Nixify.md Read and understand and update

apply feature/CRQ-016-nixify-workflow branch to all submodules via
these scripts, read and document them
	new file:   scripts/branch_and_push_all.sh
	new file:   scripts/commit_and_push_flakes.sh
	modified:   scripts/commit_crq_submodule.sh
	new file:   scripts/fix_submodule.sh
        modified:   scripts/inject_submodule_env.sh
add this file :	scripts/commit_workflow.sh
remove the logs and ignore them

bash-5.3$ git status
On branch feature/CRQ-016-nixify-workflow
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   docs/crqs/CRQ_016_Flake_Refactor_and_Nixify.md Read and understand and update
	modified:   flake.nix
	new file:   index/pre-commit.txt
	new file:   scripts/flake.template
	new file:   scripts/branch_and_push_all.sh
	new file:   scripts/commit_and_push_flakes.sh
	modified:   scripts/commit_crq_submodule.sh
	new file:   scripts/fix_submodule.sh
	modified:   scripts/inject_submodule_env.sh
	new file:   scripts/nixify.sh
	new file:   scripts/nixify_vendor_nix.sh
	modified:   vendor/nix/nixtract

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
	modified:   .gitignore
	modified:   source/github/meta-introspector/git-submodules-rs-nix (untracked content)
	modified:   source/github/meta-introspector/lattice-introspector (modified content)
	modified:   source/github/meta-introspector/streamofrandom (modified content, untracked content)
	modified:   vendor/hooks/rusty-hook (modified content)
	modified:   vendor/nix/nix (modified content, untracked content)
	modified:   vendor/nix/nixpkgs-lint (modified content)
	modified:   vendor/nix/renix (modified content, untracked content)
	modified:   vendor/nix/rnix-parser-tester (modified content, untracked content)

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	logs/inject_submodule_env.log
	scripts/commit_workflow.sh


## Next Steps:
update vendor/nix/flake.nix
to include vendor/nix/*/flake.nix submodules using our scripts

