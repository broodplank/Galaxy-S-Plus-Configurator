@echo off
title broodROM Configurator
echo.
echo Pushing %1
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
echo *************************
echo *   Installing Kernel   *
echo.*************************
echo.
echo Pushing %2 to sdcard.. Please wait
echo. 
adb push "kernel/%2" "sdcard/%2"
echo.
echo Pushing %2 to sdcard done
echo. 
echo Your phone will now reboot in CWM Recovery...
adb reboot recovery
echo.
echo When you are in CWM Recovery:
echo 1. Scroll to "Install zip from sdcard", Press the menu button
echo 2. Scroll to "Choose zip from internal sdcard", Press the menu button
echo 3. Now search for the %2 file and press the menu 
echo    button to install the kernel
echo 4. Choose reboot system now
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