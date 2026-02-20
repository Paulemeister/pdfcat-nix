{
  pkgs ? import <nixpkgs> { },
  pdfcat-src,
}:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "pdfcat-cli";
  version = "unstable";

  src = pdfcat-src;
  buildAndTestSubdir = "crates/pdfcat-cli";
  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };

}
