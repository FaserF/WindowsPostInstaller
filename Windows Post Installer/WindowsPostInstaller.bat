@echo off
set WPIVersion=3.7.4
set datum=23.12.2017
set Description=Automatic Windows Post Installer (Software, Driver, ...) for a fresh Windows Installation.
title Automatic Windows Post Installer by FaserF - V%WPIVersion% - Datum: %datum%

:Default
echo %Description%
REM TASKLIST | FINDSTR /I "Windows Post Installer"
REM if "%ERRORLEVEL%"=="0" msg * "WPI laeuft bereits. Programm wird beendet."
REM if "%ERRORLEVEL%"=="0" exit
ping www.google.de -n 1 > nul
if errorlevel 1 (set internet=Nicht mit dem Internet verbunden) else (set internet=Internet Verbindung aufgebaut)
if "%internet%" == "Nicht mit dem Internet verbunden" goto :NoInternet
echo Programm wirklich starten?
pause
cd C:\Users\%username%\Downloads\
rd /s /q C:\Users\%username%\Downloads\CustomInstall\
md C:\Users\%username%\Downloads\CustomInstall\
echo                           Windows Post Installer - LOG > C:\Users\%username%\Desktop\WPI_Log.txt
echo             ============================================================ >> C:\Users\%username%\Desktop\WPI_Log.txt
echo %TIME% Programm ist gestartet >> C:\Users\%username%\Desktop\WPI_Log.txt
echo             Probleme? https://github.com/FaserF/FaserFQuickTools/issues >> C:\Users\%username%\Desktop\WPI_Log.txt
echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
REM *********Erstelle reg Eintrag zur Deaktivierung der Edge Speichern Aufforderung********
echo Windows Registry Editor Version 5.00 > "C:\Users\%username%\Downloads\CustomInstall\EdgeAutoDownload.reg"
echo [HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Download] >> "C:\Users\%username%\Downloads\CustomInstall\EdgeAutoDownload.reg"
echo "EnableSavePrompt"=dword:00000000 >> "C:\Users\%username%\Downloads\CustomInstall\EdgeAutoDownload.reg"
REM *********Erstelle reg Eintrag zur Deaktivierung von Installationen der Windows SPAM Apps ********
echo Windows Registry Editor Version 5.00 > "C:\Users\%username%\Downloads\CustomInstall\DisableAutoDownloadApps.reg"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent] >> "C:\Users\%username%\Downloads\CustomInstall\DisableAutoDownloadApps.reg"
echo "DisableWindowsConsumerFeatures"=dword:00000001 >> "C:\Users\%username%\Downloads\CustomInstall\DisableAutoDownloadApps.reg"
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
REM *********Erstelle Script Datei um Tasten als Eingabe zu verschicken***********
echo >C:\Users\%username%\Downloads\CustomInstall\Enter.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "{ENTER}"
echo >C:\Users\%username%\Downloads\CustomInstall\Left.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "{LEFT}"
echo >C:\Users\%username%\Downloads\CustomInstall\Tab.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "{TAB}"
echo >C:\Users\%username%\Downloads\CustomInstall\Space.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys " "
echo >C:\Users\%username%\Downloads\CustomInstall\AltF4.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%{f4}"
REM *********Erstelle Script zum Windows Update starten*********
echo Set automaticUpdates = CreateObject("Microsoft.Update.AutoUpdate") > "C:\Users\%username%\Downloads\CustomInstall\WinUpdate.vbs"
echo automaticUpdates.DetectNow() >> "C:\Users\%username%\Downloads\CustomInstall\WinUpdate.vbs"
REM ********Lese Modellnummer aus, um richtige Programme & Treiber zuzuordnen*********
for /f "tokens=2 delims==" %%I in ('wmic computersystem get model /format:list') do set "SYSMODEL=%%I"
REM ********Erkenne Windows Version*********
set WindowsVersion=Windows Version unbekannt
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "6.3" set WindowsVersion=Windows 8
if "%version%" == "6.1" set WindowsVersion=Windows 7
if "%version%" == "10.0" set WindowsVersion=Windows 10
echo %TIME%  %WindowsVersion% wurde automatisch ermittelt >> C:\Users\%username%\Desktop\WPI_Log.txt 
if "%WindowsVersion%" == "Windows 7" echo Treiber Support wird unter Windows 7 nicht Garantiert. >> C:\Users\%username%\Desktop\WPI_Log.txt
if "%WindowsVersion%" == "Windows Version unbekannt" echo Installierte Windows Version konnte nicht erkannt werden. Treiber Support wird nicht Garantiert. >> C:\Users\%username%\Desktop\WPI_Log.txt
echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
cls
echo             ============================================================
echo                                    Automatische
echo                   Treiber und Programm Installation by Fabian Seitz
echo                             Thanks to @KaiSMR und @Bilalui
echo             ============================================================
echo.
echo.
echo            Initialisiere Standard Installation
echo            WICHTIG: NICHTS TIPPEN/ANKLICKEN, nur bei Aufforderung! Ansonsten evtl Abbruch der Automatik.
echo.
echo.
echo           %internet%
echo           SYSTEM MODELL: %SYSMODEL%
echo           %WindowsVersion% laeuft auf diesem Geraet!
start C:\Users\%username%\Downloads\CustomInstall\EdgeAutoDownload.reg
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs

