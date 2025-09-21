{
  description = "Nix flake for CRQ-018: Automated GitHub Forking dependencies.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux"; # Assuming x86_64-linux, adjust if needed
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          jq
          gh
        ];
      };
    };
}
