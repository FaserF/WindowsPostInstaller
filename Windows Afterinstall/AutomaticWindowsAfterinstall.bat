@echo off
title Windows Driver & Programm Installer by FaserF
color 89

:Default
cd C:\Users\%username%\Downloads\
cls
echo             ============================================================
echo                                    Automatische
echo                   Treiber und Programm Installation by Fabian Seitz
echo                         ----> Thanks to @KaiSMR & Luis
echo             ============================================================
echo.
echo            Initialisiere Standard Installation
echo.
echo.
start https://ninite.com/7zip-chrome-steam/ninite.exe
echo Warte auf Beendigung des Downloads, dann ...
pause
echo Warte auf Fertigstellung von Chrome Installation! Wichtig!, dann ...
Ren "C:\Users\%username%\Downloads\Ninite 7Zip Chrome Steam Installer.exe" Ninite-Chrome-7zip-Steam.exe
start Ninite-Chrome-7zip-Steam.exe
msg * "Bitte Standard Browser auf Chrome ändern! -> Einstellungen -> Apps -> Standard-Apps"
pause
start https://github.com/Edgarware/Threshold-Skin/archive/master.zip
start http://de.download.nvidia.com/GFE/GFEClient/3.5.0.70/GeForce_Experience_v3.5.0.70.exe
start https://www.netzwelt.de/software-download/38551-driver-booster.html
start https://discordapp.com/api/download?platform=win
start https://app.prntscr.com/build/setup-lightshot.exe
start https://central.bitdefender.com/
echo Warte auf Beendigung der Downloads, dann ...
pause
Ren "C:\Users\%username%\Downloads\Ninite 7Zip Steam Installer.exe" Ninite-7zip-Steam.exe
start GeForce_Experience_v3.5.0.70.exe /s
start driver_booster_setup.exe /verysilent
start DiscordSetup.exe
start setup-lightshot.exe
taskkill /IM MicrosoftEdge.exe
echo Driver Booster Lizenz (läuft ab: Juni 2017): AEA62-9AB38-55C75-339B4 > "C:\Users\%username%\Downloads\DriverBoosterKey.txt"
echo Installationen gestartet. Warte auf Abschluss ALLER Installationen, dann ...
pause
del /q C:\Users\%username%\Downloads\*.exe
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\Threshold-Skin-master.zip -oC:\Users\%username%\Downloads\
robocopy "C:\Users\%username%\Downloads\Threshold-Skin-master" "C:\Program Files (x86)\Steam\skins\Threshold" /MIR
xcopy /s /y "C:\Program Files (x86)\Steam\skins\Threshold\Customization\Sidebar Width\Collapsed Sidebar\resource" "C:\Program Files (x86)\Steam\skins\Threshold\resource"
rd /s /q C:\Users\%username%\Downloads\Threshold-Skin-master
del /q C:\Users\%username%\Downloads\Threshold-Skin-master.zip
goto :Start

:Start
cd C:\Users\%username%\Downloads\
cls
echo             ============================================================
echo                   Treiber & Programm Installation by Fabian Seitz
echo                             ----> Thanks to @KaiSMR & Luis
echo                                     NUR fuer Windows 10
echo             ============================================================
echo.
echo            Bitte Geraet auswaehlen! (Internet Verbindung benoetigt!)
echo.
echo.
echo   [1]    Asus Z97-AR / PC
echo   [2]    Clevo W650SJ / Notebook
echo   [3]    Dell Precision T5500 / CAD PC
echo   [4]    Dell Precision M6500 / CAD Notebook
echo.
echo   [0]    EXIT / Abbruch
echo.
echo.

:Auswahl
set asw=0
set /p asw="Bitte Auswahl eingeben: "

if %asw%==1 goto :Z97-AR
if %asw%==2 goto :Clevo
if %asw%==3 goto :T5500
if %asw%==4 goto :M6500

if %asw%==0 exit
if %asw%==exit exit

echo Nächste Auswahl? Bitte eine Zahl von oben waehlen!
goto:Auswahl

