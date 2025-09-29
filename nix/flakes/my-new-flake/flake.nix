
{
  description = "A simple new flake for testing purposes.";

  inputs = {
    nixpkgs.url = "github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify";
    flake-utils.url = "github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages.default = pkgs.writeShellScriptBin "my-new-flake-script" ''
          echo "Hello from my new flake!"
          ${pkgs.cowsay}/bin/cowsay "Moo!"
          ${pkgs.fortune}/bin/fortune
        '';

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            cowsay
            fortune
          ];
        };
      }
    );
}
