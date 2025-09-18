{
  lib, nixpkgs, nixpkgs-unstable, rustToolchain, ...
}:

{
  devShells = lib.genAttrs lib.systems.flakeExposed (system: {
    default = let
      pkgs = import nixpkgs { inherit system; }; # Stable nixpkgs
      unstablePkgs = import nixpkgs-unstable { inherit system; }; # Unstable nixpkgs
    in
    pkgs.mkShell {
      buildInputs = [
        rustToolchain
      ];
      shellHook = ''
        #!/usr/bin/env bash

        echo "Current PATH: $PATH"
        echo "Contents of unstablePkgs.cargo/bin: $(ls ${unstablePkgs.cargo}/bin)"
        # No need to export PATH again, it's already there from buildInputs
        echo "Attempting to run cargo check..."
        bash -c "cargo check"
      '';
    };
  });
}