start C:\Users\%username%\Downloads\CustomInstall\WinUpdate.vbs
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs

echo %TIME% %SYSMODEL% wurde automatisch ermittelt - Starte Downloads >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt

start /min https://ninite.com/7zip-chrome-steam/ninite.exe
start /min https://github.com/FaserF/FaserFQuickTools/releases/download/1.0/WPI.zip
timeout /T 25 > NUL:

REM *********Umbenennung da Leerzeichen im Namen********
Ren "C:\Users\%username%\Downloads\Ninite 7Zip Chrome Steam Installer.exe" Ninite-Chrome-7zip-Steam.exe
start Ninite-Chrome-7zip-Steam.exe
echo Warte auf Fertigstellung von Chrome Installation! Wichtig!, dann
timeout /T 120
echo            Suche nach Updates
echo.
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\WPI.zip -oC:\Users\%username%\Downloads\CustomInstall\ > NUL:
cd C:\Users\%username%\Downloads\
SET /p LatestVersion=<C:\Users\%username%\Downloads\CustomInstall\LatestVersion.txt
if %WPIVersion% geq %LatestVersion% echo Keine Updates gefunden!
if %LatestVersion% gtr %WPIVersion% msg * "Du nutzt nicht die neueste Version. Bitte aktualisiere WPI auf Version %LatestVersion%"
if %LatestVersion% gtr %WPIVersion% echo %TIME% Neue Version gefunden. Bitte aktualisiere auf Version %LatestVersion%. Deine Version ist %WPIVersion%. Anwendung wird beendet! >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
if %LatestVersion% gtr %WPIVersion% start https://github.com/FaserF/FaserFQuickTools/releases/latest | exit

start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
REM *********Default Browser wird in Chrome geändert und anschließende Wartezeit von ca 4 Sekunden********
start C:\Users\%username%\Downloads\CustomInstall\ChromeDefaultBrowser.vbs
echo Mache Chrome zum Standard Browser....
timeout /T 4 > NUL
start /min https://github.com/Edgarware/Threshold-Skin/archive/master.zip
start /min http://www.metroforsteam.com/downloads/4.2.4.zip
start /min http://www.filehorse.com/download-nvidia-geforce-experience/download/
start /min http://www.filehorse.com/download-driver-booster-free/download/
start /min https://discordapp.com/api/download?platform=win
start /min https://app.prntscr.com/build/setup-lightshot.exe
REM start /min https://gallery.technet.microsoft.com/Manage-the-taskbar-remove-c3024e40/file/145807/1/ManageTaskbar-1.0.zip
echo Warte auf Beendigung der Downloads, dann ...
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
echo Installationen gestartet. Abschluss aller Installationen geschieht im Hintergrund, nun werden Installations Files gelöscht und Steam Skin wird installiert ...

REM ****Überprüfe ob User Steam Skin bereits gewaehlt hat******
if not Exist "Skin.txt" (
echo %TIME% Skin.txt nicht gefunden >> C:\Users\%username%\Desktop\WPI_Log.txt
echo             Erstelle vor Start eine Skin.txt mit Inhalt des gewuenschten Steam Skins [Auswahl: Threshold , Metro , skip] >> C:\Users\%username%\Desktop\WPI_Log.txt
echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
)

:AutoSteamSkin
echo.
if "%SYSMODEL%"=="All Series" SET Skin=Threshold
if "%SYSMODEL%"=="Latitude E7450" SET Skin=deinstallieren
if "%SYSMODEL%"=="Precision WorkStation T5500" SET Skin=Threshold
if "%SYSMODEL%"=="Precision T5500" SET Skin=Threshold
if "%SYSMODEL%"=="Precision M4700" SET Skin=Threshold
if "%SYSMODEL%"=="System Product Name" SET Skin=Metro
echo Lese Skin.txt aus, falls vorhanden.
echo.
SET /p Skin=<Skin.txt

if "%Skin%"=="Threshold" echo %TIME% Threshold Skin wurde automatisch ermittelt - Installiere Skin >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
if "%Skin%"=="Threshold" goto :Skin1
if "%Skin%"=="Metro" echo %TIME% Metro Skin wurde automatisch ermittelt - Installiere Skin >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
if "%Skin%"=="Metro" goto :Skin2
if "%Skin%"=="skip" echo %TIME% Standard Steam Skin wurde automatisch ermittelt - Installiere keinen Skin >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
if "%Skin%"=="skip" goto :Skin3
if "%Skin%"=="kein" echo %TIME% Standard Steam Skin wurde automatisch ermittelt - Installiere keinen Skin >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
if "%Skin%"=="kein" goto :Skin3
if "%Skin%"=="deinstallieren" echo %TIME% Steam deinstallieren wurde automatisch ermittelt - Deinstalliere Steam >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
if "%Skin%"=="deinstallieren" goto :Skin4
goto :SteamSkin

:SteamSkinAbwesend
echo.
echo              Du warst waehrend der Steam Skin Auswahl Abwesend, daher wirst du nun erneut gefragt.
echo              Wenn du keinen Skin moechtest waehle "3"
echo.
pause
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
echo   [4]    Deinstalliere Steam
echo.

:: Choices are 1,2 and 3, default choice is 5, timeout = 0,5 minutes
choice /c 12345 /d 5 /t 30
goto Skin%errorlevel%

:Skin1
REM ****THRESHOLD*****Installation neuester Version des Steam Skins - muss nachträglich noch in Steam Einstellungen ausgewählt werden!********
echo %TIME% Threshold Skin wird installiert >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\Threshold-Skin-master.zip -oC:\Users\%username%\Downloads\CustomInstall\ > NUL:
robocopy "C:\Users\%username%\Downloads\CustomInstall\Threshold-Skin-master" "C:\Program Files (x86)\Steam\skins\Threshold" /MIR
xcopy /s /y "C:\Program Files (x86)\Steam\skins\Threshold\Customization\Sidebar Width\Collapsed Sidebar\resource" "C:\Program Files (x86)\Steam\skins\Threshold\resource"
if "%SkinAbwesend%"=="yes" goto :RenamePC1
goto :Start

:Skin2
REM *****METRO****Installation des Steam Skins - muss nachträglich noch in Steam Einstellungen ausgewählt werden!********
echo %TIME% Metro Skin wird installiert >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\4.2.4.zip -oC:\Users\%username%\Downloads\CustomInstall\ > NUL:
robocopy "C:\Users\%username%\Downloads\CustomInstall\Metro 4.2.4" "C:\Program Files (x86)\Steam\skins\Metro" /MIR
if "%SkinAbwesend%"=="yes" goto :RenamePC1
goto :Start

:Skin3
REM *******Kein Skin wurde ausgewaehlt********
echo %TIME% Kein Skin wird installiert >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
if "%SkinAbwesend%"=="yes" goto :RenamePC1
goto :Start

:Skin4
echo %TIME% Steam wird deinstalliert >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
cmd /c "C:\Program Files (x86)\Steam\uninstall.exe" /S
timeout /T 10 > NUL:
goto :Start

:Skin5
REM *******Dummy - dient lediglich der Weiterleitung
echo.
echo Du warst wohl abwesend. Ich habe in der Zeit den Installationsprozess fortgesetzt und keinen Steam Skin installiert.
echo.
echo %TIME% Steam Skin Installation uebersprungen Aufgrund von Abwesenheit [Timeout]. >> C:\Users\%username%\Desktop\WPI_Log.txt
echo ########### >> C:\Users\%username%\Desktop\WPI_Log.txt
SET SkinAbwesend=yes
goto :Start

:Start
cd C:\Users\%username%\Downloads\
goto :Ermittelung

:Ermittelung
if "%SYSMODEL%"=="All Series" goto :Z97-AR
if "%SYSMODEL%"=="Latitude E7450" goto :E7450
if "%SYSMODEL%"=="Precision WorkStation T5500" goto :T5500
if "%SYSMODEL%"=="Precision M6500" goto :M6500
if "%SYSMODEL%"=="Precision M4700" goto :M4700
if "%SYSMODEL%"=="System Product Name" goto :VIII
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
echo   [2]    Dell Latitude E7450 / Ultrabook
echo   [3]    Dell Precision T5500 / CAD PC
echo   [4]    Dell Precision M6500 / CAD Notebook
echo   [5]    Asus Maximus Ranger VIII / PC
echo   [6]    Dell Precision M4700 / CAD Notebook
echo.
echo   [0]    EXIT / Beenden
echo.
echo.

set asw=0
set /p asw="Bitte Auswahl eingeben: "

if %asw%==1 goto :Z97-AR-Start
if %asw%==2 goto :E7450-Start
if %asw%==3 goto :T5500-Start
if %asw%==4 goto :M6500-Start
if %asw%==5 goto :VIII
if %asw%==6 goto :M4700-Start

if %asw%==0 goto :RenamePC
if %asw%==exit goto :RenamePC

echo Nächste Auswahl? Bitte eine Zahl von oben waehlen!
goto :Auswahl

