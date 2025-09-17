{
  self, nixpkgs, ...
}:

{
  # Overlays
  overlays = [
    (final: prev: {
      nixtract = prev.nixtract.overrideAttrs (old: {
        buildInputs = (old.buildInputs or []) ++ [ prev.openssl ];
      });
    })
    (final: prev: {
      gemini-cli = self.packages.${prev.system}.gemini-cli;
    })
  ];
}