:Z97-AR
start http://dlcdnet.asus.com/pub/ASUS/misc/utils/AISuite_III_V10149_for_Z97.rar
start http://dlcdnet.asus.com/pub/ASUS/misc/usb30/Asmedia_USB3_V116351.zip
start http://dlcdnet.asus.com/pub/ASUS/misc/utils/Turbo_LAN_Win7-8-81-10_V10700.zip
start http://dlgbit.winfuture.de/21d53ef186363366551a0c51f5c7363e/58f5f505/software/realtek/2.81/0008-64bit_Win7_Win8_Win81_Win10_R281.exe
start https://downloadcenter.intel.com/de/downloads/eula/26653/Intel-PROSet-Wireless-Software-und-Treiber-f-r-Windows-10?httpDown=https%3A%2F%2Fdownloadmirror.intel.com%2F26653%2Feng%2FWireless_19.50.1_PROSet64_Win10.exe
start https://downloadcenter.intel.com/de/downloads/eula/26667/Intel-Bluetooth-Wireless-Software-f-r-Windows-10?httpDown=https%3A%2F%2Fdownloadmirror.intel.com%2F26667%2Feng%2FBT_19.50.1_64_Win10.exe
echo 1. Treiber Installation. Warte auf Beendigung der Downloads, dann ...
pause
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\AISuite_III_V10149_for_Z97.rar -oC:\Users\%username%\Downloads\
7z x C:\Users\%username%\Downloads\Asmedia_USB3_V116351.zip -oC:\Users\%username%\Downloads\
7z x C:\Users\%username%\Downloads\Turbo_LAN_Win7-8-81-10_V10700.zip -oC:\Users\%username%\Downloads\
cd C:\Users\%username%\Downloads\
start *.exe
start C:\Users\%username%\Downloads\Asmedia_USB3_V116351\AsusSetup.exe
start C:\Users\%username%\Downloads\Turbo_LAN_Win7-8-81-10_V10700\Turbo_LAN_Win7-8-81-10_V10700\AsusSetup.exe
start C:\Users\%username%\Downloads\AISuite_III_V10149_for_Z97\AsusSetup.exe
echo Bitte Treiber installieren, anschließend ...
pause
del /q C:\Users\%username%\Downloads\*.exe
del /q C:\Users\%username%\Downloads\*.zip
start https://www.unifiedremote.com/download/windows
start https://update.pushbullet.com/pushbullet_installer.exe
start http://ubi.li/4vxt9
start http://www.dm.origin.com/download
start https://www.xdlab.ru/files/tagscan-6.0.20-setup.exe
start https://sourceforge.net/projects/album-art/files/latest/download
start https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe
start https://www.battle.net/download/getInstallerForGame?os=win&locale=deDE&version=LIVE&gameProgram=BATTLENET_APP
start https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi
start http://www.phoner.de/PhonerLiteSetup.exe
start http://www.evga.com/EVGA/GeneralDownloading.aspx?file=EVGA_PrecisionX_OC_Setup_v6.1.2.exe&survey=16.1.2
start https://download01.logi.com/web/ftp/pub/techsupport/gaming/LGS_8.91.48_x64_Logitech.exe
start https://ninite.com/notepadplusplus-putty/ninite.exe
echo 2. Anwendungsinstallation. Warte auf Beendigung der Downloads, dann ...
pause
Ren "C:\Users\%username%\Downloads\Ninite Notepad PuTTY Installer.exe" Ninite-Putty-Notepad.exe
start *.exe
start EpicGamesLauncherInstaller.msi
taskkill /IM MicrosoftEdge.exe
echo Installationen gestartet.
echo Dialog schließt sich in 5 Sekunden und loescht Installationsfiles.
ping -n 6 127.0.0.1 > nul
del /q C:\Users\%username%\Downloads\*.exe
del /q C:\Users\%username%\Downloads\*.msi
goto :exit

:Clevo
start https://d34vhvz8ul1ifj.cloudfront.net/Driver/VIA_HD_Audio_v11_1100f_Win10RS1_logo_11012016.zip
start https://downloadmirror.intel.com/24345/a08/Intel%20Driver%20Update%20Utility%20Installer.exe
start https://www.unifiedremote.com/download/windows
start https://update.pushbullet.com/pushbullet_installer.exe
start http://ubi.li/4vxt9
start http://www.dm.origin.com/download
start https://www.xdlab.ru/files/tagscan-6.0.20-setup.exe
start https://sourceforge.net/projects/album-art/files/latest/download
start https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe
echo Warte auf Beendigung des Downloads, dann ...
pause
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\VIA_HD_Audio_v11_1100f_Win10RS1_logo_11012016.zip -oC:\Users\%username%\Downloads\
cd C:\Users\%username%\Downloads\
start C:\Users\%username%\Downloads\v11_1100f_Win10RS1_logo_11012016\SETUP.EXE
start *.exe
taskkill /IM MicrosoftEdge.exe
echo Installationen gestartet.
echo Dialog schließt sich in 5 Sekunden und loescht Installationsfiles.
del /q C:\Users\%username%\Downloads\*.exe
ping -n 6 127.0.0.1 > nul
goto :exit

:M6500
start http://www.driverscape.com/files/DriverToolkitInstaller.exe
start https://www2.ati.com/drivers/firepro/mobile/dell-mobile-radeon-pro-software-enterprise-17.q1.1-apr3.exe
start https://downloads.dell.com/input/PREM6500_DRVR_WIN_R280879.EXE
start https://downloads.dell.com/FOLDER01694314M/2/Network_Driver_3MNPT_WN_15.10.0.10_A06.EXE
start https://downloadcenter.intel.com/de/downloads/eula/20775/Intel-Chipsatz-Ger-tesoftware-INF-Update-Utility-?httpDown=https%3A%2F%2Fdownloadmirror.intel.com%2F20775%2Feng%2FSetupChipset.exe
echo Warte auf Beendigung des Downloads, dann ...
pause
start *.exe
taskkill /IM MicrosoftEdge.exe
echo Installationen gestartet.
echo Dialog schließt sich in 5 Sekunden und loescht Installationsfiles.
del /q C:\Users\%username%\Downloads\*.exe
ping -n 6 127.0.0.1 > nul
goto :exit

:T5500
start http://www.nvidia.de/content/DriverDownload-March2009/confirmation.php?url=/Windows/Quadro_Certified/377.11/377.11-quadro-grid-desktop-notebook-win10-64bit-international-whql.exe&lang=de&type=Quadro
start http://download.msi.com/uti_exe/vga/MSIAfterburnerSetup.zip
echo Warte auf Beendigung des Downloads, dann ...
pause
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\MSIAfterburnerSetup.zip -oC:\Users\%username%\Downloads\
7z x C:\Users\%username%\Downloads\4.3.0\MSIAfterburnerSetup430.rar -oC:\Users\%username%\Downloads\
cd C:\Users\%username%\Downloads\
start *.exe
taskkill /IM MicrosoftEdge.exe
echo Installationen gestartet.
echo Dialog schließt sich in 5 Sekunden und loescht Installationsfiles.
del /q C:\Users\%username%\Downloads\*.exe
ping -n 6 127.0.0.1 > nul
goto :exit

:exit
msg * "Installationen abgeschlossen! Office muss ggf. noch installiert werden."
exit
