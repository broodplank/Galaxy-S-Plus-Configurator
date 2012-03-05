@echo off
title broodROM Configurator
echo.
echo Pushing Feacore Phoenix bootsound
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
adb push "sound/PowerOn.wav" "system/etc/PowerOn.wav"
echo Pushing PowerOn.wav
adb -d shell chmod 0644 "/system/etc/PowerOn.wav"
echo Settings Permissions to 644 (RW-R-R)
echo.
echo Done...
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause