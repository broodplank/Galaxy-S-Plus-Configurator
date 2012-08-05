@echo off
title broodROM Configurator
echo.
echo Setting I/O Scheduler
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
adb push "io/scheduler" "/sys/block/mmcblk0/queue/scheduler"
adb push "io/scheduler" "/sys/block/mmcblk1/queue/scheduler"
adb -d shell chmod 664 "/sys/block/mmcblk0/queue/scheduler"
adb -d shell chmod 664 "/sys/block/mmcblk1/queue/scheduler"
echo.
echo Done... A reboot is necessary for the changes to take effect
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause