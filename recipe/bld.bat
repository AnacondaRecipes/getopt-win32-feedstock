set getopt_build_mode=Release
set getopt_build_arch=x%ARCH%

msbuild /p:Configuration=%getopt_build_mode%
if errorlevel 1 exit 1

copy %getopt_build_arch%\%getopt_build_mode%\getopt.dll %LIBRARY_BIN%
copy %getopt_build_arch%\%getopt_build_mode%\getopt.lib %LIBRARY_LIB%
copy %SRC_DIR%\getopt.h                                 %LIBRARY_INC%
