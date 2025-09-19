{
  description = "A clean slate Nix flake for development, with modularized Nix tools from the meta-introspector organization.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/master";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
    git-hooks.url = "github:cachix/git-hooks.nix";
    statix.url = "github:nerdypepper/statix";

    # Modular Nix tool inputs from the meta-introspector GitHub organization
    nixtract.url = "github:meta-introspector/nixtract/v0.0.1-pick-up-nix";
    nixpkgs-lint.url = "github:meta-introspector/nixpkgs-lint/v0.0.1-pick-up-nix";
    renix.url = "github:meta-introspector/renix/v0.0.1-pick-up-nix";
    rnix-parser-tester.url = "github:meta-introspector/rnix-parser-tester/v0.0.1-pick-up-nix";
    nix.url = "github:meta-introspector/nix/v0.0.1-pick-up-nix";
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    let
      # List of Nix tool inputs for modular composition
      nix-tool-inputs = with inputs; [
        nixtract
        nixpkgs-lint
        renix
        rnix-parser-tester
        nix
      ];
    in
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            inputs.rust-overlay.overlays.default
          ];
        };

        # Combine packages from all Nix tools using a fold
        nix-tools-packages = pkgs.lib.foldl' pkgs.lib.recursiveUpdate { } (
          map (input: input.packages.${system}) nix-tool-inputs
        );

        # List of packages to include in the dev shell
        dev-shell-tools = with nix-tools-packages; [
          nix
          nixtract
          nixpkgs-lint
          renix
          rnix-parser-tester
        ];
      in
      {
        packages = nix-tools-packages // {
          # Set the default package to `nix`
          default = nix-tools-packages.nix;
        };

        devShells.default = pkgs.mkShell {
          inherit (inputs.git-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              statix.enable = true;
            };
          }) shellHook;
          buildInputs = with pkgs; [
            inputs.statix.packages.${system}.default
          ] ++ dev-shell-tools;
        };
      }
    );
}
