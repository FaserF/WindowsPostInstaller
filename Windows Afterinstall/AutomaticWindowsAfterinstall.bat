@echo off
title Windows Driver & Programm Installer by FaserF
color 89
:Default
REM *********Erstelle reg Eintrag zur Deaktivierung der Edge Speichern Aufforderung********
echo Windows Registry Editor Version 5.00 > "C:\Users\%username%\Downloads\EdgeAutoDownload.reg"
echo [HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Download] >> "C:\Users\%username%\Downloads\EdgeAutoDownload.reg"
echo "EnableSavePrompt"=dword:00000000 >> "C:\Users\%username%\Downloads\EdgeAutoDownload.reg"
REM *********Erstelle reg Eintrag um Google Chrome Standard Browser zu machen********
echo Set WshShell = WScript.CreateObject("WScript.Shell") > "C:\Users\%username%\Downloads\ChromeDefaultBrowser.vbs"
echo WshShell.Run "%%windir%%\system32\control.exe /name Microsoft.DefaultPrograms /page pageDefaultProgram\pageAdvancedSettings?pszAppName=google%%20chrome" >> "C:\Users\%username%\Downloads\ChromeDefaultBrowser.vbs"
echo WScript.Sleep 1200 >> "C:\Users\%username%\Downloads\ChromeDefaultBrowser.vbs"
echo WshShell.SendKeys "{TAB}" >> "C:\Users\%username%\Downloads\ChromeDefaultBrowser.vbs"
echo WshShell.SendKeys " " >> "C:\Users\%username%\Downloads\ChromeDefaultBrowser.vbs"
echo WshShell.SendKeys "{TAB}" >> "C:\Users\%username%\Downloads\ChromeDefaultBrowser.vbs"
echo WshShell.SendKeys "{TAB}" >> "C:\Users\%username%\Downloads\ChromeDefaultBrowser.vbs"
echo WshShell.SendKeys " " >> "C:\Users\%username%\Downloads\ChromeDefaultBrowser.vbs"
echo|set /p= "WScript.Quit" >> "C:\Users\%username%\Downloads\ChromeDefaultBrowser.vbs"
cd C:\Users\%username%\Downloads\
cls
echo             ============================================================
echo                                    Automatische
echo                   Treiber und Programm Installation by Fabian Seitz
echo                         ----> Thanks to @KaiSMR und Luis
echo             ============================================================
echo.
echo            Initialisiere Standard Installation
echo.
echo.
start C:\Users\%username%\Downloads\EdgeAutoDownload.reg
timeout /T 10
start /min https://ninite.com/7zip-chrome-steam/ninite.exe
timeout /T 10
REM *********Umbenennung da Leerzeichen im Namen********
Ren "C:\Users\%username%\Downloads\Ninite 7Zip Chrome Steam Installer.exe" Ninite-Chrome-7zip-Steam.exe
start Ninite-Chrome-7zip-Steam.exe
echo Warte auf Fertigstellung von Chrome Installation! Wichtig!, dann
timeout /T 60
REM *********Default Browser wird in Chrome geändert und anschließende Wartezeit von ca 6 Sekunden********
start C:\Users\%username%\Downloads\ChromeDefaultBrowser.vbs
timeout /T 6
taskkill /IM MicrosoftEdge.exe
start /min https://github.com/Edgarware/Threshold-Skin/archive/master.zip
start /min http://www.metroforsteam.com/downloads/4.2.4.zip
start /min http://de.download.nvidia.com/GFE/GFEClient/3.7.0.81/GeForce_Experience_v3.7.0.81.exe
start /min https://www.netzwelt.de/software-download/38551-driver-booster.html
start /min https://discordapp.com/api/download?platform=win
start /min https://app.prntscr.com/build/setup-lightshot.exe
start /min https://central.bitdefender.com/
echo Warte auf Beendigung der Downloads, dann ...
timeout /T 120
REM *********Starten der Driver Booster Installation, da driverbooster Version im Namen trägt********
dir /b C:\Users\%username%\Downloads\ | find "booster" > driverbstr.tmp
for /f %%f IN ('findstr booster driverbstr.tmp') do (
start C:\Users\%username%\Downloads\%%f /VERYSILENT /SUPPRESSMSGBOXES /NORESTART )
del driverbstr.tmp
REM *********Starten der NVIDIA Installation, da Geforce Version im Namen trägt********
dir /b C:\Users\%username%\Downloads\ | find "GeForce" > nvidiainstall.tmp
for /f %%f IN ('findstr GeForce nvidiainstall.tmp') do (
start C:\Users\%username%\Downloads\%%f /s )
del nvidiainstall.tmp
start DiscordSetup.exe /ANYSWITCH
start setup-lightshot.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
echo Driver Booster 4 Lizenz (läuft ab: 10.01.2018): 6BCA2-00A17-7B3E8-453B4 > "C:\Users\%username%\Downloads\DriverBoosterKey.txt"
start /min C:\Users\%username%\Downloads\DriverBoosterKey.txt
echo Installationen gestartet. Abschluss aller Installationen geschieht im Hintergrund, nun werden Installations Files gelöscht und Steam Skin wird installiert ...
REM *********Löschen aller Installationsfiles********
del /q C:\Users\%username%\Downloads\*.reg
del /q C:\Users\%username%\Downloads\*.vbs
del /q C:\Users\%username%\Downloads\thanks

cls
echo             ============================================================
echo                                Steam Skin auswaehlen
echo             ============================================================
echo.
echo              Hinweis: Skin muss anschließend in Steam Einstellungen ausgeaehlt werden!
echo.
echo   [1]    Threshold Skin [Windows 10 Style Theme]
echo   [2]    Metro for Steam Skin [Windows 8 Style Theme]
echo   [3]    keinen [Standard Steam Skin]
echo.

set asw=0
set /p asw="Bitte Auswahl eingeben: "

if %asw%==1 goto :Threshold
if %asw%==2 goto :Metro
if %asw%==3 goto :Start

:Threshold
REM *********Installation neuester Version des Steam Skins - muss nachträglich noch in Steam Einstellungen ausgewählt werden!********
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\Threshold-Skin-master.zip -oC:\Users\%username%\Downloads\
robocopy "C:\Users\%username%\Downloads\Threshold-Skin-master" "C:\Program Files (x86)\Steam\skins\Threshold" /MIR
xcopy /s /y "C:\Program Files (x86)\Steam\skins\Threshold\Customization\Sidebar Width\Collapsed Sidebar\resource" "C:\Program Files (x86)\Steam\skins\Threshold\resource"
rd /s /q C:\Users\%username%\Downloads\Threshold-Skin-master
goto :Start

:Metro
REM *********Installation des Steam Skins - muss nachträglich noch in Steam Einstellungen ausgewählt werden!********
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\4.2.4.zip -oC:\Users\%username%\Downloads\
robocopy "C:\Users\%username%\Downloads\Metro 4.2.4" "C:\Program Files (x86)\Steam\skins\Metro" /MIR
rd /s /q C:\Users\%username%\Downloads\Metro*
goto :Start

:Start
start https://www.mydealz.de/search?q=Bitdefender
del /q C:\Users\%username%\Downloads\*.zip
cd C:\Users\%username%\Downloads\
cls
echo             ============================================================
echo                           Hauptinstallation abgeschlossen!
echo                Du kannst ab hier beenden oder dein Geraet auswaehlen.
echo             ============================================================
echo.
echo            Bitte Geraet auswaehlen! (Internet Verbindung benoetigt!)
echo.
echo.
echo   [1]    Asus Z97-AR / PC
echo   [2]    Clevo W650SJ / Notebook
echo   [3]    Dell Precision T5500 / CAD PC
echo   [4]    Dell Precision M6500 / CAD Notebook
echo   [5]    Asus Maximus Ranger VIII / PC
echo.
echo   [0]    EXIT / Beenden
echo.
echo.

:Auswahl
set asw=0
set /p asw="Bitte Auswahl eingeben: "

if %asw%==1 goto :Z97-AR
if %asw%==2 goto :Clevo
if %asw%==3 goto :T5500
if %asw%==4 goto :M6500
if %asw%==5 goto :VIII

if %asw%==0 goto :exit
if %asw%==exit goto :exit

echo Nächste Auswahl? Bitte eine Zahl von oben waehlen!
goto:Auswahl

:Z97-AR
start http://dlcdnet.asus.com/pub/ASUS/misc/utils/AISuite_III_V10149_for_Z97.rar
start http://dlcdnet.asus.com/pub/ASUS/misc/usb30/Asmedia_USB3_V116351.zip
start http://dlcdnet.asus.com/pub/ASUS/misc/utils/Turbo_LAN_Win7-8-81-10_V10700.zip
start http://dlgbit.winfuture.de/21d53ef186363366551a0c51f5c7363e/58f5f505/software/realtek/2.81/0008-64bit_Win7_Win8_Win81_Win10_R281.exe
start http://www.intel.de/content/www/de/de/support/network-and-i-o/wireless-networking/intel-wireless-products/intel-wireless-7200-series/intel-dual-band-wireless-ac-7260.html
start http://pcsupport.lenovo.com/de/de/products/monitors-and-projectors/lcd-monitors/lenovo-y27g-monitor/downloads
echo 1. Treiber Installation. Warte auf Beendigung der Downloads, dann ...
pause
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\AISuite_III_V10149_for_Z97.rar -oC:\Users\%username%\Downloads\AISuite_III_V10149_for_Z97\
7z x C:\Users\%username%\Downloads\Asmedia_USB3_V116351.zip -oC:\Users\%username%\Downloads\Asmedia_USB3_V116351\
7z x C:\Users\%username%\Downloads\Turbo_LAN_Win7-8-81-10_V10700.zip -oC:\Users\%username%\Downloads\Turbo_LAN_Win7-8-81-10_V10700\
cd C:\Users\%username%\Downloads\
start *.exe
start C:\Users\%username%\Downloads\Asmedia_USB3_V116351\AsusSetup.exe
start C:\Users\%username%\Downloads\Turbo_LAN_Win7-8-81-10_V10700\Turbo_LAN_Win7-8-81-10_V10700\AsusSetup.exe
start C:\Users\%username%\Downloads\AISuite_III_V10149_for_Z97\AsusSetup.exe
echo Bitte Treiber installieren, anschließend ...
pause
del /q C:\Users\%username%\Downloads\*.exe
del /q C:\Users\%username%\Downloads\*.zip
del /q C:\Users\%username%\Downloads\*.rar
start https://www.unifiedremote.com/download/windows
start https://update.pushbullet.com/pushbullet_installer.exe
start http://ubi.li/4vxt9
start http://www.dm.origin.com/download
start https://www.xdlab.ru/files/tagscan-6.0.22-setup.exe
start https://sourceforge.net/projects/album-art/files/latest/download
start https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe
start https://www.battle.net/download/getInstallerForGame?os=win&locale=deDE&version=LIVE&gameProgram=BATTLENET_APP
start https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi
start http://www.phoner.de/PhonerLiteSetup.exe
start https://de.evga.com/precisionxoc/#download
start https://download01.logi.com/web/ftp/pub/techsupport/gaming/LGS_8.91.48_x64_Logitech.exe
start https://ninite.com/notepadplusplus-putty/ninite.exe
start https://chrome.google.com/webstore/detail/material-dark-mkbhd/iiplegjeipnjdpgkeccfccnahofbckad
echo 2. Anwendungsinstallation. Warte auf Beendigung der Downloads, dann ...
pause
Ren "C:\Users\%username%\Downloads\Ninite Notepad PuTTY Installer.exe" Ninite-Putty-Notepad.exe
REM UplayInstaller.exe /S
REM OriginThinSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
REM tagscan-6.0.22-setup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
REM WhatsAppSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
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

:VIII
start http://dlcdnet.asus.com/pub/ASUS/misc/utils/AISuite3_Win7-81-10_MaxVIII_Series_V10130.zip
start http://dlcdnet.asus.com/pub/ASUS/misc/usb30/Asmedia_USB3_V116351.zip
echo 1. Treiber Installation. Warte auf Beendigung der Downloads, dann ...
pause
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\AISuite3_Win7-81-10_MaxVIII_Series_V10130.zip -oC:\Users\%username%\Downloads\AISuite3_Win7-81-10_MaxVIII_Series_V10130\
7z x C:\Users\%username%\Downloads\Asmedia_USB3_V116351.zip -oC:\Users\%username%\Downloads\Asmedia_USB3_V116351\
cd C:\Users\%username%\Downloads\
start *.exe
start C:\Users\%username%\Downloads\Asmedia_USB3_V116351\AsusSetup.exe
start C:\Users\%username%\Downloads\AISuite3_Win7-81-10_MaxVIII_Series_V10130\AsusSetup.exe
echo Bitte Treiber installieren, anschließend ...
pause
del /q C:\Users\%username%\Downloads\*.exe
del /q C:\Users\%username%\Downloads\*.zip
del /q C:\Users\%username%\Downloads\*.rar
start https://www.unifiedremote.com/download/windows
start https://update.pushbullet.com/pushbullet_installer.exe
start http://ubi.li/4vxt9
start http://www.dm.origin.com/download
start https://www.xdlab.ru/files/tagscan-6.0.20-setup.exe
start https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe
start https://download01.logi.com/web/ftp/pub/techsupport/gaming/LGS_8.92.67_x86_Logitech.exe
start https://ninite.com/notepadplusplus-putty/ninite.exe
echo 2. Anwendungsinstallation. Warte auf Beendigung der Downloads, dann ...
pause
Ren "C:\Users\%username%\Downloads\Ninite Notepad PuTTY Installer.exe" Ninite-Putty-Notepad.exe
start *.exe
taskkill /IM MicrosoftEdge.exe
echo Installationen gestartet.
echo Dialog schließt sich in 5 Sekunden und loescht Installationsfiles.
ping -n 6 127.0.0.1 > nul
del /q C:\Users\%username%\Downloads\*.exe
del /q C:\Users\%username%\Downloads\*.msi
goto :exit


:exit
del /q C:\Users\%username%\Downloads\*.exe
start https://discordler.github.io
msg * "Installationen abgeschlossen! MS Office muss ggf. noch installiert werden. Steam Skin muss in Steam Einstellungen noch ausgewaehlt werden."
exit
