{
  devShells = lib.genAttrs lib.systems.flakeExposed (system: {
    default = let
      pkgs = import nixpkgs { inherit system; }; # Stable nixpkgs
      unstablePkgs = import nixpkgs-unstable { inherit system; }; # Unstable nixpkgs
    in
    pkgs.mkShell {
      buildInputs = [
        unstablePkgs.rustc
        unstablePkgs.cargo
      ];
      shellHook = builtins.readFile ./shell_hook.sh;
    };
  });
}