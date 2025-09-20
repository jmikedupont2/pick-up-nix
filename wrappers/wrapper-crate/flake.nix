{
  description = "A wrapper crate for git-wrapper and syn-wrapper";

  inputs = {
    nixpkgs.url = "github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify"; # Or your preferred nixpkgs branch
    flake-utils.url = "github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify";

    git-wrapper = {
      url = "path:../git-wrapper";
      flake = false;
    };

    syn-wrapper = {
      url = "path:../syn-wrapper";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, git-wrapper, syn-wrapper }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        rustPlatform = pkgs.rustPlatform;
      in
      {
        packages.default = rustPlatform.buildRustPackage {
          pname = "wrapper-crate";
          version = "0.1.0";
          src = ../.;
          sourceRoot = "wrapper-crate";

          cargoLock = {
            lockFile = ./Cargo.lock;
          };
          

          

          # Dependencies from the inputs
          buildInputs = [];

          # If you have any native dependencies for git-wrapper or syn-wrapper,
          # you might need to add them here or ensure they are handled by their flakes.
          # For now, assuming they are pure Rust or their dependencies are handled.

          meta = with pkgs.lib; {
            description = "A wrapper crate for git-wrapper and syn-wrapper";
            homepage = "https://example.com"; # Replace with actual homepage
            license = licenses.mit; # Or your preferred license
            platforms = platforms.linux;
          };
        };
      });
}