{
  description = "A minimal development environment for Rust projects.";

  inputs = {
    nixpkgs.url = "github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify";
    flake-utils.url = "github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify";
    rust-overlay.url = "github:meta-introspector/rust-overlay?ref=feature/CRQ-016-nixify";
    today_concepts.url = "github:meta-introspector/time-2025?dir=source/github/meta-introspector/streamofrandom/2025/09/23/nix_concepts_and_facts&ref=feature/808017424794512875886459904961710757005754368000000000";
#    template-generator-bin.url = "./tools/template_generator_bin"; # Keep this input
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay
  #,
  #template-generator-bin
  }:
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
          #template-generator-bin = template-generator-bin.packages.${system}.default;
          meta-introspector-repos = import ./pkgs/meta-introspector-repos { inherit pkgs; };
          number-23 = today_concepts.packages.${system}.number-23;
          is-prime-23 = today_concepts.packages.${system}.is-prime-23;
          fact-23-oracle = today_concepts.packages.${system}.fact-23-oracle;
          ai-context-23 = today_concepts.packages.${system}.default; # ai-context-23 is the default package in the new flake
#          default = self.packages.${system}.template-generator-bin; # Set default to it
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            rustVersions.nightly_2025_09_16 # Use the pinned nightly toolchain
#            self.packages.${system}.template-generator-bin # Add template-generator-bin to devShell
	    which 
            gawk # For awk
            jq
	    asciinema
            ncurses # Added ncurses
          ];
        };

        # Expose the rustVersions for easy access
        inherit rustVersions;
      }
    );
}