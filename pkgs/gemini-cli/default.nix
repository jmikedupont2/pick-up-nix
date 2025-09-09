{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "gemini-cli";
  version = "0.3.4"; # Match the version from package.json

  src = /data/data/com.termux.nix/files/home/pick-up-nix/vendor/external/gemini-cli;

  nativeBuildInputs = [ pkgs.nodejs pkgs.npm ];

  installPhase = ''
    npm install
    npm run bundle
    mkdir -p $out/bin
    cp bundle/gemini.js $out/bin/gemini
  '';
}