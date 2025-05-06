{
  description = "A Simple Python Program Script";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        name = "simple-python-program";
        script = builtins.readFile ./script.py;
        program = pkgs.writers.writePython3Bin name
          {
            libraries = [ pkgs.python3Packages.click ];
          }
          script;
      in
      {
        packages = {
          "${name}" = program;
          default = self.packages.${system}.${name};
        };
      });
}
