{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, wheel
, pydantic
, typing-extensions
}:

buildPythonPackage rec {
  pname = "mcp";
  version = "1.8.0";
  format = "pyproject";
  
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Jj37cAVAtybAk/DD4EP2at7Qcw0LUfBOsKPrkAVf5Js=";
  };
  
  nativeBuildInputs = [
    setuptools
    wheel
  ];
  
  propagatedBuildInputs = [
    pydantic
    typing-extensions
  ];
  
  doCheck = false;
  
  meta = with lib; {
    description = "Model Context Protocol";
    homepage = "https://github.com/luochen1990/mcp";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}