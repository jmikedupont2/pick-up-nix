{
  description = "Basic example of Nix-on-Droid system config.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05"; # Stable channel
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/master";
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05"; # Stable channel
      inputs.nixpkgs.follows = "nixpkgs";
	};
  };

     outputs = { self, nixpkgs, nixpkgs-unstable, nix-on-droid }:
      let
        unstable-pkgs = import nixpkgs-unstable { system = "aarch64-linux"; };
        overlay = self: super: {
          gemini-cli = unstable-pkgs.gemini-cli;
        };
      in
      {
        nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
          pkgs = import nixpkgs {
            system = "aarch64-linux";
            overlays = [ overlay ];
          };
          modules = [ ./nix-on-droid.nix ];
        };
    };

  # outputs = { self, nixpkgs, nix-on-droid }: {

  #   nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
  #     pkgs = import nixpkgs { system = "aarch64-linux"; };
  #     modules = [ ./nix-on-droid.nix ];
  #   };

  # };
}
