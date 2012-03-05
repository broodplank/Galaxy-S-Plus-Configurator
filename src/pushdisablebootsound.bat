@echo off
title broodROM Configurator
echo.
echo Disabling boot sound
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
adb -d shell mv system/etc/PowerOn.wav system/etc/PowerOn.sound
echo.
echo Done...
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause