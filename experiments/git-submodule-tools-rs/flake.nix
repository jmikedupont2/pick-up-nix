{
  description = "A temporary environment for evaluating a tool.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
    
    # The tool to be evaluated
    eval_tool.url = "https://github.com/meta-introspector/git-submodule-tools-rs";
  };

  outputs = { self, nixpkgs, flake-utils, eval_tool }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [ eval_tool.packages.${system}.default ];
        };
      }
    );
}
