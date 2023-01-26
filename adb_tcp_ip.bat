@echo off
setlocal enabledelayedexpansion
setlocal EnableExtensions
set var=%0
set Var=%var:~0,-4%
title %Var%
echo Searching for Adb devices
adb devices -l | findstr "product"> nul
if errorlevel 1 (
    echo No device Found...
    echo Please connect your device
    goto End
) else (
    echo Device is connected...
)
for /f "tokens=9" %%a in ('adb shell ip route') do set IP=%%a

set /p PORT="Please enter any port you wanna use (5555,5012): "

adb tcpip %PORT%
echo %IP%:%PORT%
echo adb connect %IP%:%PORT% | clip

goto End

:End
echo Thanks for using %Script_Name%