:Z97-AR
echo ASUS Z97-AR wurde automatisch ermittelt | echo %TIME% %SYSMODEL% wurde automatisch ermittelt - Ueberspringe Geraeteauswahl >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
:Z97-AR-Start
start http://dlcdnet.asus.com/pub/ASUS/misc/utils/AISuite_III_V10149_for_Z97.rar
start http://dlcdnet.asus.com/pub/ASUS/misc/usb30/Asmedia_USB3_V116351.zip
start http://dlcdnet.asus.com/pub/ASUS/misc/utils/Turbo_LAN_Win7-8-81-10_V10700.zip
start http://dlgbit.winfuture.de/21d53ef186363366551a0c51f5c7363e/58f5f505/software/realtek/2.81/0008-64bit_Win7_Win8_Win81_Win10_R281.exe
start http://www.intel.de/content/www/de/de/support/network-and-i-o/wireless-networking/intel-wireless-products/intel-wireless-7200-series/intel-dual-band-wireless-ac-7260.html
start http://download.lenovo.com/consumer/monitor/lenovo_artery_setup.exe
echo Treiber Installation. Warte auf Beendigung der Downloads, dann ...
timeout /T 180
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\AISuite_III_V10149_for_Z97.rar -oC:\Users\%username%\Downloads\AISuite_III_V10149_for_Z97\ > NUL:
7z x C:\Users\%username%\Downloads\Asmedia_USB3_V116351.zip -oC:\Users\%username%\Downloads\Asmedia_USB3_V116351\ > NUL:
7z x C:\Users\%username%\Downloads\Turbo_LAN_Win7-8-81-10_V10700.zip -oC:\Users\%username%\Downloads\Turbo_LAN_Win7-8-81-10_V10700\ > NUL:
cd C:\Users\%username%\Downloads\
start /wait C:\Users\%username%\Downloads\Asmedia_USB3_V116351\AsusSetup.exe
start /wait C:\Users\%username%\Downloads\Turbo_LAN_Win7-8-81-10_V10700\Turbo_LAN_Win7-8-81-10_V10700\AsusSetup.exe
start /wait C:\Users\%username%\Downloads\AISuite_III_V10149_for_Z97\AsusSetup.exe
start /wait C:\Users\%username%\Downloads\lenovo_artery_setup.exe
echo Bitte Treiber installieren, anschließend ...
timeout /T 40
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
start https://central.github.com/deployments/desktop/desktop/latest/win32
start https://www.sparda.de/secureapp-pc/medien/spardasecureapp_p.exe
start https://github.com/nefarius/ScpToolkit/releases/download/v1.6.133.15324/ScpToolkit_Setup.exe
start https://download.sublimetext.com/Sublime%20Text%20Build%203143%20x64%20Setup.exe
echo Anwendungsinstallation. Warte auf Beendigung der Downloads, dann ...
timeout /T 180

start C:\Users\%username%\Downloads\UplayInstaller.exe /S
start C:\Users\%username%\Downloads\OriginThinSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
start C:\Users\%username%\Downloads\WhatsAppSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
REM *****Starte Unified Remote Automatische Installation*******
dir /b C:\Users\%username%\Downloads\ | find "ServerSetup" > UnifiedRemote.tmp
for /f %%u IN ('findstr ServerSetup UnifiedRemote.tmp') do (
start C:\Users\%username%\Downloads\%%u )
del UnifiedRemote.tmp
timeout /T 1 > NUL:
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
timeout /T 13 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 3 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
REM *******Starte Pushbullet Automatische Installation******
start C:\Users\%username%\Downloads\pushbullet_installer.exe
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 2 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Space.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs

start C:\Users\%username%\Downloads\AlbumArtDownloaderXUI-1.02.exe
start C:\Users\%username%\Downloads\PhonerLiteSetup.exe
REM *****Starte Epic Games Installation*******
dir /b C:\Users\%username%\Downloads\ | find "EpicGamesLauncherInstaller" > EpicGamesLauncherInstaller.tmp
for /f %%e IN ('findstr EpicGamesLauncherInstaller EpicGamesLauncherInstaller.tmp') do (
start C:\Users\%username%\Downloads\%%e )
del EpicGamesLauncherInstaller.tmp
REM *****Starte Logitech Automatische Installation*******
dir /b C:\Users\%username%\Downloads\ | find "Logitech" > Logitech.tmp
for /f %%l IN ('findstr Logitech Logitech.tmp') do (
start C:\Users\%username%\Downloads\%%l )
del Logitech.tmp
Ren "C:\Users\%username%\Downloads\Ninite Notepad Installer.exe" Ninite-Notepad.exe
start C:\Users\%username%\Downloads\Ninite-Notepad.exe
timeout /T 2 > NUL:
REM *****Starte Battlenet Installation*******
start C:\Users\%username%\Downloads\Battle.net_Setup.exe
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 30

REM *********Starten der TagScan Installation, da Version im Namen trägt********
dir /b C:\Users\%username%\Downloads\ | find "Tagscan" > tagscaninstall.tmp
for /f %%f IN ('findstr Tagscan tagscaninstall.tmp') do (
start C:\Users\%username%\Downloads\%%f /VERYSILENT /SUPPRESSMSGBOXES /NORESTART )
del tagscaninstall.tmp

start GitHubDesktopSetup.exe
start spardasecureapp_p.exe
start ScpToolkit_Setup.exe
Ren "C:\Users\%username%\Downloads\Sublime Text Build 3143 x64 Setup.exe" Sublime-Text.exe
start Sublime-Text.exe /VERYSILENT /NORESTART /TASKS="contextentry"
echo https://discordler.github.io/other/PS3.html >> C:\Users\%username%\Desktop\SCP.txt
start /min C:\Users\%username%\Desktop\SCP.txt
taskkill /IM Chrome.exe /F
set /p path=Installiere weitere Anwendungen, bitte gib den Laufwerksbuchstaben an z.B. F
start "%path%:\Cracks\YouDJ\InstallYouDJCrack.exe"
start "%path%:\Cracks\Microsoft Office und Windows Crack\MicrosoftOffice 2016 Pro Plus + Crack\Microsoft Office Professional Plus 2016 x64-x86\office\setup64.exe"
REM net use z: \\192.168.178.21\public\share /user:FSeitz
REM net use y: \\192.168.178.21\homes\FSeitz /user:FSeitz
start https://de.evga.com/precisionxoc/#download
goto :RenamePC

:E7450
echo Latitude E7450 wurde automatisch ermittelt | echo %TIME% %SYSMODEL% wurde automatisch ermittelt - Ueberspringe Geraeteauswahl >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
:E7450-Start
net use z: \\192.168.178.21\public\share /user:FSeitz
net use y: \\192.168.178.21\homes\FSeitz /user:FSeitz
start https://downloads.dell.com/FOLDER04408227M/2/Realtek-High-Definition-Audio-Driver_331N1_WIN_6.0.1.6122_A08.EXE /s
start https://downloads.dell.com/FOLDER03974224M/1/Security_Driver_HGX2G_WN64_3.4.8.14_A20.EXE /s
start https://downloads.dell.com/FOLDER04646043M/1/Intel-HD-Graphics-4000-5000-500-P500-series-Driver_V887R_WIN_20.19.15.4835_A06.EXE /s
start https://downloads.dell.com/FOLDER04210938M/3/Dell-Touchpad-Driver_9HG8R_WIN_10.2207.101.108_A00_02.EXE /s
start https://www.unifiedremote.com/download/windows
start https://update.pushbullet.com/pushbullet_installer.exe
start https://www.xdlab.ru/files/tagscan-6.0.20-setup.exe
start https://downloads.sourceforge.net/project/album-art/album-art-xui/AlbumArtDownloaderXUI-1.02.exe?r=&ts=1500286400&use_mirror=netcologne
start https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe
start https://download.sublimetext.com/Sublime%20Text%20Build%203143%20x64%20Setup.exe
echo Warte auf Beendigung des Downloads, dann ...
timeout /T 120
start C:\Users\%username%\Downloads\tagscan-6.0.22-setup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
start C:\Users\%username%\Downloads\WhatsAppSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
REM *****Starte Unified Remote Automatische Installation*******
dir /b C:\Users\%username%\Downloads\ | find "ServerSetup" > UnifiedRemote.tmp
for /f %%u IN ('findstr ServerSetup UnifiedRemote.tmp') do (
start C:\Users\%username%\Downloads\%%u )
del UnifiedRemote.tmp
timeout /T 1 > NUL:
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
timeout /T 2

start C:\Users\%username%\Downloads\pushbullet_installer.exe
start C:\Users\%username%\Downloads\AlbumArtDownloaderXUI-1.02.exe

timeout /T 1 > NUL:
Ren "C:\Users\%username%\Downloads\Sublime Text Build 3143 x64 Setup.exe" Sublime-Text.exe
start Sublime-Text.exe /VERYSILENT /NORESTART /TASKS="contextentry"
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\Dell-Touchpad-Driver_9HG8R_WIN_10.2207.101.108_A00_02.EXE /s
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\Realtek-High-Definition-Audio-Driver_331N1_WIN_6.0.1.6122_A08.EXE /s
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\Security_Driver_HGX2G_WN64_3.4.8.14_A20.EXE /s
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\Intel-HD-Graphics-4000-5000-500-P500-series-Driver_V887R_WIN_20.19.15.4835_A06.EXE /s

taskkill /IM Chrome.exe /F

timeout /T 1 > NUL:
start https://downloadcenter.intel.com/de/product/83635/Intel-Dualband-Wireless-AC-7265
timeout /T 1 > NUL:
set /p path=Installiere weitere Anwendungen, bitte gib den Laufwerksbuchstaben an z.B. F:
start "%path%:\Cracks\YouDJ\InstallYouDJCrack.exe"
start "%path%:\Cracks\Microsoft Office und Windows Crack\MicrosoftOffice 2016 Pro Plus + Crack\Microsoft Office Professional Plus 2016 x64-x86\office\setup64.exe"
goto :RenamePC

