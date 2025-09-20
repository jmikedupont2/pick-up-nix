{
  description = "A minimal development environment for Rust projects.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
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
          default = self.packages.${system}.template-generator-bin; # Set default to it
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            rustVersions.nightly_2025_09_16 # Use the pinned nightly toolchain
	    which 
            gawk # For awk
          ];
        };

        # Expose the rustVersions for easy access
        inherit rustVersions;
      }
    );
}
