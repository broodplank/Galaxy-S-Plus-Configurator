@echo off
title broodROM Configurator
echo.
echo Enabling Media Scanning on Boot...
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
adb shell pm enable com.android.providers.media/com.android.providers.media.MediaScannerReceiver
echo.
echo.
echo Enabled Media Scanning on Boot...
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause