{
  description = "A flake containing reusable scripts and libraries for Git and Nix operations.";

  inputs = {
    nixpkgs.url = "github:meta-introspector/nixpkgs/feature/CRQ-016-nixify";
    flake-utils.url = "github:meta-introspector/flake-utils/feature/CRQ-016-nixify";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages = {
          # Expose the git submodule library
          libGitSubmodule = pkgs.writeShellApplication {
            name = "lib_git_submodule";
            runtimeInputs = with pkgs; [ bash git gh ]; # Add necessary dependencies
            text = builtins.readFile ../scripts/lib_git_submodule.sh;
          };

          # Expose the generic Nix submodule build script
          buildGenericNixSubmodule = pkgs.writeShellApplication {
            name = "build_generic_nix_submodule";
            runtimeInputs = with pkgs; [ bash nix ]; # Add necessary dependencies
            text = builtins.readFile ../scripts/build_generic_nix_submodule.sh;
          };

          # Expose the Git access check script
          gitAccessCheck = pkgs.writeShellApplication {
            name = "git_access_check";
            runtimeInputs = with pkgs; [ bash gnugrep findutils ]; # Add necessary dependencies
            text = builtins.readFile ../rules/git_access/check.sh;
          };
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            bash
            git
            gh # GitHub CLI
            nix
            gnugrep
            findutils
            # Add any other development tools needed for these scripts
          ];
        };
      }
    );
}