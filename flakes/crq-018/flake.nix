{
  description = "Nix flake for CRQ-018: Automated GitHub Forking dependencies.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-linux"; # Adjusted to user's system architecture
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          jq
          gh
        ];
      };

      packages.${system}.default = pkgs.stdenv.mkDerivation {
        pname = "automate-dependency-forking-script";
        version = "0.1.0";
        src = builtins.path { path = ../../scripts; };
        dontUnpack = true;
        installPhase = ''
          ls -R
          mkdir -p $out/bin
          cp automate_dependency_forking.sh $out/bin/automate-dependency-forking.sh
          chmod +x $out/bin/automate_dependency_forking.sh
        '';
      };
    };
}
