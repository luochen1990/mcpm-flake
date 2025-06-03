{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, wheel
, anyio
, pytest-mock
, pytest-timeout
, pytoolconfig
, rustPlatform
}:

buildPythonPackage rec {
  pname = "watchfiles";
  version = "0.21.0";
  format = "pyproject";
  
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Fy9yvyPh1cRvgm8inc54kxxz4asqkf069i37csnnz5mi=";
  };
  
  nativeBuildInputs = [
    setuptools
    wheel
  ] ++ lib.optionals (rustPlatform != null) [
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
  ];
  
  propagatedBuildInputs = [
    anyio
  ];
  
  nativeCheckInputs = [
    pytest-mock
    pytest-timeout
    pytoolconfig
  ];
  
  doCheck = false;
  
  meta = with lib; {
    description = "Simple, modern and high performance file watching and code reload in python";
    homepage = "https://github.com/samuelcolvin/watchfiles";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}