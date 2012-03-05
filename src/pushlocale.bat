@echo off
title broodROM Configurator
echo.
echo Pushing "Locale" App
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
adb install "lang/setlocale.apk"
echo.
echo Done... 
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause