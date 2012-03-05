@echo off
title broodROM Configurator
:menu
echo ************************************************************
echo * Recover from bootloop, bootloop cause: Cranium Kernel v8 *
echo ************************************************************
echo.
echo Instructions:
echo.
echo Choose prefered new Kernel
echo.
echo [1] Feacore 1.3.1 Non OC
echo [2] Feacore 1.3.1 OC
echo [3] Feacore 1.4 Non OC
echo [4] Feacore 1.4 OC
echo [5] Cranium Kernel v6
echo.
echo [6] Exit
echo.
goto choice

:choice
set /p C=Choice: 
if "%C%"=="1" goto fc131noc
if "%C%"=="2" goto fc131oc
if "%C%"=="3" goto fc14noc
if "%C%"=="4" goto fc14oc
if "%C%"=="5" goto cranv6
if "%C%"=="6" goto quit
goto choice

:fc131noc
cls
echo ************************************************************
echo * Recover from bootloop, bootloop cause: Cranium Kernel v8 *
echo * Chosen new Kernel: Feacore 1.3.1 Non OC                  *
echo ************************************************************
echo.
echo Instructions
echo.
echo 1. Turn your phone off
echo 2. Turn your phone on
echo 3. Wait until the Samsung logo dissapears
echo 4. Now plug in the USB cable and press enter
echo.
pause
start pushkernel "Feacore 1.3.1 Non OC" "FeaCore_Phoenix_nonOC_stable_release.zip"
echo.
echo After the flashing is done your phone should be bootloop free
echo.
goto choice

:fc131oc
cls
echo ************************************************************
echo * Recover from bootloop, bootloop cause: Cranium Kernel v8 *
echo * Chosen new Kernel: Feacore 1.3.1 OC                      *
echo ************************************************************
echo.
echo Instructions
echo.
echo 1. Turn your phone off
echo 2. Turn your phone on
echo 3. Wait until the Samsung logo dissapears
echo 4. Now plug in the USB cable and press enter
echo.
pause
start pushkernel "Feacore 1.3.1 OC" "FeaCore_Phoenix_stable.zip"
echo.
echo After the flashing is done your phone should be bootloop free
echo.
goto choice


:fc14noc
cls
echo ************************************************************
echo * Recover from bootloop, bootloop cause: Cranium Kernel v8 *
echo * Chosen new Kernel: Feacore 1.4 Non OC                    *
echo ************************************************************
echo.
echo Instructions
echo.
echo 1. Turn your phone off
echo 2. Turn your phone on
echo 3. Wait until the Samsung logo dissapears
echo 4. Now plug in the USB cable and press enter
echo.
pause
start pushkernel "Feacore 1.4 Non OC" "FeaCore_Phoenix_nonOC_stable_FMR_1.4.zip"
echo.
echo After the flashing is done your phone should be bootloop free
echo.
goto choice

:fc14oc
cls
echo ************************************************************
echo * Recover from bootloop, bootloop cause: Cranium Kernel v8 *
echo * Chosen new Kernel: Feacore 1.4 OC                        *
echo ************************************************************
echo.
echo Instructions
echo.
echo 1. Turn your phone off
echo 2. Turn your phone on
echo 3. Wait until the Samsung logo dissapears
echo 4. Now plug in the USB cable and press enter
echo.
pause
start pushkernel "Feacore 1.4 OC" "FeaCore_Phoenix_OC_stable_FMR_1.4.zip"
echo.
echo After the flashing is done your phone should be bootloop free
echo.
goto choice


:cranv6
cls
echo ************************************************************
echo * Recover from bootloop, bootloop cause: Cranium Kernel v8 *
echo * Chosen new Kernel: Cranium Kernel v6 (1900MHz)           *
echo ************************************************************
echo.
echo Instructions
echo.
echo 1. Turn your phone off
echo 2. Turn your phone on
echo 3. Wait until the Samsung logo dissapears
echo 4. Now plug in the USB cable and press enter
echo.
pause
start pushkernel "Cranium Kernel v6" "Cranium_Kernel_v6_1900_MHz.zip"
echo.
echo After the flashing is done your phone should be bootloop free
echo.
goto choice

:quit
exit
