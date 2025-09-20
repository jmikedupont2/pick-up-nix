{
  description = "A clean slate Nix flake for development, with modularized Nix tools from the meta-introspector organization.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/master";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
    git-hooks.url = "github:cachix/git-hooks.nix";
    statix.url = "github:nerdypepper/statix";

    # Aggregated Nix tool inputs from vendor/nix
    vendor-nix-flakes.url = "./vendor/nix";

    # Add template_generator_bin as an input
    template-generator-bin.url = "./tools/template_generator_bin";
  };

  outputs = { self, nixpkgs, flake-utils, vendor-nix-flakes, ... }@inputs:
    let
      # List of Nix tool inputs for modular composition
      nix-tool-inputs = with vendor-nix-flakes; [
        nixtract-flake
        nix-flake
        rnix-parser-tester-flake
        renix-flake
        nixpkgs-lint-flake
        nil-flake
        nix-direnv-flake
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
          template-generator-bin = self.inputs.template-generator-bin.packages.${system}.default; # Add this line
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
            pkgs.gawk # Add gawk here
          ] ++ dev-shell-tools;
        };
      }
    );
}