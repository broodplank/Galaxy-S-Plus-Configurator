@echo off
title broodROM Configurator
echo.
echo Pushing ICS 1.7 by reneph/RavoxX
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
adb push "theme/ics/android.policy.jar" "system/framework/android.policy.jar"
adb push "theme/ics/framework-res.apk" "system/framework/framework-res.apk"
adb push "theme/ics/SystemUI.apk" "system/framework/SystemUI.apk"
adb push "theme/ics/twframework-res.apk" "system/framework/twframework-res.apk"
adb push "theme/ics/Contacts.apk" "system/app/Contacts.apk"
adb push "theme/ics/DialerTabActivity.apk" "system/app/DialerTabActivity.apk"
adb push "theme/ics/DownloadProvider.apk" "system/app/DownloadProvider.apk"
adb push "theme/ics/Mms.apk" "system/app/Mms.apk"
adb push "theme/ics/MusicPlayer.apk" "system/app/MusicPlayer.apk"
adb push "theme/ics/Phone.apk" "system/app/Phone.apk"
adb push "theme/ics/Settings.apk" "system/app/Settings.apk"
echo.
echo Done... Rebooting device
adb reboot
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause