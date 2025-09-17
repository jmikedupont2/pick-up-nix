{
  nixpkgs, nix-on-droid, home-manager, overlays, androidSystem, ...
}:

{
  nixOnDroidConfigurations = {
    android = nix-on-droid.lib.nixOnDroidConfiguration {
      pkgs = import nixpkgs {
        system = androidSystem;
        overlays = overlays; # Apply the overlay here
      };
      modules = [
        ./configurations/android.nix
        home-manager.nixosModules.home-manager
        ({ pkgs, ... }: {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.user = {
            imports = [
              ./.config/home-manager/home.nix
              ./home/base.nix
              ./home/emacs.nix
            ];
            # Add gemini-cli to home packages for android
            home.packages = [ pkgs.gemini-cli ];
          };
        })
      ];
    };
  };
}