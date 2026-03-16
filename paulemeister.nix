{
  pkgs ? import <nixpkgs> { },
  pdfcat-paulemeister-src,
}:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "pdfcat-cli";
  version = "dev";

  src = pdfcat-paulemeister-src;
  buildAndTestSubdir = "crates/pdfcat-cli";
  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };
  doCheck = false;
}
