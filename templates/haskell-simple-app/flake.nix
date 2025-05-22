{
  description = "A Simple Application in Haskell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        thisHaskell = pkgs.haskellPackages.override {
          overrides = self: super: {
            haskell-simple-app = self.callCabal2nix "haskell-simple-app" ./. { };
          };
        };

        thisShell = thisHaskell.shellFor {
          packages = p: [ p.haskell-simple-app ];
          withHoogle = true;
          buildInputs = [
            ## Haskell related build inputs:
            thisHaskell.apply-refact
            thisHaskell.cabal-fmt
            thisHaskell.cabal-install
            thisHaskell.cabal2nix
            thisHaskell.fourmolu
            thisHaskell.haskell-language-server
            thisHaskell.hlint

            ## Other build inputs for various development requirements:
            pkgs.nil
            pkgs.nixpkgs-fmt
          ];
        };

        thisPackage = pkgs.haskell.lib.justStaticExecutables thisHaskell.haskell-simple-app;
      in
      {
        packages = {
          haskell-simple-app = thisPackage;
          default = self.packages.${system}.haskell-simple-app;
        };

        devShells = {
          default = thisShell;
        };
      });
}
