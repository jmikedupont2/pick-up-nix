{
  description = "A flake for the pick-up-nix-cli tool.";

  inputs = {
    nixpkgs.url = "github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify";
    flake-utils.url = "github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify";
    naersk.url = "github:meta-introspector/naersk?ref=feature/CRQ-016-nixify";
  };

  outputs = { self, nixpkgs, flake-utils, naersk }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        naersk-lib = pkgs.callPackage naersk {};
      in
      {
        packages = {
          default = naersk-lib.buildPackage {
            src = ./.;
          };
        };

        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [ rustc cargo ];
          };
        };
      }
    );
}
