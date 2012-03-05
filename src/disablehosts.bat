@echo off
title broodROM Configurator
echo.
echo Disabling Hosts File
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
adb -d shell rm /system/etc/hosts
echo.
echo Disabled hosts file...
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause