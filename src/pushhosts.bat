@echo off
title broodROM Configurator
echo.
echo Pushing up-to-date hosts file
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
echo Pushing...
adb push "temp/hosts" "system/etc/hosts"
echo.
echo Setting Permissions...
adb -d shell chmod 644 "system/etc/hosts"
echo.
echo Converting DOS Linebreaks to Unix Linebreaks...
adb -d shell su -c "busybox dos2unix /system/etc/hosts"
echo.
echo Done...
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause