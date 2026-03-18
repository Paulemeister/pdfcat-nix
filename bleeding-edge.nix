{
  pkgs ? import <nixpkgs> { },
  pdfcat-src,
}:
let
  # timestamp = pkgs.lib.formatSecondsSinceEpoch "%Y-%m-%d" pdfcat-src.lastModified; date +%Y-%m-%d --date @1773859240
  timestamp = pkgs.lib.readFile "${pkgs.runCommand "timestamp" {
    env.when = pdfcat-src.lastModified;
  } "echo -n `date -d @$when +%Y-%m-%d` > $out"}";

  rev = builtins.substring 0 7 (pdfcat-src.rev or "dirty");
in

pkgs.rustPlatform.buildRustPackage rec {
  pname = "pdfcat-cli";
  version = "1.0.0-unstable-${timestamp}.${rev}";

  src = pdfcat-src;
  buildAndTestSubdir = "crates/pdfcat-cli";
  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };
  doCheck = false;
  postPatch = ''
    sed -i 's/^version = .*/version = "${version}"/' Cargo.toml
  '';
}
