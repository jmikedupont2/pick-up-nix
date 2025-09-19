{
  pkgs,
  inputs,
}:

let
  unstablePkgs = import inputs.nixpkgs-unstable {
    inherit (pkgs) system;
    overlays = [
      inputs.rust-overlay.overlays.default
    ];
  };
in
{
  devShells = {
    stableRust = pkgs.mkShell {
      buildInputs = [
        pkgs.rust-bin.stable.latest.rustc
      ];
      shellHook = ''
        #!/usr/bin/env bash
        echo "Current PATH: $PATH"
        echo "Nix development shell entered (stable Rust)."
      '';
    };

    unstableRust = unstablePkgs.mkShell {
      buildInputs = [
        unstablePkgs.rust-bin.nightly.latest.rustc
      ];
      shellHook = ''
        #!/usr/bin/env bash
        echo "Current PATH: $PATH"
        echo "Nix development shell entered (unstable Rust)."
      '';
    };
  };
}