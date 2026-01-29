{
  pkgs ? import <nixpkgs> { },
}:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "pdfcat-cli";
  version = "1.0.0-beta.9";

  src = pkgs.fetchCrate {
    inherit pname version;
    hash = "sha256-xv+WnjWM37anLhLIF5Ha7br7F+RSm5JTkKeipB+M9b8=";
  };

  cargoHash = "sha256-791Xeu95w0KN4D3xxP8q/19o76tqKIZXaFfLNguSUrM=";
}
