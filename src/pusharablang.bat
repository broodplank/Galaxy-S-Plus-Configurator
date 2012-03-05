@echo off
title broodROM Configurator
echo.
echo Pushing Arabian Language Patch (Right-to-Left)
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
adb push "lang/Language_Arabian_Patch.zip" "sdcard/Language_Arabian_Patch.zip"
echo.
echo. 
echo Your phone will now reboot in CWM Recovery...
adb reboot recovery
echo.
echo When you are in CWM Recovery:
echo 1. Scroll to "Mounts and Storage", Press the menu button
echo 2. Scroll to "mount /system", Press the menu button
echo 3. Scroll to "Install zip from sdcard", Press the menu button 
echo    then press the back button
echo 4. Scroll to "Choose zip from internal sdcard", Press the menu button
echo 5. Now search for the "Language_Arabian_Patch.zip" file and press the menu 
echo    button to install the Arabian patch
echo 6. Choose reboot system now
echo.
echo Controls for CWM:
echo  - Scroll in menu 	( vol - , vol + )
echo  - Choose 		( menu button, the left one )
echo  - Return 		( back button, the right one )
echo. 
echo.
echo Done...
echo.
if %1% == pause_0 exit
if %1% == pause_1 pause