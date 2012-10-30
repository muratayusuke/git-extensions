@echo off
setlocal
set ERR=0
call :FindGitHome "git.cmd"

if exist "%GIT_HOME%" goto :GitHomeOK


:GitHomeOK
set ERR=0

echo Installing git-extensions into "%GIT_HOME%"...
goto :Install


:Install
echo Copying files...
xcopy "%~dp0\bin"            "%GIT_HOME%\bin"                 /Y /R /F
xcopy "%~dp0\lib"            "%GIT_HOME%\lib"                 /Y /R /F
if errorlevel 4 if not errorlevel 5 goto :AccessDenied
if errorlevel 1 set ERR=1

if %ERR%==1 choice /T 30 /C Y /D Y /M "Some unexpected errors happened. Sorry, you'll have to fix them by yourself."


:End
endlocal & exit /B %ERR%
goto :EOF


:AccessDenied
set ERR=1
echo.
echo You should run this script with "Full Administrator" rights:>&2
echo - Right-click with Shift on the script from the Explorer>&2
echo - Select "Run as administrator">&2
goto :End


:FindGitHome
setlocal
set GIT_CMD_DIR=%~dp$PATH:1
if "%GIT_CMD_DIR%"=="" endlocal & goto :EOF
endlocal & set GIT_HOME=%GIT_CMD_DIR:~0,-5%
goto :EOF