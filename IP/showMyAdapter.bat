@echo off
title ^Find Adapter and it's IP

setlocal enabledelayedexpansion
for /f "delims=:  tokens=1,3" %%i in ('ipconfig ^| findstr /n IPv4') do (
    set tmp1=%%i
    set tmp2=%%j
    set /a tmp3=!tmp1!
    set /a adapter_line=!tmp3!-4
    set ip=!tmp2:~1,15!

    for /f "tokens=1* delims=:" %%a in ('ipconfig^|findstr /n .*') do (
        if %%a equ !adapter_line! echo %%b & echo !ip! & echo.
    )
)

pause > nul