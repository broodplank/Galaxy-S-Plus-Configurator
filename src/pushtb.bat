@echo off
title broodROM Configurator
echo.
echo Pushing Thunderbolt 2.5.1
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
adb install "accelerator/tb/scriptman.apk"
adb -d shell stop
adb -d shell mount -o remount rw /system
adb -d shell mount -o remount rw /data
adb -d shell mount -o remount rw /sdcard
echo.
echo Your phone is now freezed, don't panic, please wait...
echo.
echo Uninstalling Universal Adreanaline Shot 13
echo.
adb push "accelerator/stock/uas13/system" "/system/"
adb -d shell rm -R /system/etc/init.d/*
adb -d shell rm /system/etc/sysctl.conf
adb -d shell chmod 777 "system/bin/app_process"
adb -d shell chmod 777 "system/bin/system_server"
adb -d shell chmod 777 "system/lib/libsqlite.so"
adb -d shell chmod 777 "system/lib/libsqlite_jni.so"
echo. 
echo Uninstalling Universal Adrenaline Shot 13 done...
echo.
echo Installing Thunderbolt v2.5.1...
echo.
adb push "accelerator/tb/sdcard" "/sdcard/"
adb push "accelerator/tb/system" "/system/"
echo.
echo Changing permissions...
echo.
adb -d shell chmod 777 "system/etc/init.d/S70darky_zipalign"
adb -d shell chmod 777 "system/etc/init.d/s78enable_touchscreen_1"
adb -d shell chmod 777 "system/etc/init.d/S98bolt_siyah"
adb -d shell chmod 777 "system/etc/init.d/S98CFS"
adb -d shell chmod 777 "system/etc/init.d/S98system_tweak"
adb -d shell chmod 777 "system/lib/libncurses.so"
adb -d shell chmod 777 "system/xbin/sqlite3"
adb -d shell chmod 777 "system/xbin/zipalign"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFS_1.9.1"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFS_1.9.4"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFS_2.1.1.1"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFSA"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFSB"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFSC"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFSD"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFSE"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFSF"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFSG"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFSH"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFSI"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFSJ"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFSK"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFSL"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFSM"
adb -d shell chmod 777 "sdcard/bolt_scripts/CFS/S98CFSStock"
adb -d shell chmod 777 "sdcard/bolt_scripts/Remounts/remountCM7MIUI-fullext4"
adb -d shell chmod 777 "sdcard/bolt_scripts/Remounts/remountCM7MIUI-yaffs"
adb -d shell chmod 777 "sdcard/bolt_scripts/Remounts/remounti9000"
adb -d shell chmod 777 "sdcard/bolt_scripts/Remounts/remounti9001"
adb -d shell chmod 777 "sdcard/bolt_scripts/Remounts/remounti9100"
adb -d shell chmod 777 "sdcard/bolt_scripts/Remounts/remountN7000"
adb -d shell chmod 777 "sdcard/bolt_scripts/Remounts/remountSGS4G"
adb -d shell chmod 777 "sdcard/bolt_scripts/Touchscreen/s78enable_touchscreen_1"
adb -d shell chmod 777 "sdcard/bolt_scripts/Touchscreen/s78enable_touchscreen_2"
adb -d shell chmod 777 "sdcard/bolt_scripts/Touchscreen/s78enable_touchscreen_stock"
adb -d shell chmod 777 "sdcard/bolt_scripts/drop"
adb -d shell chmod 777 "sdcard/bolt_scripts/sqlite_optimize"
echo.
echo Done..
echo.
echo Installation done! Rebooting phone, please wait...
echo. 
adb reboot
echo.
echo Final configuration of Thunderbolt
echo.
echo Open Script Manager, browse to /sdcard/bolt_scripts/Remounts/
echo Open remounti9001 and choose the Su / Boot icon
echo Press Save.
echo.
echo Now browse to /sdcard/bolt_scripts/
echo Open sqlite_optimize and choose the Su icon, then choose Run
echo Wait for it to complete and click Close
echo.
echo Done...
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause