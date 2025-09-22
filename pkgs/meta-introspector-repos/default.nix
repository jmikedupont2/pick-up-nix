{ pkgs ? import <nixpkgs> {}, githubReposJson }:

pkgs.stdenv.mkDerivation {
  pname = "meta-introspector-repos-json";
  version = "0.1.0";
  src = null;
  dontUnpack = true;

  # We don't need any source code for this, as it generates data
  # However, we need to ensure gh and jq are available in the build environment
  buildInputs = [];

  # The actual command to generate the JSON file
  buildPhase = ''
    mkdir -p $out
    cp ${githubReposJson} $out/github_meta-introspector_repos.json
  '';

  # No install phase needed as the buildPhase already puts the file in $out
  installPhase = "";
}
