@echo off
title broodROM Configurator
echo.
echo Reboot in Download Mode
echo Make sure your phone has debugging mode enabled
echo.
cd /d %~dp0
adb root
echo. 
echo Please connect your phone to continue...
adb wait-for-device
echo. 
cls
echo.
echo Rebooting Phone in download mode...
adb reboot download
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause