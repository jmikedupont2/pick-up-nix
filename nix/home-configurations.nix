{
  nixpkgs, nixpkgs-unstable, home-manager, overlays, ...
}:

{
  homeConfigurations = 
    let
      # A helper function to generate home-manager configs for a given system
      mkSystemHomes = system:
        let
          pkgs = import nixpkgs {
            system = system;
            overlays = overlays; # Apply the overlay here
          };
          # A helper function to generate a home-manager configuration
          mkHome = modules: home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = { inherit nixpkgs-unstable; };
            # NOTE: This assumes your username is 'user'
            modules = [
              { home.username = "user"; home.homeDirectory = "/home/user"; }
              ./.config/home-manager/home.nix
            ] ++ modules;
          };
        in
        {
          "github-runner" = mkHome [ ./home/base.nix ];
          "linux-dev" = mkHome [ ./home/base.nix ./home/emacs.nix ];
          "linux-sci" = mkHome [ ./home/base.nix ./home/emacs.nix ./home/scientific.nix ];
        };
    in
    {
      "x86_64-linux" = mkSystemHomes "x86_64-linux";
      "aarch64-linux" = mkSystemHomes "aarch64-linux";
    };
}