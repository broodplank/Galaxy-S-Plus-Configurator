@echo off
echo.
echo ***************************************************
echo * Recover from bootloop, bootloop cause: Unknown  *
echo * Got nandroid backup                             *
echo ***************************************************
echo.
echo Instructions
echo.
echo 1. Turn your phone off
echo 2. Turn your phone on
echo 3. Wait until the Samsung logo dissapears
echo 4. Now plug in the USB cable and press enter
echo.
pause
adb reboot recovery
echo. 
echo When you are in CWM Recovery:
echo 1. Scroll to "Backup and Restore", Press the menu button
echo 2. Scroll to "Advanced restore (from internal sdcard)"
echo    Press the menu button to select
echo 3. Now select the available backup and press the menu 
echo    button to go to Nandroid Advanced Restore
echo 4. Choose "Restore system", press the menu button
echo 5. When process is complete you should be bootloop free.
echo.
echo Controls for CWM:
echo  - Scroll in menu 	( vol - , vol + )
echo  - Choose 		( menu button, the left one )
echo  - Return 		( back button, the right one )
echo.
echo.
pause