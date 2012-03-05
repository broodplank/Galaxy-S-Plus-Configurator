@echo off
title broodROM Configurator
echo.
echo Pushing Custom broodROM RC2 boot animation by Sweetez
echo Make sure your phone has debugging mode enabled
echo.
cd /d %~dp0
adb root
adb wait-for-device
adb remount
cls
echo.
adb push "bootani/rc2_custom/sanim.zip" "system/media/sanim.zip"
echo Pushing sanim.zip
adb -d shell chmod 0644 "/system/media/sanim.zip"
echo Settings Permissions to 644 (RW-R-R)
echo.
echo Done...
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause