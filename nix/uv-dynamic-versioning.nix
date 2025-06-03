{ lib
, python3
, fetchPypi
, buildPythonPackage
}:

buildPythonPackage rec {
  pname = "uv-dynamic-versioning";
  version = "0.1.0";  # Version required by mcp
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";
  };

  nativeBuildInputs = with python3.pkgs; [
    setuptools
    wheel
  ];

  # Disable tests for now
  doCheck = false;

  meta = with lib; {
    description = "Dynamic versioning for uv";
    homepage = "https://github.com/astral-sh/uv-dynamic-versioning";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}