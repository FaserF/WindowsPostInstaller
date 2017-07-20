@echo off
title Automatic Windows Post Installer by FaserF - V3.2.3
color 89

:Default
md C:\Users\%username%\Downloads\CustomInstall\
echo                           Windows Post Installer - LOG > WPI_Log.txt
echo             ============================================================ >> WPI_Log.txt
echo %TIME% Programm ist gestartet >> WPI_Log.txt
echo             Probleme? https://github.com/FaserF/FaserFQuickTools/issues >> WPI_Log.txt
echo ######################################################################## >> WPI_Log.txt
REM *********Erstelle reg Eintrag zur Deaktivierung der Edge Speichern Aufforderung********
echo Windows Registry Editor Version 5.00 > "C:\Users\%username%\Downloads\CustomInstall\EdgeAutoDownload.reg"
echo [HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Download] >> "C:\Users\%username%\Downloads\CustomInstall\EdgeAutoDownload.reg"
echo "EnableSavePrompt"=dword:00000000 >> "C:\Users\%username%\Downloads\CustomInstall\EdgeAutoDownload.reg"
REM *********Erstelle reg Eintrag um Google Chrome Standard Browser zu machen********
echo Set WshShell = WScript.CreateObject("WScript.Shell") > "C:\Users\%username%\Downloads\CustomInstall\ChromeDefaultBrowser.vbs"
echo WshShell.Run "%%windir%%\system32\control.exe /name Microsoft.DefaultPrograms /page pageDefaultProgram\pageAdvancedSettings?pszAppName=google%%20chrome" >> "C:\Users\%username%\Downloads\CustomInstall\ChromeDefaultBrowser.vbs"
echo WScript.Sleep 1200 >> "C:\Users\%username%\Downloads\CustomInstall\ChromeDefaultBrowser.vbs"
echo WshShell.SendKeys "{TAB}" >> "C:\Users\%username%\Downloads\CustomInstall\ChromeDefaultBrowser.vbs"
echo WshShell.SendKeys " " >> "C:\Users\%username%\Downloads\CustomInstall\ChromeDefaultBrowser.vbs"
echo WshShell.SendKeys "{TAB}" >> "C:\Users\%username%\Downloads\CustomInstall\ChromeDefaultBrowser.vbs"
echo WshShell.SendKeys "{TAB}" >> "C:\Users\%username%\Downloads\CustomInstall\ChromeDefaultBrowser.vbs"
echo WshShell.SendKeys " " >> "C:\Users\%username%\Downloads\CustomInstall\ChromeDefaultBrowser.vbs"
echo|set /p= "WScript.Quit" >> "C:\Users\%username%\Downloads\CustomInstall\ChromeDefaultBrowser.vbs"
REM *********Erstelle Script Datei um ENTER als Eingabe zu verschicken***********
echo >C:\Users\%username%\Downloads\CustomInstall\Enter.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "{ENTER}"
REM *********Erstelle Script zum Windows Update starten*********
echo Set automaticUpdates = CreateObject("Microsoft.Update.AutoUpdate") > "C:\Users\%username%\Downloads\CustomInstall\WinUpdate.vbs"
echo automaticUpdates.DetectNow() >> "C:\Users\%username%\Downloads\CustomInstall\WinUpdate.vbs"
REM ********Lese Modellnummer aus, um richtige Programme & Treiber zuzuordnen*********
for /f "tokens=2 delims==" %%I in ('wmic computersystem get model /format:list') do set "SYSMODEL=%%I"
cd C:\Users\%username%\Downloads\
cls
echo             ============================================================
echo                                    Automatische
echo                   Treiber und Programm Installation by Fabian Seitz
echo                             Thanks to @KaiSMR und @Bilalui
echo             ============================================================
echo.
echo            Initialisiere Standard Installation
echo            WICHTIG: NICHTS TIPPEN/ANKLICKEN, nur bei Aufforderung! Ansonsten Abbruch der Automatik.
echo.
echo.
echo           SYSTEM MODELL: %SYSMODEL%
start C:\Users\%username%\Downloads\CustomInstall\EdgeAutoDownload.reg
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs

start C:\Users\%username%\Downloads\CustomInstall\WinUpdate.vbs
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs

start /min https://ninite.com/7zip-chrome-steam/ninite.exe
timeout /T 10
REM *********Umbenennung da Leerzeichen im Namen********
Ren "C:\Users\%username%\Downloads\Ninite 7Zip Chrome Steam Installer.exe" Ninite-Chrome-7zip-Steam.exe
start Ninite-Chrome-7zip-Steam.exe
echo Warte auf Fertigstellung von Chrome Installation! Wichtig!, dann
timeout /T 60
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
REM *********Default Browser wird in Chrome geändert und anschließende Wartezeit von ca 4 Sekunden********
start C:\Users\%username%\Downloads\CustomInstall\ChromeDefaultBrowser.vbs
timeout /T 4
taskkill /IM MicrosoftEdge.exe
slmgr.vbs /ato
start /min https://github.com/Edgarware/Threshold-Skin/archive/master.zip
start /min http://www.metroforsteam.com/downloads/4.2.4.zip
start /min http://www.filehorse.com/download-nvidia-geforce-experience/download/
start /min http://www.filehorse.com/download-driver-booster-free/download/
start /min https://discordapp.com/api/download?platform=win
start /min https://app.prntscr.com/build/setup-lightshot.exe
start /min https://github.com/FaserF/FaserFQuickTools/releases/download/1.0/RenamePC.vbs
echo Warte auf Beendigung der Downloads, dann ...
REM ****Überprüfe ob User Steam Skin bereits geaehlt hat******
if not Exist "Skin.txt" (
echo %TIME% Skin.txt nicht gefunden >> WPI_Log.txt
echo             Erstelle vor Start eine Skin.txt mit Inhalt des gewuenschten Steam Skins [Auswahl: Threshold , Metro , skip] >> WPI_Log.txt
echo ######################################################################## >> WPI_Log.txt
start /min WPI_Log.txt


timeout /T 120
taskkill /IM Chrome.exe /F
move C:\Users\%username%\Downloads\RenamePC.vbs C:\Users\%username%\Downloads\CustomInstall\RenamePC.vbs
REM *********Starten der Driver Booster Installation, da driverbooster Version im Namen trägt********
dir /b C:\Users\%username%\Downloads\ | find "booster" > driverbstr.tmp
for /f %%d IN ('findstr booster driverbstr.tmp') do (
start C:\Users\%username%\Downloads\%%d /VERYSILENT /SUPPRESSMSGBOXES /NORESTART )
del driverbstr.tmp
REM *********Starten der NVIDIA Installation, da Geforce Version im Namen trägt********
dir /b C:\Users\%username%\Downloads\ | find "GeForce" > nvidiainstall.tmp
for /f %%f IN ('findstr GeForce nvidiainstall.tmp') do (
start C:\Users\%username%\Downloads\%%f /s )
del nvidiainstall.tmp
start DiscordSetup.exe /ANYSWITCH
start setup-lightshot.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
echo Driver Booster 4 Lizenz (läuft ab: 10.01.2018): 6BCA2-00A17-7B3E8-453B4 > "C:\Users\%username%\Downloads\DriverBoosterKey.txt"
echo Alternative Driver Booster 4 Lizenz (läuft ab: 18.01.2018): 61B05-C956B-195E0-214B4 >> "C:\Users\%username%\Downloads\DriverBoosterKey.txt"
start /min C:\Users\%username%\Downloads\DriverBoosterKey.txt
echo Installationen gestartet. Abschluss aller Installationen geschieht im Hintergrund, nun werden Installations Files gelöscht und Steam Skin wird installiert ...

:AutoSteamSkin
echo.
echo Lese Skin.txt aus, falls vorhanden.
echo.
SET /p Skin=<Skin.txt

if "%Skin%"=="Threshold" goto :Skin1
if "%Skin%"=="Metro" goto :Skin2
if "%Skin%"=="skip" goto :Skin3
if "%Skin%"=="kein" goto :Skin3
goto :SteamSkin

:SteamSkin
cls
echo             ============================================================
echo                               Manuelle Steam Skin Auswahl
echo                                da Skin.txt nicht gefunden
echo             ============================================================
echo.
echo              Hinweis: Skin muss anschließend in Steam Einstellungen ausgeaehlt werden!
echo.
echo   [1]    Threshold Skin [Windows 10 Style Theme]
echo   [2]    Metro for Steam Skin [Windows 8 Style Theme]
echo   [3]    keinen [Standard Steam Skin]
echo.

:: Choices are 1,2 and 3, default choice is 4, timeout = 1 minute
choice /c 1234 /d 4 /t 30
goto Skin%errorlevel%

:Skin1
REM ****THRESHOLD*****Installation neuester Version des Steam Skins - muss nachträglich noch in Steam Einstellungen ausgewählt werden!********
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\Threshold-Skin-master.zip -oC:\Users\%username%\Downloads\
robocopy "C:\Users\%username%\Downloads\Threshold-Skin-master" "C:\Program Files (x86)\Steam\skins\Threshold" /MIR
xcopy /s /y "C:\Program Files (x86)\Steam\skins\Threshold\Customization\Sidebar Width\Collapsed Sidebar\resource" "C:\Program Files (x86)\Steam\skins\Threshold\resource"
rd /s /q C:\Users\%username%\Downloads\Threshold-Skin-master
goto :Start

:Skin2
REM *****METRO****Installation des Steam Skins - muss nachträglich noch in Steam Einstellungen ausgewählt werden!********
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\4.2.4.zip -oC:\Users\%username%\Downloads\
robocopy "C:\Users\%username%\Downloads\Metro 4.2.4" "C:\Program Files (x86)\Steam\skins\Metro" /MIR
rd /s /q C:\Users\%username%\Downloads\Metro*
goto :Start

:Skin3
REM *******Kein Skin wurde ausgewaehlt********
goto :Start
:Skin4
REM *******Dummy - dient lediglich der Weiterleitung
echo.
echo Du warst wohl abwesend. Ich habe in der Zeit den Installationsprozess fortgesetzt und keinen Steam Skin installiert.
echo.
echo %TIME% Steam Skin Installation uebersprungen Aufgrund von Abwesenheit [Timeout]. >> WPI_Log.txt
echo ########### >> WPI_Log.txt
goto :Start

:Start
echo >C:\Users\%username%\Downloads\CustomInstall\Left.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "{LEFT}"
echo >C:\Users\%username%\Downloads\CustomInstall\Tab.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "{TAB}"
echo >C:\Users\%username%\Downloads\CustomInstall\Space.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys " "
echo >C:\Users\%username%\Downloads\CustomInstall\AltF4.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%{f4}"
del /q C:\Users\%username%\Downloads\*.zip
cd C:\Users\%username%\Downloads\
goto :Ermittelung

:Ermittelung
if "%SYSMODEL%"=="All Series" goto :Z97-AR | echo %TIME% %SYSMODEL% wurde automatisch ermittelt - Ueberspringe Geraeteauswahl >> WPI_Log.txt | echo ######################################################################## >> WPI_Log.txt
if "%SYSMODEL%"=="W65_67SJ" goto :Clevo | echo %TIME% %SYSMODEL% wurde automatisch ermittelt - Ueberspringe Geraeteauswahl >> WPI_Log.txt | echo ######################################################################## >> WPI_Log.txt
if "%SYSMODEL%"=="Precision T5500" goto :T5500 | echo %TIME% %SYSMODEL% wurde automatisch ermittelt - Ueberspringe Geraeteauswahl >> WPI_Log.txt | echo ######################################################################## >> WPI_Log.txt
if "%SYSMODEL%"=="Precision M6500" goto :M6500 | echo %TIME% %SYSMODEL% wurde automatisch ermittelt - Ueberspringe Geraeteauswahl >> WPI_Log.txt | echo ######################################################################## >> WPI_Log.txt
if "%SYSMODEL%"=="System Product Name" goto :VIII | echo %TIME% %SYSMODEL% wurde automatisch ermittelt - Ueberspringe Geraeteauswahl >> WPI_Log.txt | echo ######################################################################## >> WPI_Log.txt
if "%SYSMODEL%"=="Latitude 7480" goto :RenamePC | | echo %TIME% TESTGERAET wurde automatisch ermittelt - Ueberspringe Geraeteauswahl >> WPI_Log.txt | echo ######################################################################## >> WPI_Log.txt
goto :Auswahl

:Auswahl
cls
echo             ========================================================================
echo                               Hauptinstallation abgeschlossen!
echo              Dein Geraet wurde leider nicht in der unterstuetzten Liste gefunden!
echo                     Du kannst ab hier beenden oder ein Geraet auswaehlen.
echo             ========================================================================
echo.
echo            Dein Geraet lautet: %SYSMODEL%
echo.
echo.
echo   [1]    Asus Z97-AR / PC
echo   [2]    Clevo W65_67SJ / Notebook
echo   [3]    Dell Precision T5500 / CAD PC
echo   [4]    Dell Precision M6500 / CAD Notebook
echo   [5]    Asus Maximus Ranger VIII / PC
echo.
echo   [0]    EXIT / Beenden
echo.
echo.

set asw=0
set /p asw="Bitte Auswahl eingeben: "

if %asw%==1 goto :Z97-AR
if %asw%==2 goto :Clevo
if %asw%==3 goto :T5500
if %asw%==4 goto :M6500
if %asw%==5 goto :VIII

if %asw%==0 goto :RenamePC
if %asw%==exit goto :RenamePC

echo Nächste Auswahl? Bitte eine Zahl von oben waehlen!
goto:Auswahl

:Z97-AR
echo ASUS Z97-AR wurde ermittelt oder ausgewaehlt!
echo.
net use z: \\192.168.178.21\public\share /user:FSeitz
net use y: \\192.168.178.21\homes\FSeitz /user:FSeitz
start http://dlcdnet.asus.com/pub/ASUS/misc/utils/AISuite_III_V10149_for_Z97.rar
start http://dlcdnet.asus.com/pub/ASUS/misc/usb30/Asmedia_USB3_V116351.zip
start http://dlcdnet.asus.com/pub/ASUS/misc/utils/Turbo_LAN_Win7-8-81-10_V10700.zip
start http://dlgbit.winfuture.de/21d53ef186363366551a0c51f5c7363e/58f5f505/software/realtek/2.81/0008-64bit_Win7_Win8_Win81_Win10_R281.exe
start http://www.intel.de/content/www/de/de/support/network-and-i-o/wireless-networking/intel-wireless-products/intel-wireless-7200-series/intel-dual-band-wireless-ac-7260.html
start http://download.lenovo.com/consumer/monitor/lenovo_artery_setup.exe
echo 1. Treiber Installation. Warte auf Beendigung der Downloads, dann ...
timeout /T 120
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\AISuite_III_V10149_for_Z97.rar -oC:\Users\%username%\Downloads\AISuite_III_V10149_for_Z97\
7z x C:\Users\%username%\Downloads\Asmedia_USB3_V116351.zip -oC:\Users\%username%\Downloads\Asmedia_USB3_V116351\
7z x C:\Users\%username%\Downloads\Turbo_LAN_Win7-8-81-10_V10700.zip -oC:\Users\%username%\Downloads\Turbo_LAN_Win7-8-81-10_V10700\
cd C:\Users\%username%\Downloads\
start *.exe
start /wait C:\Users\%username%\Downloads\Asmedia_USB3_V116351\AsusSetup.exe
start /wait C:\Users\%username%\Downloads\Turbo_LAN_Win7-8-81-10_V10700\Turbo_LAN_Win7-8-81-10_V10700\AsusSetup.exe
start /wait C:\Users\%username%\Downloads\AISuite_III_V10149_for_Z97\AsusSetup.exe
start /wait C:\Users\%username%\Downloads\lenovo_artery_setup.exe
echo Bitte Treiber installieren, anschließend ...
timeout /T 40
del /q C:\Users\%username%\Downloads\*.exe
del /q C:\Users\%username%\Downloads\*.zip
del /q C:\Users\%username%\Downloads\*.rar
start https://www.unifiedremote.com/download/windows
start https://update.pushbullet.com/pushbullet_installer.exe
start http://ubi.li/4vxt9
start http://www.dm.origin.com/download
start https://www.xdlab.ru/files/tagscan-6.0.22-setup.exe
start https://downloads.sourceforge.net/project/album-art/album-art-xui/AlbumArtDownloaderXUI-1.02.exe?r=&ts=1500286400&use_mirror=netcologne
start https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe
start https://www.battle.net/download/getInstallerForGame?os=win&locale=deDE&version=LIVE&gameProgram=BATTLENET_APP
start https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi
start http://www.phoner.de/PhonerLiteSetup.exe
start https://download01.logi.com/web/ftp/pub/techsupport/gaming/LGS_8.91.48_x64_Logitech.exe
start https://ninite.com/notepadplusplus/ninite.exe
echo 2. Anwendungsinstallation. Warte auf Beendigung der Downloads, dann ...
timeout /T 120

start C:\Users\%username%\Downloads\UplayInstaller.exe /S
start C:\Users\%username%\Downloads\OriginThinSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
start C:\Users\%username%\Downloads\tagscan-6.0.22-setup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
start C:\Users\%username%\Downloads\WhatsAppSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
REM *****Starte Unified Remote Automatische Installation*******
dir /b C:\Users\%username%\Downloads\ | find "ServerSetup" > UnifiedRemote.tmp
for /f %%u IN ('findstr ServerSetup UnifiedRemote.tmp') do (
start C:\Users\%username%\Downloads\%%u )
del UnifiedRemote.tmp
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Tab.vbs
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 13
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 3
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
REM *******Starte Pushbullet Automatische Installation******
start C:\Users\%username%\Downloads\pushbullet_installer.exe
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 2
start C:\Users\%username%\Downloads\CustomInstall\Space.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
REM *****Starte AlbumArt Automatische Installation*******
start C:\Users\%username%\Downloads\AlbumArtDownloaderXUI-1.02.exe
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 2
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
REM *****Starte Phoner Lite Installation*******
start C:\Users\%username%\Downloads\PhonerLiteSetup.exe
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Space.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 3
start C:\Users\%username%\Downloads\CustomInstall\Space.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
REM *****Starte Epic Games Installation*******
dir /b C:\Users\%username%\Downloads\ | find "EpicGamesLauncherInstaller" > EpicGamesLauncherInstaller.tmp
for /f %%e IN ('findstr EpicGamesLauncherInstaller EpicGamesLauncherInstaller.tmp') do (
start C:\Users\%username%\Downloads\%%e )
del EpicGamesLauncherInstaller.tmp

start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 15
REM *****Starte Logitech Automatische Installation*******
dir /b C:\Users\%username%\Downloads\ | find "Logitech" > Logitech.tmp
for /f %%l IN ('findstr Logitech Logitech.tmp') do (
start C:\Users\%username%\Downloads\%%l )
del Logitech.tmp
timeout /T 10
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 60
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Tab.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\AltF4.vbs

Ren "C:\Users\%username%\Downloads\Ninite Notepad Installer.exe" Ninite-Notepad.exe
start C:\Users\%username%\Downloads\Ninite-Notepad.exe

REM *****Starte Battlenet Installation*******
start C:\Users\%username%\Downloads\Battle.net_Setup.exe
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 30

taskkill /IM Chrome.exe /F
echo Dialog schließt sich in wenigen Sekunden und loescht Installationsfiles.
start https://de.evga.com/precisionxoc/#download
goto :RenamePC

:Clevo
echo Clevo W65_67SJ Notebook wurde ermittelt oder ausgewaehlt!
echo.
net use z: \\192.168.178.21\public\share /user:FSeitz
net use y: \\192.168.178.21\homes\FSeitz /user:FSeitz
start https://d34vhvz8ul1ifj.cloudfront.net/Driver/VIA_HD_Audio_v11_1100f_Win10RS1_logo_11012016.zip
start https://www.unifiedremote.com/download/windows
start https://update.pushbullet.com/pushbullet_installer.exe
start http://ubi.li/4vxt9
start http://www.dm.origin.com/download
start https://www.xdlab.ru/files/tagscan-6.0.20-setup.exe
start https://downloads.sourceforge.net/project/album-art/album-art-xui/AlbumArtDownloaderXUI-1.02.exe?r=&ts=1500286400&use_mirror=netcologne
start https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe
echo Warte auf Beendigung des Downloads, dann ...
timeout /T 120
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\VIA_HD_Audio_v11_1100f_Win10RS1_logo_11012016.zip -oC:\Users\%username%\Downloads\
cd C:\Users\%username%\Downloads\
start C:\Users\%username%\Downloads\UplayInstaller.exe /S
start C:\Users\%username%\Downloads\OriginThinSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
start C:\Users\%username%\Downloads\tagscan-6.0.22-setup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
start C:\Users\%username%\Downloads\WhatsAppSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
REM *****Starte Unified Remote Automatische Installation*******
dir /b C:\Users\%username%\Downloads\ | find "ServerSetup" > UnifiedRemote.tmp
for /f %%u IN ('findstr ServerSetup UnifiedRemote.tmp') do (
start C:\Users\%username%\Downloads\%%u )
del UnifiedRemote.tmp
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Tab.vbs
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 13
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 3
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
REM *******Starte Pushbullet Automatische Installation******
start C:\Users\%username%\Downloads\pushbullet_installer.exe
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 2
start C:\Users\%username%\Downloads\CustomInstall\Space.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
REM *****Starte AlbumArt Automatische Installation*******
start C:\Users\%username%\Downloads\AlbumArtDownloaderXUI-1.02.exe
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 2
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs

start C:\Users\%username%\Downloads\v11_1100f_Win10RS1_logo_11012016\SETUP.EXE
taskkill /IM Chrome.exe /F
echo Dialog schließt sich in wenigen Sekunden und loescht Installationsfiles.
goto :RenamePC

:M6500
echo Dell Precision M6500 wurde ermittelt oder ausgewaehlt!
echo.
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
timeout /T 5
goto :RenamePC

:T5500
echo Dell Precision T5500 wurde ermittelt oder ausgewaehlt!
echo.
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
timeout /T 5
goto :RenamePC

:VIII
echo ASUS Maximus Ranger VIII wurde ermittelt oder ausgewaehlt!
echo.
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
timeout /T 5
del /q C:\Users\%username%\Downloads\*.msi
goto :RenamePC

:RenamePC
del /q C:\Users\%username%\Downloads\*.exe
del /q C:\Users\%username%\Downloads\*.msi
del /q C:\Users\%username%\Downloads\Skin.txt
set NEWPCNAME=""
set /p NEWPCNAME="Bitte neuen Computernamen eingeben: (Frei lassen um Namen zu behalten)"
if [%NEWPCNAME%]=[] goto :Exit | echo %TIME% PC Name nicht geändert. >> WPI_Log.txt | echo ######################################################################## >> WPI_Log.txt
if [%NEWPCNAME%]=[ ] goto :Exit | echo %TIME% PC Name nicht geändert. >> WPI_Log.txt | echo ######################################################################## >> WPI_Log.txt

start C:\Users\%username%\Downloads\CustomInstall\RenamePC.vbs %NEWPCNAME%
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1
goto :Exit

:Exit
rd /s /q C:\Users\%username%\Downloads\CustomInstall\
start https://discordler.github.io
start https://central.bitdefender.com/
start https://www.mydealz.de/search?q=Bitdefender
echo %TIME% Installation abgeschlossen. >> WPI_Log.txt
echo ######################################################################## >> WPI_Log.txt
msg * "Installationen abgeschlossen! MS Office muss ggf. noch installiert werden. Steam Skin muss in Steam Einstellungen noch ausgewaehlt werden."
exit
