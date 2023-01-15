@ echo off
echo.
set science=%1


rem echo these are your interfaces
rem use below to get system's interface name
rem netsh interface show interface
echo ======================================================================================
rem echo Press any key to continue
rem pause >nul

if "%science%"=="1" (
    echo science=%science%
    set gat="192.168.5.1"
    set dns="8.8.4.4"
) else (
    echo science=0
    set gat="192.168.5.254"
    set dns="192.168.5.254"
)
set adapterName="WLAN"
set IPAddr="192.168.5.66"

rem use this "netsh interface ip set ?" to check in terminal
netsh interface ip set address name=%adapterName% source=static address=%IPAddr% mask=255.255.255.0 gateway=%gat% 1 >nul
netsh interface ip set dnsservers name=%adapterName% source=static address=%dns% validate=no >nul

rem below is delay 10s
rem timeout /t 10 /nobreak
rem below is delay 6s
ping 127.1 -n 5 >nul

echo now your %adapterName% IP is:
netsh interface ipv4 show addresses name=%adapterName%
rem netsh interface ipv4 show addresses name=%adapterName%
netsh interface ipv4 show dnsservers name=%adapterName%
echo ======================================================================================