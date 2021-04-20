@echo off
if not "%EnterpriseWDK%"=="" goto ready
if "%EWDK2004_DIR%"=="" set EWDK2004_DIR=c:\ewdk2004
call :add_path "%EWDK2004%\Program Files\Microsoft Visual Studio\2019\BuildTools\VC\Redist\MSVC\14.27.29016\onecore\x86\Microsoft.VC142.OPENMP\vcomp140.dll"
call :add_path "%EWDK2004%\Program Files\Windows Kits\10\bin\10.0.19041.0\x86\ucrt\ucrtbased.dll"
call :add_path "%EWDK2004%\Program Files\Microsoft Visual Studio\2019\BuildTools\VC\Redist\MSVC\14.27.29016\onecore\debug_nonredist\x86\Microsoft.VC142.DebugCRT\vcruntime140D.dll"
call %EWDK2004%\BuildEnv\SetupBuildEnv.cmd
goto :eof

:add_path
echo %path% | findstr /i /c:"%~dp1"
if not errorlevel 1 goto :eof
echo Adding path %~dp1
set path=%path%;%~dp1
goto :eof

:ready
echo We are already in EWDK version: %Version_Number%
goto :eof
