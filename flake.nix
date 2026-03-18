{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    pdfcat-src = {
      url = "github:pdfcat/pdfcat/main";
      flake = false;
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      pdfcat-src,
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system} = {
        default = import ./default.nix { inherit pkgs; };
        unstable = import ./bleeding-edge.nix { inherit pkgs pdfcat-src; };
      };
      overlays.default = final: prev: {
        pdfcat = self.packages.${system}.default;
      };
    };
}
