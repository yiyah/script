@echo off

rem get the system version
if /i not "%os%"=="Windows_NT" (set OSver=not window os) else (
    ver | find "4.0" > nul && set OSver=Win 95
    ver | find "4.10"> nul && set OSver=Win 98
    ver | find "4.90"> nul && set OSver=Win me
    ver | find "3.51"> nul && set OSver=Win NT35
    ver | find "5.0" > nul && set OSver=Win 2000
    ver | find "5.1" > nul && set OSver=Win XP
    ver | find "5.2" > nul && set OSver=Win 2003
    ver | find "6.0" > nul && set OSver=Win Vista
    ver | find "6.1" > nul && set OSver=Win 7
    ver | find "6.2" > nul && set OSver=Win 8
    ver | find "10.0"> nul && set OSver=Win 10
    rem set OSbit=x%PROCESSOR_ARCHITECTURE:~-2%
)

echo %OSver%

pause>nul
