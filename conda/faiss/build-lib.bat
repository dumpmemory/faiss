@REM Copyright (c) Meta Platforms, Inc. and affiliates.
@REM
@REM This source code is licensed under the MIT license found in the
@REM LICENSE file in the root directory of this source tree.

:: Copyright (c) Facebook, Inc. and its affiliates.
::
:: This source code is licensed under the MIT license found in the
:: LICENSE file in the root directory of this source tree.

:: Build libfaiss.so.
cmake -B _build ^
      -T v143 ^
      -A x64 ^
      -G "Visual Studio 17 2022" ^
      -DBUILD_SHARED_LIBS=ON ^
      -DBUILD_TESTING=OFF ^
      -DFAISS_ENABLE_GPU=OFF ^
      -DFAISS_ENABLE_PYTHON=OFF ^
      -DBLA_VENDOR=Intel10_64_dyn ^
      .
if %errorlevel% neq 0 exit /b %errorlevel%

cmake --build _build --config Release -j %CPU_COUNT%
if %errorlevel% neq 0 exit /b %errorlevel%

cmake --install _build --config Release --prefix %PREFIX%
if %errorlevel% neq 0 exit /b %errorlevel%
