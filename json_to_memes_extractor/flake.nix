{
  description = "A flake for the json_to_memes_extractor tool.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
    naersk.url = "github:nix-community/naersk";
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
