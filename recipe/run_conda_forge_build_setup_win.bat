
:: 2 cores available on Appveyor workers: https://www.appveyor.com/docs/build-configuration/#build-environment
:: CPU_COUNT is passed through conda build: https://github.com/conda/conda-build/pull/1149
set CPU_COUNT=2

set PYTHONUNBUFFERED=1

conda config --set show_channel_urls true
conda config --set add_pip_as_python_dependency false

conda update -n root --yes --quiet conda conda-env conda-build
conda update -n root --yes --quiet python
conda install -n root --yes --quiet jinja2 conda-build anaconda-client

:: KLUDGE to work around changes in conda-build 2.0.0
conda install -n root --yes --quiet conda-build=1

conda info
conda config --get
