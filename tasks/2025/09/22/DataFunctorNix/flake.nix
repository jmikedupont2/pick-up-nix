{
  description = "Nix flake for the DataFunctorNix experiment.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Or a specific commit/branch
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 
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
          ];

          # Environment variables for the experiment
          # EXPERIMENT_NAME = "DataFunctorNix";
          # MUSE_NAME = "DigitalMycology";
        };
      }
    );
}
