{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, wheel
, ruamel-yaml-clib
}:

buildPythonPackage rec {
  pname = "ruamel-yaml";
  version = "0.18.10";
  format = "pyproject";
  
  src = fetchPypi {
    pname = "ruamel.yaml";
    inherit version;
    hash = "sha256-Tz0Fy9Ux5ItQQJZfXcXEMIJGjJJP6ZWQj5Xj5JKzOZY=";
  };
  
  nativeBuildInputs = [
    setuptools
    wheel
  ];
  
  propagatedBuildInputs = [
    ruamel-yaml-clib
  ];
  
  doCheck = false;
  
  meta = with lib; {
    description = "YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order";
    homepage = "https://sourceforge.net/projects/ruamel-yaml/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}