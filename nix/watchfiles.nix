{ lib
, python3
, fetchPypi
, buildPythonPackage
, rustPlatform
, cargo
, rustc
}:

buildPythonPackage rec {
  pname = "watchfiles";
  version = "1.0.4";  # Version required by mcpm
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "6ba473efd11062d73e4f00c2b730255f9c1bdd73cd5f9fe5b5da8dbd4a717205";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit src;
    name = "${pname}-${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # Will be updated
  };

  nativeBuildInputs = with python3.pkgs; [
    setuptools
    wheel
  ] ++ [
    rustPlatform.cargoSetupHook
    cargo
    rustc
  ];

  propagatedBuildInputs = with python3.pkgs; [
    anyio
  ];

  # Disable tests for now
  doCheck = false;

  meta = with lib; {
    description = "Simple, modern and high performance file watching and code reload in python";
    homepage = "https://github.com/samuelcolvin/watchfiles";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}