{
  description = "my-project";
  nixConfig.bash-prompt = "[nix(my-project)] ";

  inputs = {
    nixpkgs.url =
      "github:NixOS/nixpkgs/0dcf2ad93d93d0cba20f8517689267abc33014a6";
    hspkgs.url = "github:podenv/hspkgs";
  };

  outputs = { self, nixpkgs, hspkgs }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ hspkgs.overlays.hspkgs ];
      };
      pkg = pkgs.hspkgs.callCabal2nix "my-project" self { };
      exe = pkgs.haskell.lib.justStaticExecutables pkg;
    in {
      packages."x86_64-linux".default = exe;
      devShell."x86_64-linux" = pkgs.hspkgs.shellFor {
        packages = p: [ pkg ];
        buildInputs = [
          pkgs.cabal-install
          pkgs.haskell-language-server
          pkgs.weeder
          pkgs.hlint
          pkgs.fourmolu
          pkgs.ghcid
        ];
      };
    };
}
