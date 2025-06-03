{ pkgs ? import <nixpkgs> {} }:

let
  python = pkgs.python311;
  pythonPackages = python.pkgs;
  
  # Main MCPM package
  mcpm = pythonPackages.buildPythonApplication rec {
    pname = "mcpm";
    version = "1.13.1";
    format = "pyproject";
    
    src = ./.;
    
    nativeBuildInputs = with pythonPackages; [
      hatchling
      setuptools
      wheel
      pip
    ];
    
    propagatedBuildInputs = with pythonPackages; [
      # Core dependencies from pyproject.toml
      click
      rich
      requests
      pydantic
      duckdb
      psutil
      prompt-toolkit
      deprecated
      
      # Additional dependencies that might be needed
      typer
      httpx
      anyio
      fastapi
      uvicorn
      websockets
      jinja2
      pyyaml
      toml
      python-dotenv
      packaging
      colorama
    ];
    
    # Skip tests for now
    doCheck = false;
    
    meta = with pkgs.lib; {
      description = "Model Context Protocol Manager";
      homepage = "https://github.com/luochen1990/mcpm";
      license = licenses.mit;
      maintainers = with maintainers; [ ];
    };
  };
in mcpm