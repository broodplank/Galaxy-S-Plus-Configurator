@echo off
cd /d %~dp0
echo Running Safe Mode
echo.
adb root
adb wait-for-device
echo Mounting /system
adb -d shell mount -o remount rw /system
echo Done...
