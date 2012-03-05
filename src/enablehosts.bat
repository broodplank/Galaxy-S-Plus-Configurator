@echo off
title broodROM Configurator
echo.
echo Enabling Hosts file (Adblocker)
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
adb push "temp/hosts_original" "system/etc/hosts"
adb -d shell chmod 0644 "system/etc/hosts"
adb -d shell su -c "busybox dos2unix /system/etc/hosts"
echo.
echo Enabled hosts file..
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause