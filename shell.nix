{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
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
}