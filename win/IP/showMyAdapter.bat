@echo off
title ^Find Adapter and it's IP

setlocal enabledelayedexpansion
for /f "delims=:  tokens=1,3" %%i in ('ipconfig ^| findstr /n IPv4') do (
    rem get the IP and the row where it is
    set /a IP_Line=%%i
    set IP_origin=%%j

    rem get the row where the adapter is
    set /a adapter_line=!IP_Line!-4
    rem remove the blank in front of IP
    set IP=!IP_origin:~1,15!

    rem show after finding the row where the adapter is
    for /f "tokens=1* delims=:" %%a in ('ipconfig^|findstr /n .*') do (
        if %%a equ !adapter_line! echo %%b & echo !IP! & echo.
    )
)

pause > nul
