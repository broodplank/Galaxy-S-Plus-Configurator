@echo off
title broodROM Configurator
echo.
echo Pushing Extended Status Bar mod
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
echo "Extended-Status-Bar-signed.zip" to sdcard.. Please wait
echo. 
adb push "theme/ext/Extended-Status-Bar-signed.zip" "sdcard/Extended-Status-Bar-signed.zip"
echo.
echo Pushing "Extended-Status-Bar-signed.zip" to sdcard done
echo. 
echo Your phone will now reboot in CWM Recovery...
echo adb reboot recovery
echo.
echo When you are in CWM Recovery:
echo 1. Scroll to "Mounts and Storage", Press the menu button
echo 2. Scroll to "mount /system", Press the menu button
echo 3. Scroll to "Install zip from sdcard", Press the menu button 
echo    then press the back button
echo 4. Scroll to "Choose zip from internal sdcard", Press the menu button
echo 5. Now search for the Extended-Status-Bar-signed.zip file and press 
echo    the menu button to install the mod
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
pause