@echo off
title broodROM Configurator
echo.
echo Setting CPU Governor
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
adb push "cpu/scaling_governor" "/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"
adb -d shell chmod 664 "/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"
echo.
echo Done... A reboot is necessary for the changes to take effect
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause