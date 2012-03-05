@echo off
title broodROM Configurator
echo.
echo Pushing Flip to Mute and Non Increasing Ringtone Mod
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
adb -d shell mount -o remount rw /system
echo.
echo Your phone is now freezed, don't panic, please wait...
echo.
echo Backing-up old Phone.apk
adb -d shell mkdir /system/backup
adb -d shell mv /system/app/Phone.apk /system/backup/Phone.apk
echo. 
echo Installing new files
echo.
adb push "theme/ftm-nir/Phone.apk" "system/app/Phone.apk"
echo.
echo Changing permissions
echo.
adb -d shell chmod 0644 "system/app/Phone.apk"
echo.
echo Done..
echo. 
if %1% == pause_0 exit
if %1% == pause_1 pause