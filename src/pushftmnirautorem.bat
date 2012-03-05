@echo off
title broodROM Configurator
echo.
echo Uninstall Flip to Mute and Non Increasing Ringtone Mod
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
echo Please choose the default Phone.apk that you want to restore
echo.
echo [1] XXKPS Stock Phone
echo [2] ICS v3.0 Default Phone
echo.
echo [3] Exit
echo.
goto choice

:choice
set /p C=Choice: 
if "%C%"=="1" goto stockphone
if "%C%"=="2" goto icsphone
if "%C%"=="3" exit

:stockphone
adb -d shell mount -o remount rw /system
echo.
echo Restoring XXKPS Stock Phone.apk
echo.
adb push "theme/ftm-nir/stock/Phone.apk" "system/app/Phone.apk"
echo.
echo Changing permissions
echo.
adb -d shell chmod 0644 "system/app/Phone.apk"
echo.
echo Done..
echo. 
pause
exit


:icsphone
adb -d shell mount -o remount rw /system
echo.
echo Restoring ICS v3.0 Default Phone.apk
echo.
adb push "theme/ftm-nir/stock_ics/Phone.apk" "system/app/Phone.apk"
echo.
echo Changing permissions
echo.
adb -d shell chmod 0644 "system/app/Phone.apk"
echo.
echo Done..
echo. 
pause
exit