
{
  description = "A test flake for CRQ-018";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    another-repo.url = "github:some-user/another-repo";
    yet-another.url = "github:yet-another-user/yet-another-repo";
  };

  outputs = { self, nixpkgs, flake-utils, another-repo, yet-another }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.hello
          ];
        };
      }
    );
}
