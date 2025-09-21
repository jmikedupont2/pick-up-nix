{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "meta-introspector-repos-json";
  version = "0.1.0";
  src = null;
  dontUnpack = true;

  # We don't need any source code for this, as it generates data
  # However, we need to ensure gh and jq are available in the build environment
  buildInputs = [ pkgs.gh pkgs.jq ];

  # The actual command to generate the JSON file
  buildPhase = ''
    mkdir -p $out
    export GH_TOKEN="$GH_TOKEN"
    gh repo list meta-introspector --json name,url --limit 1000 > $out/github_meta-introspector_repos.json
  '';

  # No install phase needed as the buildPhase already puts the file in $out
  installPhase = "";
}
