{
  description = "A flake containing all Nix-related tools from vendor/nix.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";

    nixtract.url = "path:./nixtract";
    nixpkgs-lint.url = "path:./nixpkgs-lint";
    renix.url = "path:./renix";
    rnix-parser-tester.url = "path:./rnix-parser-tester";
    nix.url = "path:./nix";
  };

  outputs = { self, nixpkgs, flake-utils, nixtract, nixpkgs-lint, renix, rnix-parser-tester, nix, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages.default = pkgs.lib.recursiveUpdate
          nixtract.packages.${system}
          (pkgs.lib.recursiveUpdate
            nixpkgs-lint.packages.${system}
            (pkgs.lib.recursiveUpdate
              renix.packages.${system}
              (pkgs.lib.recursiveUpdate
                rnix-parser-tester.packages.${system}
                nix.packages.${system}
              )
            )
          );

        # Optionally, expose individual packages directly
        inherit (nixtract.packages.${system}) nixtract;
        inherit (nixpkgs-lint.packages.${system}) nixpkgs-lint;
        inherit (renix.packages.${system}) renix;
        inherit (rnix-parser-tester.packages.${system}) rnix-parser-tester;
        inherit (nix.packages.${system}) nix;
      }
    );
}
