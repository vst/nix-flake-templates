{
  description = "Haskell Tinker Shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        hsPkgs = pkgs.haskell.packages.ghc98;
        ghc = hsPkgs.ghcWithPackages (p: with p; [
          aeson
          autodocodec
        ]);
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            ## Haskell environment:
            ghc

            ## Tools for development:
            hsPkgs.fourmolu ## Formatter
            hsPkgs.ghcid ## Fast reload loop
            hsPkgs.haskell-language-server ## LSP server
            hsPkgs.hlint ## Linter
          ];

          shellHook = ''
            echo "Haskell environment and tools are ready:"
            echo "  - ghc"
            echo "  - ghci"
            echo "  - runghc"
            echo "  - fourmolu"
            echo "  - ghcid"
            echo "  - hlint"
            echo "  - haskell-language-server"
          '';
        };
      });
}
