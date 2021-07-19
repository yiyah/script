@echo off
title Find alive hosts in LAN

echo If you want to find 192.168.1.1 ~ 192.168.1.254
echo just input 192.168.1.[0] (default)
echo note: just support netmask 255.255.255.0
echo scan time about 2 minutes (4 hosts)
echo.
echo Found the following IP in your system. Maybe helpful for you.
ipconfig | findstr IPv4
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

:: get totalTime_minute
if %time_end:~3,2% lss %time_begin:~3,2% (set /a totalTime_minute = %time_end:~3,2% + 60 - %time_begin:~3,2%) else set /a totalTime_minute = %time_end:~3,2% - %time_begin:~3,2% 

:: get totalTime_second
if %time_end:~-5,2% lss %time_begin:~-5,2% (set /a totalTime_second = %time_end:~-5,2% + 60 - %time_begin:~-5,2% & set /a totalTime_minute = %totalTime_minute% - 1) else set /a totalTime_second = %time_end:~-5,2% - %time_begin:~-5,2%

echo.
echo scan is finish!
echo Time info: %time_begin% -- %time_end%
echo Total time is %totalTime_minute% min %totalTime_second% sec.

:failed
pause >nul