@echo off
title broodROM Configurator
echo.
echo Pushing I/O Sheduler Settings
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
adb push "io/07setio" "system/etc/init.d/07setio"
adb -d shell chmod 777 "/system/etc/init.d/07setio"
adb -d shell su -c "busybox dos2unix /system/etc/init.d/07setio"
echo.
echo Done... A reboot is necessary for the changes to take effect
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause