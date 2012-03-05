@echo off
title broodROM Configurator
echo.
echo Pushing ICS 3.0 by reneph/RavoxX
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
echo Installing ICS v3.0 Theme, please wait...
echo.
adb push "theme/ics3/android.policy.jar" "system/framework/android.policy.jar"
adb push "theme/ics3/framework-res.apk" "system/framework/framework-res.apk"
adb push "theme/ics3/SystemUI.apk" "system/framework/SystemUI.apk"
adb push "theme/ics3/twframework-res.apk" "system/framework/twframework-res.apk"
adb push "theme/ics3/Contacts.apk" "system/app/Contacts.apk"
adb push "theme/ics3/DialerTabActivity.apk" "system/app/DialerTabActivity.apk"
adb push "theme/ics3/DownloadProvider.apk" "system/app/DownloadProvider.apk"
adb push "theme/ics3/DownloadProviderUI.apk" "system/app/DownloadProviderUI.apk"
adb push "theme/ics3/Mms.apk" "system/app/Mms.apk"
adb push "theme/ics3/MusicPlayer.apk" "system/app/MusicPlayer.apk"
adb push "theme/ics3/Phone.apk" "system/app/Phone.apk"
adb push "theme/ics3/Settings.apk" "system/app/Settings.apk"
adb push "theme/ics3/Browser.apk" "system/app/Browser.apk"
adb push "theme/ics3/ClockPackage.apk" "system/app/ClockPackage.apk"
adb push "theme/ics3/Camera.apk" "system/app/Camera.apk"
adb push "theme/ics3/Email.apk" "system/app/Email.apk"
adb push "theme/ics3/Gallery3D.apk" "system/app/Gallery3D.apk"
adb push "theme/ics3/VideoPlayer.apk" "system/app/VideoPlayer.apk"
adb push "theme/ics3/MyFiles.apk" "system/app/MyFiles.apk"
adb push "theme/ics3/TouchWizCalculator.apk" "system/app/TouchWizCalculator.apk"
adb push "theme/ics3/TouchWizCalendar.apk" "system/app/TouchWizCalendar.apk"
echo.
echo Done... Rebooting device
adb reboot
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause