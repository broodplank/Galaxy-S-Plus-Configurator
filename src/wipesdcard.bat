@echo off
title broodROM Configurator
echo.
echo Wiping /sdcard
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
adb -d shell rm -R sdcard/*
echo Removing /sdcard
echo.
echo Done.
echo. 
if %1% == pause_0 exit
if %1% == pause_1 pause