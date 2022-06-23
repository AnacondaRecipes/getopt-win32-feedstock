@echo ON
setlocal enabledelayedexpansion

:: Custom cmake file
copy %RECIPE_DIR%\CMakeLists.txt %SRC_DIR%\

:: cmd
echo "Building %PKG_NAME%."

:: Isolate the build.
mkdir Build-%PKG_NAME%
cd Build-%PKG_NAME%
if errorlevel 1 exit /b 1

:: Generate the build files.
echo "Generating the build files..."
cmake .. %CMAKE_ARGS% ^
      -G"Ninja" ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release
type ./CMakeFiles/CMakeOutput.log
::if errorlevel 1 exit /b 1

:: Build.
echo "Building..."
ninja
if errorlevel 1 exit /b 1

:: Install.
echo "Installing..."
ninja install
if errorlevel 1 exit /b 1

:: Error free exit.
echo "Error free exit!"
exit 0
