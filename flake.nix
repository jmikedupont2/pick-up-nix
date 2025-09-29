{
  description = "A minimal development environment for Rust projects.";

  inputs = {
    nixpkgs.url = "github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify";
    flake-utils.url = "github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify";
    naersk.url = "github:meta-introspector/naersk?ref=feature/CRQ-016-nixify";
    my-new-flake.url = "./nix/flakes/my-new-flake";
#    template-generator-bin.url = "./tools/template_generator_bin"; # Keep this input
  };

    outputs = { self, nixpkgs, flake-utils, rust-overlay, naersk, my-new-flake
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

        naerskLib = naersk.lib.${system};

        # Define an array of Rust versions for testing
        rustVersions = {
          stable = pkgs.rust-bin.stable.latest.default;
          nightly_2025_09_16 = pkgs.rust-bin.nightly."2025-09-16".default; # Our pinned nightly
          # Add more versions here as needed
        };
      in rec {
        logAnalyzer = naerskLib.buildPackage {
          pname = "log-analyzer";
          version = "0.1.0";
          src = ./crates/log_analyzer;
          cargoLock = {
            lockFile = ./crates/log_analyzer/Cargo.lock;
          };
        };
        packages = { # Re-add the packages section
            log-analyzer = logAnalyzer;
            my-new-flake = my-new-flake.packages.${system}.default;
          };

          apps.log-analyzer = flake-utils.lib.mkApp {
            drv = logAnalyzer;
          };

          inherit rustVersions;

          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              rustVersions.nightly_2025_09_16 # Use the pinned nightly toolchain
  #            self.packages.${system}.template-generator-bin # Add template-generator-bin to devShell
  	    which 
              gawk # For awk
              jq
  	    asciinema
              ncurses # Added ncurses
            vale
            ];
          };
  
          # Expose the rustVersions for easy access
          inherit rustVersions;
        }
      );}