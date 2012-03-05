@echo off
title Permissions patch (CHMOD)
echo.
echo Fixing permissions...
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
echo Mounting system...
adb -d shell mount -o remount rw /system
echo.
echo Fixing permissions...
echo.
echo Fixing system app permissions...
adb -d shell find /system/app/ -type f -name '*.apk' -exec chmod 644 {} \;
echo.
echo Fixing framework permissions...
adb -d shell find /system/framework/ -type f -name '*.apk' -exec chmod 644 {} \;
adb -d shell find /system/framework/ -type f -name '*.jar' -exec chmod 644 {} \;
echo.
echo Fixing bootanimation permissions...
adb -d shell chmod 644 "/system/media/sanim.zip"
echo.
echo Fixing init.d scripts permissions...
adb -d shell find /system/etc/init.d/ -type f -name '*.*' -exec chmod 777 {} \;
echo.
echo Fixing gps config file permissions...
adb -d shell chmod 644 "/system/etc/gps.conf"
echo.
echo Fixing apn config file permissions...
adb -d shell chmod 644 "/system/etc/apns-conf.xml"
echo.
echo Fixing boot sound permissions...
adb -d shell chmod 644 "/system/etc/PowerOn.wav"
echo.
echo Done!.
pause