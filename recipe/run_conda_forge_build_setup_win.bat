
:: 2 cores available on Appveyor workers: https://www.appveyor.com/docs/build-configuration/#build-environment
:: CPU_COUNT is passed through conda build: https://github.com/conda/conda-build/pull/1149
set CPU_COUNT=2

set PYTHONUNBUFFERED=1

conda config --set show_channel_urls true
conda config --set add_pip_as_python_dependency false

conda update -n root --yes --quiet conda conda-env conda-build
conda update -n root --yes --quiet python
conda install -n root --yes --quiet jinja2 conda-build anaconda-client

:: Needed for building extensions in python2.7 x64 with cmake.
:: Since python version and arch is not known at this point, install it everywhere.
conda install -n root --yes --quiet vs2008_express_vc_python_patch
call setup_x64

conda info
conda config --get
