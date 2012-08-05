@echo off
title broodROM Configurator
echo.
echo Pushing Samsung Galaxy W (i8150) GPU Drivers
echo Phone will freeze and reboot after operation
echo Make sure your phone has debugging mode enabled
echo.
cd /d %~dp0
echo. 
echo Please connect your phone to continue...
adb wait-for-device
echo. 
adb remount
cls
echo.
adb -d shell stop
adb push "gpu/i8150/egl/egl.cfg" "system/lib/egl/egl.cfg"
adb push "gpu/i8150/egl/libEGL_adreno200.so" "system/lib/egl/libEGL_adreno200.so"
adb push "gpu/i8150/egl/libGLES_android.so" "system/lib/egl/libGLES_android.so"
adb push "gpu/i8150/egl/libGLESv1_CM_adreno200.so" "system/lib/egl/libGLESv1_CM_adreno200.so"
adb push "gpu/i8150/egl/libGLESv2_adreno200.so" "system/lib/egl/libGLESv2_adreno200.so"
adb push "gpu/i8150/egl/libq3dtools_adreno200.so" "system/lib/egl/libq3dtools_adreno200.so"
echo.
echo Done... Rebooting device
adb reboot
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause