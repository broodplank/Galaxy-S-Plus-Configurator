@echo off
title broodROM Configurator
echo ****************************************************
echo * Recover from bootloop, bootloop cause: Theme/Mod *
echo ****************************************************
echo.
echo Instructions:
echo.
echo Choose your theme (before you got bootloop)
echo.
echo [1] ICS v1.7 
echo [2] ICS v2.2
echo [3] ICS v3.0
echo [4] XXKPS Stock
echo [5] Extended Status Bar
echo.
echo [6] Exit
echo.

:choice
set /p C=Choice: 
if "%C%"=="1" goto ics17
if "%C%"=="2" goto ics22
if "%C%"=="3" goto ics30
if "%C%"=="4" goto stock
if "%C%"=="5" goto ext
if "%C%"=="6" goto quit
goto choice

:ics17
cls
echo ****************************************************
echo * Recover from bootloop, bootloop cause: Theme/Mod *
echo * Chosen Theme: Ice Cream Sandwich v1.7            *
echo ****************************************************
ec
echo Instructions
echo.
echo 1. Turn your phone off
echo 2. Turn your phone on
echo 3. Wait until the Samsung logo dissapears
echo 4. Now plug in the USB cable and press enter
echo.
pause
start pushics17.bat
echo.
echo After the flashing is done your phone should be bootloop free
echo.
goto choice

:ics22
cls
echo ****************************************************
echo * Recover from bootloop, bootloop cause: Theme/Mod *
echo * Chosen Theme: Ice Cream Sandwich v2.2            *
echo ****************************************************
echo.
echo Instructions
echo.
echo 1. Turn your phone off
echo 2. Turn your phone on
echo 3. Wait until the Samsung logo dissapears
echo 4. Now plug in the USB cable and press enter
echo.
pause
start pushics22.bat
echo.
echo After the flashing is done your phone should be bootloop free
echo.
goto choice


:ics30
cls
echo ****************************************************
echo * Recover from bootloop, bootloop cause: Theme/Mod *
echo * Chosen Theme: Ice Cream Sandwich v3.0            *
echo ****************************************************
echo.
echo Instructions
echo.
echo 1. Turn your phone off
echo 2. Turn your phone on
echo 3. Wait until the Samsung logo dissapears
echo 4. Now plug in the USB cable and press enter
echo.
pause
start pushics30.bat
echo.
echo After the flashing is done your phone should be bootloop free
echo.
goto choice

:stock
cls
echo ****************************************************
echo * Recover from bootloop, bootloop cause: Theme/Mod *
echo * Chosen Theme: XXKPS Stock Theme                  *
echo ****************************************************
echo.
echo Instructions
echo.
echo 1. Turn your phone off
echo 2. Turn your phone on
echo 3. Wait until the Samsung logo dissapears
echo 4. Now plug in the USB cable and press enter
echo.
pause
start pushstocktheme.bat
echo.
echo After the flashing is done your phone should be bootloop free
echo.
goto choice

:ext
cls
echo ****************************************************
echo * Recover from bootloop, bootloop cause: Theme/Mod *
echo * Chosen Mod: Extended Status Bar                  *
echo ****************************************************
echo.
echo Instructions
echo.
echo 1. Turn your phone off
echo 2. Turn your phone on
echo 3. Wait until the Samsung logo dissapears
echo 4. Now plug in the USB cable and press enter
echo.
pause
start pushextstatbarauto.bat
echo.
echo After the flashing is done your phone should be bootloop free
echo.
goto choice

:quit
exit
