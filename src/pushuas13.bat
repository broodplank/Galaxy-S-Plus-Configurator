@echo off
title broodROM Configurator
echo.
echo Pushing Universal Adrenaline Shot 13
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
adb -d shell stop
adb -d shell mount -o remount rw /system
adb -d shell mount -o remount rw /sdcard
echo.
echo Your phone is now freezed, don't panic, please wait...
echo.
echo Uninstalling Thunderbolt v2.4
echo.
adb push "accelerator/stock/tb/system" "/system/"
adb -d shell rm -R /system/etc/init.d/*
adb -d shell rm -R /sdcard/bolt_scripts/*
adb -d shell rm -R /system/etc/init.d
adb -d shell rm -R /sdcard/bolt_scripts
adb -d shell chmod 777 "system/bin/app_process"
adb -d shell chmod 777 "system/bin/system_server"
adb -d shell chmod 777 "system/lib/libncurses.so"
adb -d shell chmod 777 "system/lib/libsqlite.so"
adb -d shell chmod 777 "system/lib/libsqlite_jni.so"
echo. 
echo Uninstalling Thunderbolt v2.4 done...
echo.
echo Installing Universal Adrenaline Shot 13
echo.
adb push "accelerator/uas13/system" "/system/"
echo.
echo Changing permissions...
echo.
adb -d shell chmod 777 "system/bin/app_process"
adb -d shell chmod 777 "system/bin/system_server"
adb -d shell chmod 777 "system/etc/sysctl.conf"
adb -d shell chmod 777 "system/etc/init.d/00remount"
adb -d shell chmod 777 "system/etc/init.d/01acid_sysctl"
adb -d shell chmod 777 "system/etc/init.d/02sdcardspeedfix"
adb -d shell chmod 777 "system/etc/init.d/03kerneltweaks"
adb -d shell chmod 777 "system/etc/init.d/04sysctltweaks"
adb -d shell chmod 777 "system/etc/init.d/05juwesramscript"
adb -d shell chmod 777 "system/lib/libsqlite.so"
adb -d shell chmod 777 "system/lib/libsqlite_jni.so"
echo Done..
echo.
echo Installation done! Rebooting phone, please wait...
echo. 
adb reboot
echo.
echo Done...
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause