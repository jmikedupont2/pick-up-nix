{
  description = "A temporary environment for evaluating a tool.";

  inputs = {
    nixpkgs.url = "github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify";
    flake-utils.url = "github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify";
    
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
