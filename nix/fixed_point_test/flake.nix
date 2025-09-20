{
  description = "Nix flake for building and testing the fixed point analysis CLI command.";

  inputs = {
    nixpkgs.url = "github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify";
    naersk.url = "github:meta-introspector/naersk?ref=feature/CRQ-016-nixify";
    flake-utils.url = "github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify";
  };

  outputs = { self, nixpkgs, naersk, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        # Build pick-up-nix-cli using naersk
        pick-up-nix-cli-package = naersk.lib.${system}.buildPackage {
          pname = "pick-up-nix-cli";
          version = "0.1.0"; # Assuming this version from Cargo.toml
          src = ../../pick-up-nix-cli; # Path to the pick-up-nix-cli crate
          cargoLock.lockFile = ../../Cargo.lock; # Use the workspace Cargo.lock
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            pick-up-nix-cli-package
          ];

          shellHook = ''
            echo "Running fixed point analysis..."
            ${pick-up-nix-cli-package}/bin/pick-up-nix-cli analyze-fixed-point
            echo "Fixed point analysis complete."
          '';
        };
      }
    );
}
