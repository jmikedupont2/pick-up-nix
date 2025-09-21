{
  description = "A minimal development environment for Rust projects.";

  inputs = {
    nixpkgs.url = "github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify";
    flake-utils.url = "github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify";
    rust-overlay.url = "github:meta-introspector/rust-overlay?ref=feature/CRQ-016-nixify";
    template-generator-bin.url = "./tools/template_generator_bin"; # Keep this input
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay, template-generator-bin }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            rust-overlay.overlays.default
          ];
        };

        # Define an array of Rust versions for testing
        rustVersions = {
          stable = pkgs.rust-bin.stable.latest.default;
          nightly_2025_09_16 = pkgs.rust-bin.nightly."2025-09-16".default; # Our pinned nightly
          # Add more versions here as needed
        };
      in
      {
        packages = { # Re-add the packages section
          template-generator-bin = template-generator-bin.packages.${system}.default;
          meta-introspector-repos = import ./pkgs/meta-introspector-repos { inherit pkgs; };
          default = self.packages.${system}.template-generator-bin; # Set default to it
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            rustVersions.nightly_2025_09_16 # Use the pinned nightly toolchain
	    which 
            gawk # For awk
            jq
          ];
        };

        # Expose the rustVersions for easy access
        inherit rustVersions;
      }
    );
}
