@echo off
if "%1" == "" goto ARGERROR
if exist %1 (goto TRUE) else goto FALSE > nul 2>&1
copy nul EROOR.log

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
    platex -interaction=nonstopmode %~n1.tex > EROOR.log 2>&1
    if not %ERRORLEVEL% == 0 goto CMPERROR
    pbibtex %~n1 > nul 2>&1
    platex %~n1.tex > nul 2>&1
    dvipdfmx %~n1.dvi > nul 2>&1
    del %~n1.aux > nul 2>&1
    del %~n1.log > nul 2>&1
    del %~n1.dvi > nul 2>&1
    del %~n1.toc > nul 2>&1
    del %~n1.lot > nul 2>&1
    del %~n1.lof > nul 2>&1
    del %~n1.idx > nul 2>&1
    del %~n1.ind > nul 2>&1
    del %~n1.ilg > nul 2>&1
    del %~n1.bbl > nul 2>&1
    del %~n1.blg > nul 2>&1
    del %~n1_log.txt > nul 2>&1
    del EROOR.log > nul 2>&1
    START %~n1.pdf > nul
    echo Compile Sucess.
    goto END

:KILL
    taskkill /im AcroRd32.exe > nul
    goto NOTKILL

:CMPERROR
    echo Compile Error.
    goto END

:END