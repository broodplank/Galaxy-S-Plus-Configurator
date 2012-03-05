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
echo.
echo Pushing %2 to sdcard.. Please wait
echo. 
adb push "accelerator/Stock_i9001_Restore_CWM_v1.0.3.zip" "sdcard/Stock_i9001_Restore_CWM_v1.0.3.zip"
adb push "accelerator/Remove_Universal_Adrenaline_Shot_v13_RV2.zip" "sdcard/Remove_Universal_Adrenaline_Shot_v13_RV2.zip"
adb push "accelerator/%2" "sdcard/%2"
echo.
echo Pushing %2 to sdcard done
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
echo 5. Now search for the %2 file and press the menu 
echo    button to install the accelerator
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
if %3% == pause_0 exit
if %3% == pause_1 pause