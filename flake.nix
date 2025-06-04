{
  description = "MCPM - Model Context Protocol Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
            permittedInsecurePackages = [ ];
          };
        };
      in
      {
        packages = {
          default = import ./nix/default.nix { inherit pkgs; lib = pkgs.lib; python3 = pkgs.python311; fetchFromGitHub = pkgs.fetchFromGitHub; callPackage = pkgs.callPackage; };
        };

        apps.default = flake-utils.lib.mkApp { 
          drv = self.packages.${system}.default; 
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            python311
            python311Packages.pip
            python311Packages.setuptools
            python311Packages.wheel
            python311Packages.hatchling
            
            # Core dependencies
            python311Packages.click
            python311Packages.rich
            python311Packages.requests
            python311Packages.pydantic
            python311Packages.duckdb
            python311Packages.psutil
            python311Packages.prompt-toolkit
            python311Packages.deprecated
          ];

          shellHook = ''
            echo "MCPM development environment"
            echo "Run 'pip install -e .' to install in development mode"
          '';
        };
      });
}