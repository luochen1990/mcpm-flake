{ lib
, python3
, fetchFromGitHub
, callPackage
, pkgs
}:

let
  # Use Python 3.11
  python = pkgs.python311;
  pythonPackages = python.pkgs;
  
  # Import custom package definitions
  mcp = pythonPackages.callPackage ./packages/mcp { };
  ruamel-yaml = pythonPackages.callPackage ./packages/ruamel-yaml { };
  watchfiles = pythonPackages.callPackage ./packages/watchfiles { };
  
  # Override Python to include our custom packages
  pythonWithPackages = python.override {
    packageOverrides = self: super: {
      # Disable tests for problematic packages
      aiohttp = super.aiohttp.overridePythonAttrs (old: { doCheck = false; });
      fsspec = super.fsspec.overridePythonAttrs (old: { doCheck = false; });
      google-auth = super.google-auth.overridePythonAttrs (old: { doCheck = false; });
      duckdb = super.duckdb.overridePythonAttrs (old: { doCheck = false; });
      google-api-core = super.google-api-core.overridePythonAttrs (old: { doCheck = false; });
      
      # Add our custom packages
      inherit mcp ruamel-yaml watchfiles;
    };
  };
in
pythonWithPackages.pkgs.buildPythonApplication rec {
  pname = "mcpm";
  version = "1.13.1";  # From src/mcpm/version.py

  src = ../.;  # Use the parent directory as the source

  format = "pyproject";

  nativeBuildInputs = with pythonWithPackages.pkgs; [
    hatchling
    setuptools
    wheel
    pip
  ];

  propagatedBuildInputs = with pythonWithPackages.pkgs; [
    # Core dependencies from pyproject.toml
    click
    rich
    requests
    pydantic
    duckdb
    psutil
    prompt-toolkit
    deprecated
    
    # Custom packaged dependencies
    mcp
    ruamel-yaml
    watchfiles
    
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

  # Disable tests for now
  doCheck = false;

  meta = with lib; {
    description = "MCPM - Model Context Protocol Manager";
    homepage = "https://mcpm.sh";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "mcpm";
  };
}