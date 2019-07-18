@echo off
if "%1" == "" goto ARGERROR
if "%2" == "" set tempfile=%~dp0template.tex
if not "%2" == "" set tempfile=%~dp0beamer_template.tex
set makefile=%~n1.tex

if not exist %tempfile% goto NOTEMP > nul 2>&1
if exist %makefile% goto OVERWHITE > nul 2>&1

copy %tempfile% %makefile% > nul 2>&1
if not %ERRORLEVEL% == 0 goto COPYERROR
code -r %makefile%
goto END

:ARGERROR
    echo Argument Error.
    goto END

:NOTEMP
    echo No Templete File.
    goto END

:OVERWHITE
    echo Already Exists.
    goto END

:COPYERROR
    echo Copy Error.
    goto END
    
:END