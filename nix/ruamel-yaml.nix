{ lib
, python3
, fetchPypi
, buildPythonPackage
}:

buildPythonPackage rec {
  pname = "ruamel-yaml";
  version = "0.18.10";  # Version required by mcpm
  format = "pyproject";

  src = fetchPypi {
    pname = "ruamel.yaml";
    inherit version;
    sha256 = "20c86ab29ac2153f80a428e1254a8adf686d3383df04490514ca3b79a362db58";
  };

  nativeBuildInputs = with python3.pkgs; [
    setuptools
    wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    ruamel-yaml-clib
  ];

  # Disable tests for now
  doCheck = false;

  meta = with lib; {
    description = "YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order";
    homepage = "https://sourceforge.net/projects/ruamel-yaml/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}