@echo off
title broodROM Configurator
echo.
echo Wiping /dalvik-cache
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
adb -d shell rm -R data/dalvik-cache/*
echo Removing /data/dalvik-cache
echo.
echo Done
echo. 
echo Rebooting phone...
adb reboot
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause