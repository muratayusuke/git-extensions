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
if exist .git-extensions rd /s /q .git-extensions
call git clone git@github.com:muratayusuke/git-extensions.git .git-extensions
echo Copying files...
xcopy ".git-extensions\bin"            "%GIT_HOME%\bin"                 /Y /R /F
xcopy ".git-extensions\lib"            "%GIT_HOME%\lib"                 /Y /R /F
if errorlevel 4 if not errorlevel 5 goto :AccessDenied
if errorlevel 1 set ERR=1

if %ERR%==1 choice /T 30 /C Y /D Y /M "Some unexpected errors happened. Sorry, you'll have to fix them by yourself."

echo.
echo ================================
echo install completed
echo ================================
echo Now you can use following command:
echo.
echo git bk
echo git ffcheck [master^|develop]
echo git mktopic name
echo git mkreltag name
echo.
echo for more infromation, check this url:
echo https://github.com/muratayusuke/git-extensions
echo.

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