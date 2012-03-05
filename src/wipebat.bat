@echo off
title broodROM Configurator
echo.
echo Removing Battery Stats
echo Make sure your phone has debugging mode enabled
echo.
cd /d %~dp0
adb root
echo. 
echo Please connect your phone to continue...
adb wait-for-device
echo. 
adb remount
cls
echo.
adb -d shell rm data/system/batterystats.bin
echo Removing batterystats.bin
echo.
echo Removing battery stats done
echo. 
echo Rebooting Phone...
adb reboot
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause