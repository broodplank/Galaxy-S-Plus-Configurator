@echo off
title broodROM Configurator
echo.
echo Uninstall Extended status bar mod and restore original
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
adb -d shell stop
echo.
echo Your phone is now freezed, don't panic, please wait...
echo.
echo Removing Extended status bar mod files..
adb -d shell rm /system/app/SystemUI.apk
adb -d shell rm /system/app/QuickPanelSettings.apk
adb -d shell rm /system/framework/lidroid-res.apk
echo. 
echo Restoring original SystemUI.apk
adb push "theme/ext/system/original/SystemUI.apk" "system/framework/SystemUI.apk"
echo.
echo Changing permissions
adb -d shell chmod 644 "/system/framework/SystemUI.apk"
echo.
echo Done.. Rebooting phone, please wait.
echo. 
adb reboot
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause