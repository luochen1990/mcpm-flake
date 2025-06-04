{ lib
, buildPythonApplication
, hatchling
, setuptools
, wheel
, pip
, click
, rich
, requests
, pydantic
, duckdb
, psutil
, prompt-toolkit
, deprecated
, typer
, httpx
, anyio
, fastapi
, uvicorn
, websockets
, jinja2
, pyyaml
, toml
, python-dotenv
, packaging
, colorama
, mcp
, ruamel-yaml
, watchfiles
}:

buildPythonApplication rec {
  pname = "mcpm";
  version = "1.13.1";
  format = "pyproject";
  
  # Use local source for development
  src = ../../..;
  
  nativeBuildInputs = [
    hatchling
    setuptools
    wheel
    pip
  ];
  
  propagatedBuildInputs = [
    # Core dependencies from pyproject.toml
    click
    rich
    requests
    pydantic
    duckdb
    psutil
    prompt-toolkit
    deprecated
    
    # Additional dependencies
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
    
    # Custom packaged dependencies
    mcp
    ruamel-yaml
    watchfiles
  ];
  
  # Skip tests for now
  doCheck = false;
  
  meta = with lib; {
    description = "Model Context Protocol Manager";
    homepage = "https://github.com/luochen1990/mcpm";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}