{ lib
, python3
, fetchPypi
, buildPythonPackage
, uv-dynamic-versioning
}:

buildPythonPackage rec {
  pname = "mcp";
  version = "1.8.0";  # Minimum version required by mcpm
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "263dfb700540b726c093f0c3e043f66aded0730d0b51f04eb0a3eb90055fe49b";
  };

  nativeBuildInputs = with python3.pkgs; [
    hatchling
    uv-dynamic-versioning
  ];

  propagatedBuildInputs = with python3.pkgs; [
    pydantic
  ];

  # Disable tests for now
  doCheck = false;

  meta = with lib; {
    description = "Model Context Protocol (MCP) implementation";
    homepage = "https://github.com/pathintegral-institute/mcp";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}