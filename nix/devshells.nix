{
  pkgs,
}:

{
  devShells = {
    default = pkgs.mkShell {
      buildInputs = [
        pkgs.rust-bin.stable.latest.rustc
      ];
      shellHook = ''
        #!/usr/bin/env bash
        echo "Current PATH: $PATH"
        echo "Nix development shell entered."
      '';
    };
  };
}
