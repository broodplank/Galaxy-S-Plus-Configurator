@echo off
title broodROM Configurator
echo.
echo Pushing Extended Status Bar Mod
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
echo Backing-up old SystemUI.apk
adb -d shell mkdir /system/backup
adb -d shell mv /system/framework/SystemUI.apk /system/backup/SystemUI.apk
echo. 
echo Installing new files
echo.
adb push "theme/ext/system/app/SystemUI.apk" "system/app/SystemUI.apk"
adb push "theme/ext/system/app/QuickPanelSettings.apk" "system/app/QuickPanelSettings.apk"
adb push "theme/ext/system/framework/lidroid-res.apk" "system/framework/lidroid-res.apk"
echo.
echo Changing permissions
echo.
adb -d shell chmod 0644 "system/app/SystemUI.apk"
adb -d shell chmod 0644 "system/app/QuickPanelSettings.apk"
adb -d shell chmod 0644 "system/framework/lidroid-res.apk"
echo.
echo Done.. Rebooting phone, please wait.
echo Check out the "QuickPanel Settings" app to manage the status bar
echo. 
adb reboot
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause