@echo on

mkdir builddir

:: flang 17 still uses "temporary" name
set "FC=flang-new"

:: -wnx flags mean: --wheel --no-isolation --skip-dependency-check
%PYTHON% -m build -w -n -x ^
    -Cbuilddir=builddir ^
    -Csetup-args=-Dblas=blas ^
    -Csetup-args=-Dlapack=lapack ^
    -Csetup-args=-Duse-g77-abi=true
if %ERRORLEVEL% neq 0 (type builddir\meson-logs\meson-log.txt && exit 1)
