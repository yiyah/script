@echo off
title Calculate the program running ^time

set time_begin=%time%

:: Add the code which need detect in here
:: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
:: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

set time_end=%time%

:: get totalTime_minute
if %time_end:~3,2% lss %time_begin:~3,2% (set /a totalTime_minute = %time_end:~3,2% + 60 - %time_begin:~3,2%) else set /a totalTime_minute = %time_end:~3,2% - %time_begin:~3,2%

:: get totalTime_second
if %time_end:~-5,2% lss %time_begin:~-5,2% (set /a totalTime_second = %time_end:~-5,2% + 60 - %time_begin:~-5,2% & set /a totalTime_minute = %totalTime_minute% - 1) else set /a totalTime_second = %time_end:~-5,2% - %time_begin:~-5,2%

echo.
echo Time info: %time_begin% -- %time_end%
echo Total time is %totalTime_minute% min %totalTime_second% sec.

pause >nul