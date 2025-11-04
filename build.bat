@echo off
setlocal

:: Check for production build argument
set PRODUCTION_BUILD=OFF
if /I "%1"=="prod" (
    set PRODUCTION_BUILD=ON
    echo Production build enabled!
) else (
    echo Development build enabled!
)

:: Initialize Visual Studio environment
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"

:: Create build directory if it doesn't exist
mkdir build 2>nul
cd build

:: Run CMake with the appropriate options
cmake .. -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DPRODUCTION_BUILD=%PRODUCTION_BUILD%

:: Build the project
nmake

endlocal
pause
