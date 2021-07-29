@echo off
title Find alive hosts in LAN

echo If you want to find 192.168.1.1 ~ 192.168.1.254
echo just input 192.168.1.0 (default)
echo note: just support netmask 255.255.255.0
echo scan time about 2 minutes (4 hosts)
echo.
call :set_color "Found the following IP in your system. Maybe helpful for you." 0e
echo.
call :showMyAdapter
echo.

set networkSegment=192.168.1.0
set /p networkSegment=input netwrok segment:

for /f "delims=. tokens=1,2,3,4" %%i in ("%networkSegment%") do (

    echo Your input is: %%i.%%j.%%k.%%l
    echo.

    if %%i == 0 (echo input is invalid! & goto failed) else set i1=%%i

    if %%j == 0 (echo input is invalid! & goto failed) else set i2=%%j

    if %%k == 0 (echo input is invalid! & goto failed) else set i3=%%k
)

set time_begin=%time%

:: 255 is broadcast address
for /l %%i in (1,1,254) do ping -w 2 -n 1 %i1%.%i2%.%i3%.%%i | find "TTL="

set time_end=%time%

:: get begin time minute and second
if %time_begin:~3,1% == 0 (set /a time_begin_min=%time_begin:~4,1%) else (set /a time_begin_min=%time_begin:~3,2%)
if %time_begin:~-5,1% == 0 (set /a time_begin_second=%time_begin:~-4,1%) else (set /a time_begin_second=%time_begin:~-5,2%)

:: get end time minute and second
if %time_end:~3,1% == 0 (set /a time_end_min=%time_end:~4,1%) else (set /a time_end_min=%time_end:~3,2%)
if %time_end:~-5,1% == 0 (set /a time_end_second=%time_end:~-4,1%) else (set /a time_end_second=%time_end:~-5,2%)

:: get totalTime_minute
if %time_end_min% lss %time_begin_min% (set /a totalTime_minute = %time_end_min% + 60 - %time_begin_min%) else (set /a totalTime_minute = %time_end_min% - %time_begin_min%)

:: get totalTime_second
if %time_end_second% lss %time_begin_second% (set /a totalTime_second = %time_end_second% + 60 - %time_begin_second% & set /a totalTime_minute = %totalTime_minute% - 1) else (set /a totalTime_second = %time_end_second% - %time_begin_second%)

echo.
echo scan is finish!
echo Time info: %time_begin% -- %time_end%
echo Total time is %totalTime_minute% min %totalTime_second% sec.

:failed
pause >nul


:showMyAdapter
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
        if %%a equ !adapter_line! echo %%b & call :set_color !IP! 0a & echo.
    )
)
goto :eof

:set_color
if not exist %1 (
    set /p= <nul >%1
    findstr /a:%2  %1*
    del %1
) else (
    set /p=%1<nul
    goto :eof
)
goto :eof
