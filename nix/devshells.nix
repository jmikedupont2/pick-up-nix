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
    default = pkgs.mkShell {
      buildInputs = [
        pkgs.rust-bin.stable.latest.rustc
        pkgs.pre-commit # Add pre-commit
        pkgs.shellcheck # Add shellcheck
      ];
      shellHook = ''
        #!/usr/bin/env bash
        echo "Current PATH: $PATH"
        echo "Nix development shell entered (stable Rust)."
        pre-commit install # Install pre-commit hooks when entering the shell
      '';
    };

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