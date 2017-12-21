@echo off
set WPIVersion=1.0.1.2
set datum=21.12.2017
set Description=Automatic Windows Post Installer (Software, Driver, ...) for a fresh Windows Installation.
set usbpath=D
title Automatic Windows Post Installer (Business) by Fabian Seitz - V%WPIVersion% - Datum: %datum%

:Default
echo %Description%
REM TASKLIST | FINDSTR /I "Windows Post Installer"
REM if "%ERRORLEVEL%"=="0" msg * "WPI laeuft bereits. Programm wird beendet."
REM if "%ERRORLEVEL%"=="0" exit
ping www.google.de -n 1 > nul
if errorlevel 1 (set internet=Nicht mit dem Internet verbunden) else (set internet=Internet Verbindung aufgebaut)
if "%internet%" == "Nicht mit dem Internet verbunden" goto :NoInternet
:Start
cd C:\Users\%username%\Downloads\
rd /s /q C:\Users\%username%\Downloads\CustomInstall\
md C:\Users\%username%\Downloads\CustomInstall\
echo                           Windows Post Installer - LOG > %usbpath%:\WPI_Log.txt
echo             ============================================================ >> %usbpath%:\WPI_Log.txt
echo %TIME% Programm ist gestartet >> %usbpath%:\WPI_Log.txt
echo             Probleme? https://github.com/FaserF/FaserFQuickTools/issues >> %usbpath%:\WPI_Log.txt
echo ######################################################################## >> %usbpath%:\WPI_Log.txt
REM *********Erstelle reg Eintrag zur Deaktivierung der Edge Speichern Aufforderung********
echo Windows Registry Editor Version 5.00 > "C:\Users\%username%\Downloads\CustomInstall\EdgeAutoDownload.reg"
echo [HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Download] >> "C:\Users\%username%\Downloads\CustomInstall\EdgeAutoDownload.reg"
echo "EnableSavePrompt"=dword:00000000 >> "C:\Users\%username%\Downloads\CustomInstall\EdgeAutoDownload.reg"
REM *********Erstelle reg Eintrag zur Deaktivierung von Installationen der Windows SPAM Apps (Spiele, etc...)********
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
echo %TIME%  %WindowsVersion% wurde automatisch ermittelt >> %usbpath%:\WPI_Log.txt 
if "%WindowsVersion%" == "Windows 7" echo Treiber Support wird unter Windows 7 nicht Garantiert. >> %usbpath%:\WPI_Log.txt
if "%WindowsVersion%" == "Windows Version unbekannt" echo Installierte Windows Version konnte nicht erkannt werden. Treiber Support wird nicht Garantiert. >> %usbpath%:\WPI_Log.txt
echo ######################################################################## >> %usbpath%:\WPI_Log.txt
cls
echo             ============================================================
echo                    Automatische Treiber und Programm Installation
echo                          fuer PARI GmbH von Fabian Seitz
echo             ============================================================
echo.
echo.
echo            Initialisiere Standard Installation
echo            WICHTIG: NICHTS TIPPEN/ANKLICKEN, nur bei Aufforderung! Ansonsten evtl Abbruch der Automatik.
echo.
echo.
echo           %internet%
echo           SYSTEM MODELL: %SYSMODEL%

SET supported=Geraet wird nicht offiziell unterstuetzt
if "%SYSMODEL%"=="Latitude E6440" SET supported=Notebook wird offiziell unterstuetzt von diesem Programm
if "%SYSMODEL%"=="Latitude E7440" SET supported=Notebook wird offiziell unterstuetzt von diesem Programm
if "%SYSMODEL%"=="Latitude E7450" SET supported=Notebook wird offiziell unterstuetzt von diesem Programm
echo           %supported%
echo           %WindowsVersion% laeuft auf diesem Geraet!
echo.

start C:\Users\%username%\Downloads\CustomInstall\EdgeAutoDownload.reg
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1 > NUL:

start C:\Users\%username%\Downloads\CustomInstall\DisableAutoDownloadApps.reg
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Left.vbs
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs

start C:\Users\%username%\Downloads\CustomInstall\WinUpdate.vbs
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1 > NUL:
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs

cd C:\Users\%username%\Downloads\
REM set /p usbpath="Bitte USB Laufwerksbuchstaben angeben (z.B. D): "
goto :Install

:Install
echo %SYSMODEL% wurde automatisch ermittelt | echo %TIME% %SYSMODEL% wurde automatisch ermittelt >> %usbpath%:\WPI_Log.txt | echo ######################################################################## >> %usbpath%:\WPI_Log.txt
:Install-Start
echo Errorlevelerklärungen: 0 (erfolgreich), 1 (fehlgeschlagen), 2 (Neustart erforderlich), 3 (gleiche Version bereits installiert), 5 (dieser Treiber ist fuer ein anderes Geraet), 9059 (Datei wurde nicht gefunden) >> %usbpath%:\WPI_Log.txt | echo ######################################################################## >> %usbpath%:\WPI_Log.txt

REM *********Starten der WLAN Installation********
echo "Starte WLAN Treiber im Silent Mode"
start /d "%usbpath%:\_Driver\%SYSMODEL%\" Wifi.exe -s -norestart
echo "Errorlevel (0 erfolgreich, 1 fehlgeschlagen) %errorlevel%" | echo WLAN Errorlevel: %errorlevel% >> %usbpath%:\WPI_Log.txt
timeout /T 3 > NUL:

REM *********Starten der Fingerprint Installation********
echo "Starte Fingerprint Treiber im Silent Mode"
start /d "%usbpath%:\_Driver\%SYSMODEL%\" Fingerprint.EXE /s
echo "Errorlevel (0 erfolgreich, 1 fehlgeschlagen) %errorlevel%" | echo Fingerprint Errorlevel: %errorlevel% >> %usbpath%:\WPI_Log.txt
timeout /T 2 > NUL:

REM *********Starten der Touchpad Installation********
echo "Starte Touchpad Treiber im Silent Mode"
start /d "%usbpath%:\_Driver\%SYSMODEL%\" Touchpad.EXE /s /f
echo "Errorlevel (0 erfolgreich, 1 fehlgeschlagen) %errorlevel%" | echo Touchpad Errorlevel: %errorlevel% >> %usbpath%:\WPI_Log.txt
timeout /T 2 > NUL:

REM *********Starten der Grafik Installation********
echo "Starte Intel Grafik Treiber im Silent Mode"
start /d "%usbpath%:\_Driver\%SYSMODEL%\" Video.EXE /s
echo "Errorlevel (0 erfolgreich, 1 fehlgeschlagen) %errorlevel%" | echo Grafik Errorlevel: %errorlevel% >> %usbpath%:\WPI_Log.txt
timeout /T 5 > NUL:

REM *********Starten der Audio Installation********
echo "Starte Audio Treiber im Silent Mode"
start /d "%usbpath%:\_Driver\%SYSMODEL%\" Audio.EXE /s
echo "Errorlevel (0 erfolgreich, 1 fehlgeschlagen) %errorlevel%" | echo Audio Errorlevel: %errorlevel% >> %usbpath%:\WPI_Log.txt
timeout /T 5 > NUL:

REM *********Starten der Mobilfunk Installation********
echo "Starte Mobilfunk Treiber im Silent Mode"
start /d "%usbpath%:\_Driver\%SYSMODEL%\" Mobilfunk.EXE /s
echo "Errorlevel (0 erfolgreich, 1 fehlgeschlagen) %errorlevel%" | echo Mobilfunk Errorlevel: %errorlevel% >> %usbpath%:\WPI_Log.txt
timeout /T 3 > NUL:

REM *********Starten der Bluetooth Installation********
echo "Starte Intel Grafik Treiber im Silent Mode"
start /d "%usbpath%:\_Driver\%SYSMODEL%\" Bluetooth.exe -s -norestart
echo "Errorlevel (0 erfolgreich, 1 fehlgeschlagen) %errorlevel%" | echo Bluetooth Errorlevel: %errorlevel% >> %usbpath%:\WPI_Log.txt
timeout /T 5 > NUL:

goto :Exit

:NoInternet
echo %TIME% Internet Verbindung konnte nicht hergestellt werden! Programm wird offline fortgesetzt. >> %usbpath%:\WPI_Log.txt
msg * "Keine Internet Verbindung verfuegbar, Programm wird offline fortgesetzt!"
goto :Start

:Exit
echo Dialog schließt sich in wenigen Sekunden und loescht lokale Installationsfiles.
rd /s /q C:\Users\%username%\Downloads\CustomInstall\
echo ######################################################################## >> %usbpath%:\WPI_Log.txt
echo %TIME% Installation abgeschlossen. BIOS Update gestartet. >> %usbpath%:\WPI_Log.txt
echo ######################################################################## >> %usbpath%:\WPI_Log.txt
start /min %usbpath%:\WPI_Log.txt
msg * "Installationen abgeschlossen! Damit die Treiber aktualisiert werden ist ein Neustart erforderlich. BIOS Update wird nun gestartet wenn vorhanden."
REM *********Starten der BIOS Update Installation********
start /d "%usbpath%:\_Driver\%SYSMODEL%\" BIOS.exe
echo "Starte BIOS Update"
slmgr.vbs /ato
exit