:M6500
echo Dell M6500 wurde automatisch ermittelt | echo %TIME% %SYSMODEL% wurde automatisch ermittelt - Ueberspringe Geraeteauswahl >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
:M6500-Start
start https://www2.ati.com/drivers/firepro/mobile/dell-mobile-radeon-pro-software-enterprise-17.q1.1-apr3.exe
start https://downloads.dell.com/input/PREM6500_DRVR_WIN_R280879.EXE
start https://downloads.dell.com/FOLDER01694314M/2/Network_Driver_3MNPT_WN_15.10.0.10_A06.EXE
start https://downloadcenter.intel.com/de/downloads/eula/20775/Intel-Chipsatz-Ger-tesoftware-INF-Update-Utility-?httpDown=https%3A%2F%2Fdownloadmirror.intel.com%2F20775%2Feng%2FSetupChipset.exe
start https://downloads.dell.com/chipset/PREM6500_DRVR_WIN_R247353.EXE
echo Warte auf Beendigung des Downloads, dann ...
pause
for /r "." %%a in (*.exe /s) do start "" "%%~fa"
echo Installationen gestartet.
del /q C:\Users\%username%\Downloads\*.exe
timeout /T 5 > NUL:
goto :RenamePC

:M4700
echo Dell M4700 wurde automatisch ermittelt | echo %TIME% %SYSMODEL% wurde automatisch ermittelt - Ueberspringe Geraeteauswahl >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
:M4700-Start
net use z: \\192.168.178.21\public\share /user:FSeitz
net use y: \\192.168.178.21\homes\FSeitz /user:FSeitz
start https://downloads.dell.com/FOLDER03465771M/1/Network_Driver_565N6_WN32_12.0.1.750_A03.EXE
start https://downloads.dell.com/FOLDER03388567M/1/Input_Driver_YXX3D_WN32_10.1207.101.109_A03.EXE
start https://downloads.dell.com/FOLDER03974224M/1/Security_Driver_HGX2G_WN64_3.4.8.14_A20.EXE
start https://downloadcenter.intel.com/de/product/59471/Intel-Centrino-Advanced-N-6205-Dualband
start https://www.unifiedremote.com/download/windows
start https://update.pushbullet.com/pushbullet_installer.exe
start http://ubi.li/4vxt9
start http://www.dm.origin.com/download
start https://www.xdlab.ru/files/tagscan-6.0.20-setup.exe
start https://downloads.sourceforge.net/project/album-art/album-art-xui/AlbumArtDownloaderXUI-1.02.exe?r=&ts=1500286400&use_mirror=netcologne
start https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe
start https://download.sublimetext.com/Sublime%20Text%20Build%203143%20x64%20Setup.exe
echo Warte auf Beendigung des Downloads, dann ...
timeout /T 180
start C:\Users\%username%\Downloads\UplayInstaller.exe /S
start C:\Users\%username%\Downloads\OriginThinSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
start C:\Users\%username%\Downloads\WhatsAppSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
REM *****Starte Unified Remote Automatische Installation*******
dir /b C:\Users\%username%\Downloads\ | find "ServerSetup" > UnifiedRemote.tmp
for /f %%u IN ('findstr ServerSetup UnifiedRemote.tmp') do (
start C:\Users\%username%\Downloads\%%u )
del UnifiedRemote.tmp
timeout /T 1 > NUL:
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
timeout /T 3 > NUL:
start C:\Users\%username%\Downloads\pushbullet_installer.exe
start C:\Users\%username%\Downloads\AlbumArtDownloaderXUI-1.02.exe

Ren "C:\Users\%username%\Downloads\Sublime Text Build 3143 x64 Setup.exe" Sublime-Text.exe
start Sublime-Text.exe /VERYSILENT /NORESTART /TASKS="contextentry"

REM *********Starten der Installation, da Version im Namen trägt********
dir /b C:\Users\%username%\Downloads\ | find "Tagscan" > tagscaninstall.tmp
for /f %%f IN ('findstr Tagscan tagscaninstall.tmp') do (
start C:\Users\%username%\Downloads\%%f /VERYSILENT /SUPPRESSMSGBOXES /NORESTART )
del tagscaninstall.tmp

start Network_Driver_565N6_WN32_12.0.1.750_A03.EXE /s
start Input_Driver_YXX3D_WN32_10.1207.101.109_A03.EXE /s
start Security_Driver_HGX2G_WN64_3.4.8.14_A20.EXE /s
start Intel-Centrino-Advanced-N-6205-Dualband

echo Alle Installationen gestartet. Warte auf Abschluss.
pause

set /p path=Installiere weitere Anwendungen, bitte gib den Laufwerksbuchstaben an z.B. F:
start "%path%:\Cracks\YouDJ\InstallYouDJCrack.exe"
start "%path%:\Cracks\Microsoft Office und Windows Crack\MicrosoftOffice 2016 Pro Plus + Crack\Microsoft Office Professional Plus 2016 x64-x86\office\setup64.exe"

del /q C:\Users\%username%\Downloads\*.exe
timeout /T 5
goto :RenamePC

:T5500
echo Dell T5500 wurde automatisch ermittelt | echo %TIME% %SYSMODEL% wurde automatisch ermittelt - Ueberspringe Geraeteauswahl >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
:T5500-Start
start http://download.msi.com/uti_exe/vga/MSIAfterburnerSetup.zip
start https://ftp.csl-computer.com/pub/drivers/Bluetooth/23997-USB_Mini_Bluetooth_Dongle_Nano/CSR_Harmony_SW_Stack.zip
echo Warte auf Beendigung des Downloads, dann ...
pause
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\MSIAfterburnerSetup.zip -oC:\Users\%username%\Downloads\ > NUL:
7z x C:\Users\%username%\Downloads\4.3.0\MSIAfterburnerSetup430.rar -oC:\Users\%username%\Downloads\ > NUL:
cd C:\Users\%username%\Downloads\
start MSIAfterburnerSetup430.exe
echo Installationen gestartet.
timeout /T 5
goto :RenamePC

:VIII
echo ASUS Maximus Ranger VIII wurde automatisch ermittelt | echo %TIME% %SYSMODEL% wurde automatisch ermittelt - Ueberspringe Geraeteauswahl >> C:\Users\%username%\Desktop\WPI_Log.txt | echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
:VIII-Start
start http://dlcdnet.asus.com/pub/ASUS/misc/utils/AISuite3_Win7-81-10_MaxVIII_Series_V10130.zip
start http://dlcdnet.asus.com/pub/ASUS/misc/usb30/Asmedia_USB3_V116351.zip
echo 1. Treiber Installation. Warte auf Beendigung der Downloads, dann ...
timeout /T 60
cd C:\Program Files\7-Zip\
7z x C:\Users\%username%\Downloads\AISuite3_Win7-81-10_MaxVIII_Series_V10130.zip -oC:\Users\%username%\Downloads\AISuite3_Win7-81-10_MaxVIII_Series_V10130\ > NUL:
7z x C:\Users\%username%\Downloads\Asmedia_USB3_V116351.zip -oC:\Users\%username%\Downloads\Asmedia_USB3_V116351\ > NUL:
cd C:\Users\%username%\Downloads\
start C:\Users\%username%\Downloads\Asmedia_USB3_V116351\AsusSetup.exe
start C:\Users\%username%\Downloads\AISuite3_Win7-81-10_MaxVIII_Series_V10130\AsusSetup.exe
echo Bitte Treiber installieren, anschließend ...
timeout /T 200

start https://www.unifiedremote.com/download/windows
start https://update.pushbullet.com/pushbullet_installer.exe
start http://ubi.li/4vxt9
start http://www.dm.origin.com/download
start https://www.xdlab.ru/files/tagscan-6.0.22-setup.exe
start https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe
start https://www.battle.net/download/getInstallerForGame?os=win&locale=deDE&version=LIVE&gameProgram=BATTLENET_APP
start https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi
start https://github.com/nefarius/ScpToolkit/releases/download/v1.6.133.15324/ScpToolkit_Setup.exe
start https://download.sublimetext.com/Sublime%20Text%20Build%203143%20x64%20Setup.exe
start https://download01.logi.com/web/ftp/pub/techsupport/gaming/LGS_8.92.67_x86_Logitech.exe
echo 2. Anwendungsinstallation. Warte auf Beendigung der Downloads, dann ...
timeout /T 180

start C:\Users\%username%\Downloads\UplayInstaller.exe /S
start C:\Users\%username%\Downloads\OriginThinSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
start C:\Users\%username%\Downloads\WhatsAppSetup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
REM *****Starte Unified Remote Automatische Installation*******
dir /b C:\Users\%username%\Downloads\ | find "ServerSetup" > UnifiedRemote.tmp
for /f %%u IN ('findstr ServerSetup UnifiedRemote.tmp') do (
start C:\Users\%username%\Downloads\%%u )
del UnifiedRemote.tmp
timeout /T 1 > NUL:
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
timeout /T 13 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 3 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
REM *******Starte Pushbullet Automatische Installation******
start C:\Users\%username%\Downloads\pushbullet_installer.exe

REM *****Starte Epic Games Installation*******
dir /b C:\Users\%username%\Downloads\ | find "EpicGamesLauncherInstaller" > EpicGamesLauncherInstaller.tmp
for /f %%e IN ('findstr EpicGamesLauncherInstaller EpicGamesLauncherInstaller.tmp') do (
start C:\Users\%username%\Downloads\%%e )
del EpicGamesLauncherInstaller.tmp
REM *****Starte Logitech Automatische Installation*******
dir /b C:\Users\%username%\Downloads\ | find "Logitech" > Logitech.tmp
for /f %%l IN ('findstr Logitech Logitech.tmp') do (
start C:\Users\%username%\Downloads\%%l )
del Logitech.tmp
timeout /T 2 > NUL:
REM *****Starte Battlenet Installation*******
start C:\Users\%username%\Downloads\Battle.net_Setup.exe
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 5 > NUL:

