@echo off
title Calculate the program running ^time

set time_begin=%time%

:: Add code in the area below

ping 127.0.0.1

:: Add code in the area above

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
echo Time info: %time_begin% -- %time_end%
echo Total time is %totalTime_minute% min %totalTime_second% sec.

pause >nul
