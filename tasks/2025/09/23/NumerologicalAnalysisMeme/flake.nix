{
  description = "Nix flake for the NumerologicalAnalysisMeme experiment.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Or a specific commit/branch
    flake-utils.url = "github:numtide/flake-utils";
    gemini-cli.url = "github:meta-introspector/gemini-cli?ref=feature/CRQ-016-nixify-workflow"; # Reference gemini-cli from meta-introspector
    bootstrap.url = "github:meta-introspector/bootstrap?ref=feature/CRQ-016-nixify-workflow"; # Reference bootstrap from meta-introspector
  };

  outputs = { self, nixpkgs, flake-utils, gemini-cli, bootstrap }: 
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # Add experiment-specific dependencies here
            # For example:
            # python3
            # python3Packages.pip
            # git
            # coreutils
            # sed
            # gawk
            gemini-cli.packages.${system}.default # Get gemini-cli from its flake
            bootstrap.devShells.${system}.default.packages # Include packages from bootstrap's devShell
          ];

          # Environment variables for the experiment
          # EXPERIMENT_NAME = "NumerologicalAnalysisMeme";
          # MUSE_NAME = "DigitalMycology";
        };
      }
    );
}
