@echo off
title broodROM Configurator
echo.
echo Pushing XXKPS 2.3.6 Stock Theme (Without AOSP Lockscreen & Extended Power Menu)
echo Phone will freeze and reboot after operation
echo Make sure your phone has debugging mode enabled
echo.
cd /d %~dp0
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
adb push "theme/stock/stock/android.policy.jar" "system/framework/android.policy.jar"
adb push "theme/stock/framework-res.apk" "system/framework/framework-res.apk"
adb push "theme/stock/SystemUI.apk" "system/framework/SystemUI.apk"
adb push "theme/stock/Contacts.apk" "system/app/Contacts.apk"
adb push "theme/stock/DialerTabActivity.apk" "system/app/DialerTabActivity.apk"
adb push "theme/stock/DownloadProvider.apk" "system/app/DownloadProvider.apk"
adb push "theme/stock/Mms.apk" "system/app/Mms.apk"
adb push "theme/stock/MusicPlayer.apk" "system/app/MusicPlayer.apk"
adb push "theme/stock/Phone.apk" "system/app/Phone.apk"
adb push "theme/stock/Settings.apk" "system/app/Settings.apk"
echo.
echo Done... Rebooting device
adb reboot
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause