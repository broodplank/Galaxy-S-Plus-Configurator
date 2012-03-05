@echo off
title broodROM Configurator
echo.
echo Pushing Stock APN list
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
adb push "apn/stock/apns-conf.xml" "system/etc/apns-conf.xml"
adb -d shell chmod 0644 "/system/etc/apns-conf.xml"
adb -d shell su -c "busybox dos2unix /system/etc/apns-conf.xml"
echo.
echo Done... A reboot is necessary for the changes to take effect
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause