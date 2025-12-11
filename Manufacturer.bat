@echo off
color 0A
echo                             ### ###        ##     # # #      #    #     # # #    ##      # # #    # # # #    # # #    # # #    #     #
echo                           #     #    #      # #     #  # #     #    #     # #       # #    #                #        #    #    # # #      # #
echo                          #     #    #     #  #     #   # #      # #      #          #  #     # # #        #        # # #    #   #         #
echo ______________________________________________________________________________________________________________________________________________________________________________________________

echo                                                                           Press - A - Key - To - Continue
pause >nul
color 07

setlocal enableextensions enabledelayedexpansion

REM Driver installer but a static link is preferred, you can implement dynamic grabbing logic here, I didn't for stability reasons
set url1=https://www.dropbox.com/scl/fi/j9kt2fs7pir93amz424ku/Driver_Auto_Installer_EXE_v5.1632.00.zip?rlkey=vjc8a0fdsz8fge5tx080pj1zn&st=c59t6l7s&dl=l
cls
REM SP Flash Tool link, you can change the version
set url2=https://www.dropbox.com/scl/fi/qtcby7aiuez4t47w5t63e/SP_Flash_Tool_v5.1924_Win.zip?rlkey=snv54jnyput955fw3s24tmta1&st=1l07fc72&dl=l
cls
REM My own ROM as an example
set url3=https://www.dropbox.com/scl/fi/7d1m1mn4gos7i79o9i759/manufactory_lu_v0.800.zip?rlkey=gzsiz217dwwm2lqo2r7rv3vam&st=x1ehx4sd&dl=l
cls
REM Basic ROM flashing guide for device
set url4=https://www.dropbox.com/scl/fi/60tzxdjwtdvqeoqjfqyrh/guide.bat?rlkey=y5cq3t8foxu2rzcherm39syh9&st=60h6iwpz&dl=l
cls

REM self explanatory
set drivers=Driver_Auto_Installer_EXE_v5.1632.00.zip
set file2=SP_Flash_Tool_v5.1924_Win.zip
set file3=manufactory_lu_v0.800.zip
set file4=guide.bat


if not exist Manufactory mkdir Manufactory


echo Downloading drivers...
if not exist Manufactory\Driver_Auto_Installer_SP_Drivers_20160804 curl -L -o %drivers% %url1%
echo Downloading flash tool...
if not exist Manufactory\SP_Flash_Tool_v5.1924_Win curl -L -o %file2% %url2%
echo Downloading ROM build...
if not exist Manufactory\manufactory_lu_v0.800 curl -L -o %file3% %url3%
echo Downloading helper...
if not exist Manufactory\guide.bat curl -L -o %file4% %url4%



move %drivers% Manufactory\
move %file2% Manufactory\
move %file3% Manufactory\
move %file4% Manufactory\

REM you can change folder name here, just make sure that it is changed elsewhere (I am aware of how poorly this is coded, it wasn't made for dynamic use cases)
cd Manufactory


echo Building environment...
for %%f in (*.zip) do (
    echo Unzipping %%f...
    tar -xf %%f
)


echo Deleting ZIP files...
del *.zip

timeout /t 3

cls

echo Part 1 successful. Resuming...

timeout /t 3

cls

cd Driver_Auto_Installer_SP_Drivers_20160804


echo Starting driver installation...
start /wait DriverInstall.exe


echo DO NOT REBOOT YET. Follow the prompts for the driver install and when the driver installer FINISHES, it will allow you to reboot. When it reboots for you, use guide.bat for further guidance on how to install Manufactory.
pause >nul
shutdown /r /t 0

