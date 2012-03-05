@echo off
title broodROM Configurator
echo.
echo Pushing Battery Tweak
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
adb push "tweak/08batterytweak" "system/etc/init.d/08batterytweak"
echo Pushing BatteryTweak
adb -d shell chmod 777 "system/etc/init.d/08batterytweak"
echo Settings Permissions to 777 (RWX-RWX-RWX)
echo.
echo Done...
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause