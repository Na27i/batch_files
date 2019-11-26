@echo off
if "%1" == "" goto ARGERROR
if exist %1 (goto TRUE) else goto FALSE > nul 2>&1

:ARGERROR
    echo Argument Error.
    goto END

:TRUE
    tasklist | find "AcroRd32.exe" > nul 2>&1
    if ERRORLEVEL 1 (goto NOTKILL) else goto KILL

:FALSE
    echo No Such File.
    goto END

:NOTKILL
    xelatex -interaction=nonstopmode %~n1.tex > %~n1_log.txt 2>&1
    if not %ERRORLEVEL% == 0 goto CMPERROR
    xelatex %~n1.tex > %~n1_log.txt
    del %~n1.aux > nul 2>&1
    del %~n1.log > nul 2>&1
    del %~n1.nav > nul 2>&1
    del %~n1.out > nul 2>&1
    del %~n1.snm > nul 2>&1
    del %~n1.toc > nul 2>&1
    del %~n1_log.txt > nul 2>&1
    START %~n1.pdf > nul
    goto END

:KILL
    taskkill /im AcroRd32.exe > nul
    goto NOTKILL

:CMPERROR
    echo Compile Error.
    goto END

:END