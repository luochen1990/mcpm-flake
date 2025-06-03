{ lib
, python3
, fetchFromGitHub
}:

python3.pkgs.buildPythonApplication rec {
  pname = "mcpm";
  version = "1.13.1";
  format = "pyproject";

  # Use the local repository as the source
  src = ../.

  nativeBuildInputs = with python3.pkgs; [
    setuptools
    wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    # Core dependencies from pyproject.toml
    click
    rich
    requests
    pydantic
    duckdb
    psutil
    prompt-toolkit
    deprecated
    
    # We need to create these packages separately
    # mcp
    # ruamel-yaml
    # watchfiles
    
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
    description = "Model Context Protocol Manager";
    homepage = "https://github.com/luochen1990/mcpm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}