REM *********Starten der TagScan Installation, da Version im Namen trägt********
dir /b C:\Users\%username%\Downloads\ | find "Tagscan" > tagscaninstall.tmp
for /f %%f IN ('findstr Tagscan tagscaninstall.tmp') do (
start C:\Users\%username%\Downloads\%%f /VERYSILENT /SUPPRESSMSGBOXES /NORESTART )
del tagscaninstall.tmp

start ScpToolkit_Setup.exe
Ren "C:\Users\%username%\Downloads\Sublime Text Build 3143 x64 Setup.exe" Sublime-Text.exe
start Sublime-Text.exe /VERYSILENT /NORESTART /TASKS="contextentry"
echo https://discordler.github.io/other/PS3.html >> C:\Users\%username%\Desktop\SCP.txt
start /min C:\Users\%username%\Desktop\SCP.txt
taskkill /IM Chrome.exe /F

echo Alle Installationen gestartet.
timeout /T 60
goto :RenamePC

:NoInternet
echo %TIME% Internet Verbindung konnte nicht hergestellt werden! Programm wird beendet. >> C:\Users\%username%\Desktop\WPI_Log.txt
msg * "Keine Internet Verbindung verfuegbar, Programm wird beendet!"
rd /s /q C:\Users\%username%\Downloads\CustomInstall\
exit

:RenamePC
if "%SkinAbwesend%"=="yes" goto :SteamSkinAbwesend
:RenamePC1
del /q C:\Users\%username%\Downloads\Skin.txt
set NEWPCNAME=""
set /p NEWPCNAME="Bitte neuen Computernamen eingeben: "

start C:\Users\%username%\Downloads\CustomInstall\RenamePC.vbs %NEWPCNAME%
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1 > NUL:
echo %TIME% PC in %NEWPCNAME% umbenannt. >> C:\Users\%username%\Desktop\WPI_Log.txt
goto :Exit

:Exit
REM cd C:\Program Files\7-Zip\
REM 7z x C:\Users\%username%\Downloads\ManageTaskbar-1.0.zip -oC:\Users\%username%\Downloads\CustomInstall\
REM cd C:\Users\%username%\Downloads\
REM rename "C:\Users\%username%\Downloads\CustomInstall\ManageTaskbar 1.0" "ManageTaskbar"
REM start "C:\Users\%username%\Downloads\CustomInstall\ManageTaskbar\TaskBar.cmd"
REM timeout /T 3 > NUL:
echo Set oWS = WScript.CreateObject("WScript.Shell") > C:\Users\%username%\Downloads\CustomInstall\CreateShortcut.vbs
echo sLinkFile = "C:\Users\%username%\Downloads\CustomInstall\Google Chrome.lnk" >> C:\Users\%username%\Downloads\CustomInstall\CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> C:\Users\%username%\Downloads\CustomInstall\CreateShortcut.vbs
echo oLink.TargetPath = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" >> C:\Users\%username%\Downloads\CustomInstall\CreateShortcut.vbs
echo oLink.Save >> C:\Users\%username%\Downloads\CustomInstall\CreateShortcut.vbs
cscript C:\Users\%username%\Downloads\CustomInstall\CreateShortcut.vbs
copy "C:\Users\%username%\Downloads\CustomInstall\Google Chrome.lnk" "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Google Chrome.lnk"
echo Dialog schließt sich in 5 Sekunden und loescht Installationsfiles.
rd /s /q C:\Users\%username%\Downloads\CustomInstall\
for /r "." %%a in (*.exe) do del /q "" "%%~fa"
for /r "." %%a in (*.msi) do del /q "" "%%~fa"
for /r "." %%a in (*.zip) do del /q "" "%%~fa"
for /r "." %%a in (*.rar) do del /q "" "%%~fa"
start https://github.com/mRemoteNG/mRemoteNG/releases/latest
echo %TIME% Installation abgeschlossen. >> C:\Users\%username%\Desktop\WPI_Log.txt
echo ######################################################################## >> C:\Users\%username%\Desktop\WPI_Log.txt
start /min C:\Users\%username%\Desktop\WPI_Log.txt
msg * "Installationen abgeschlossen! MS Office muss ggf. noch installiert werden. Steam Skin muss in Steam Einstellungen noch ausgewaehlt werden. Damit die Taskbar aktualisiert wird ist ein Neustart erforderlich."
slmgr.vbs /ato
cmd /c "C:\Program Files (x86)\NVIDIA Corporation\NVIDIA GeForce Experience\NVIDIA GeForce Experience.exe"
exit
