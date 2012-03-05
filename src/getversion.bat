@echo off
title broodROM Configurator
echo.
echo Fetching ROM Version
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
adb pull "system/build.prop" "temp/prop.temp"
echo Done..