{
  description = "A flake for this submodule, providing a basic development shell.";

  inputs = {
    nixpkgs.url = "github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify";
    flake-utils.url = "github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify";
    nixtract-flake.url = "./nixtract";
    nix-flake.url = "./nix";
    rnix-parser-tester-flake.url = "./rnix-parser-tester";
    renix-flake.url = "./renix";
    nixpkgs-lint-flake.url = "./nixpkgs-lint";
    nil-flake.url = "./nil";
    nix-direnv-flake.url = "./nix-direnv";
  };

  outputs = { self, nixpkgs, flake-utils, nixtract-flake, nix-flake, rnix-parser-tester-flake, renix-flake, nixpkgs-lint-flake, nil-flake, nix-direnv-flake, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            bash
            git
            shellcheck # Add shellcheck for shell script linting
            # Add any other common tools needed for your submodules here
          ];

          shellHook = ''
            echo "Welcome to the development shell of this submodule!"
          '';
        };
        # Expose the sub-flakes
        inherit nixtract-flake nix-flake rnix-parser-tester-flake renix-flake nixpkgs-lint-flake nil-flake nix-direnv-flake;
      }
    );
}
