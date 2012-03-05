@echo off
title broodROM Configurator
echo.
echo Shutdown Phone
echo Make sure your phone has debugging mode enabled
echo.
cd /d %~dp0
adb root
echo. 
echo Please connect your phone to continue...
adb wait-for-device
echo. 
cls
echo.
echo Shutting down phone...
adb reboot -p
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause