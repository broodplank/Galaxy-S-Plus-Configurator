@echo off
title broodROM Configurator
echo.
echo Pushing ICS Black Keyboard
echo Phone will freeze and reboot after operation
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
adb -d shell stop
echo Installing ICS Black Keyboard, please wait...
echo.
adb push "keyboard/black_ics/AxT9IME.apk" "system/app/AxT9IME.apk"
echo.
echo Done... Rebooting device
adb reboot
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause