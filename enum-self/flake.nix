{
  description = "Nix flake for the enum-self Rust crate";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11"; # Use a stable nixpkgs
    naersk.url = "github:nix-community/naersk/master"; # Use naersk
    flake-utils.url = "github:numtide/flake-utils"; # For easier cross-platform builds
  };

  outputs = { self, nixpkgs, naersk, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          # overlays = [ naersk.overlay ]; # naersk provides its own rustPlatform
        };
        naersk-lib = pkgs.callPackage naersk { };
      in
      {
        packages.enum-self = naersk-lib.buildRustPackage {
          pname = "enum-self";
          version = "0.1.0";

          src = ./.;

          # This will automatically use the Cargo.lock from the source directory
          # If your Cargo.lock is in the parent directory, you might need:
          # cargoLock = { lockFile = ../Cargo.lock; };

          # If you need a specific Rust toolchain (e.g., nightly), uncomment and adjust:
          # rustToolchain = pkgs.rust-bin.nightly.latest.default;

          meta = with pkgs.lib; {
            description = "A Rust crate for codifying project structure into enums.";
            homepage = "https://github.com/your-repo/enum-self"; # Replace with actual homepage
            license = licenses.mit; # Or licenses.apache20
            platforms = platforms.linux;
          };
        };
      }
    );
}
