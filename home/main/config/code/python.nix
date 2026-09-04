{ pkgs, ... }:
let
  python = pkgs.python3.override {
    packageOverrides = pyfinal: pyprev: {
      slicer = pyprev.slicer.overridePythonAttrs (old: {
        doCheck = false;
        build-system = (old.build-system or [ ]) ++ [
          pyfinal.setuptools
          pyfinal.wheel
        ];
      });

      shap = pyprev.shap.overridePythonAttrs (old: {
        dependencies = (old.dependencies or [ ]) ++ [
          pyfinal.typing-extensions
        ];
      });
    };
  };
in
{
  home.packages = [
    (python.withPackages (
      ps: with ps; [
        numpy
        pandas
        matplotlib
        scipy
        pynvim
        debugpy
        setuptools
        ipython
        ruff
        black
        pytest
        requests
        virtualenv
      ]
    ))
  ];

  home.sessionVariables = {
    PYTHONDONTWRITEBYTECODE = "1";
  };
}
