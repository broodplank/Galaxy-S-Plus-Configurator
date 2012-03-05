@echo off
title broodROM Configurator
echo.
echo Disabling Media Scanning on Boot...
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
adb shell pm disable com.android.providers.media/com.android.providers.media.MediaScannerReceiver
echo.
echo Disabled Media Scanning on Boot...
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause