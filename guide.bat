@echo off
setlocal enabledelayedexpansion

set "COLOR_RESET="
set "COLOR_IMPORTANT=0E"    
set "COLOR_TIP=0B"          
set "COLOR_PROMPT=0A"       
set "COLOR_TITLE=0E"        


echo.
color %COLOR_TITLE%
echo =============================
echo   Manufactory Flash Wizard v1.20
echo =============================
echo.
color %COLOR_PROMPT%
echo Is your Q5 about 1cm (0.4 inches) thick?
echo Type "yes" if it's around 1cm thick, or "no" if it's thinner.
set /p thickness=Is it about 1cm thick? (yes/no): 
if /I "!thickness!"=="no" (
    color %COLOR_IMPORTANT%
    echo Sorry, the ROM does not support TIMMKOO devices older than generation 2.
    echo Aborting guide...
    color %COLOR_RESET%
    pause
    exit /b
)

echo.
color %COLOR_PROMPT%
echo Does your device turn on when you press the power button?
set /p power=Is the device turned on? (yes/no): 
if /I "!power!"=="yes" (
    color %COLOR_TIP%
    echo.
    echo TIP: Please hold down the power button until you see a prompt.
    echo       Then select "Shut down" and confirm with "Yes."
    color %COLOR_RESET%
    pause
)

color %COLOR_TIP%
echo.
echo Once your MP3 player is fully turned off
echo DO NOT CONNECT THE USB CABLE TO IT. ONLY put the USB cable into your PC. Do not connect it to your MP3 player. This is very important
color %COLOR_RESET%
pause

color %COLOR_TIP%
echo.
echo Opening Flash Tool...
cd SP_Flash_Tool_v5.1924_Win\
flash_tool.exe
timeout /t 3 >nul

color %COLOR_TIP%
echo.
echo Please select the following options in SP Flash Tool:
echo Download Agent: Manufactory\SP_Flash_Tool_v5.1648_Win\MTK_AllInOne_DA.bin
echo Scatter File: Manufactory\manufactory_lu_v0.800\MT6582_Android_scatter.txt
color %COLOR_RESET%
pause

cls
color %COLOR_IMPORTANT%
echo IMPORTANT: Please select "Format All + Download" in SP Flash Tool.
echo WARNING: Do NOT unplug the USB cable until the flashing process is complete. Do not use a fraying or damaged USB cord. Make sure that the connection is firm before plugging your device in.
echo When ready, press "Download" in SP Flash Tool. Then, AFTER you have pressed download, not before, plug in and do not unplug the MP3 player. Do not plug in the MP3 player BEFORE you press "Download" in SP Flash Tool.
pause

color %COLOR_TIP%
echo Once there is a window saying "Download ok" with a green checkmark, unplug your MP3 player and turn it on. color %COLOR_RESET%
pause
endlocal
exit /b
