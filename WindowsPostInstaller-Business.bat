@echo off
set WPIVersion=1.0.5.1
set datum=18.01.2018
set Description=Automatic Windows Post Installer (Software, Driver, ...) for a fresh Windows Installation.
set usbpath=%CD%
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
cd %usbpath%
echo                           Windows Post Installer - LOG > %usbpath%WPI_Log.txt
echo             ============================================================ >> %usbpath%WPI_Log.txt
echo %TIME% Programm ist gestartet >> %usbpath%WPI_Log.txt
echo             Probleme? https://github.com/FaserF/WindowsPostInstaller/issues >> %usbpath%WPI_Log.txt
echo ######################################################################## >> %usbpath%WPI_Log.txt
if exist "%usbpath%CustomInstall\" goto :Detect
:CustomInstall
echo Temp Ordner nicht vorhanden. Wird nun erstellt. >> %usbpath%WPI_Log.txt
md %usbpath%CustomInstall\
REM *********Erstelle reg Eintrag zur Deaktivierung der Edge Speichern Aufforderung********
echo Windows Registry Editor Version 5.00 > "%usbpath%CustomInstall\EdgeAutoDownload.reg"
echo [HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Download] >> "%usbpath%CustomInstall\EdgeAutoDownload.reg"
echo "EnableSavePrompt"=dword:00000000 >> "%usbpath%CustomInstall\EdgeAutoDownload.reg"
REM *********Erstelle reg Eintrag zur Deaktivierung von Installationen der Windows SPAM Apps (Spiele, etc...)********
echo Windows Registry Editor Version 5.00 > "%usbpath%CustomInstall\DisableAutoDownloadApps.reg"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent] >> "%usbpath%CustomInstall\DisableAutoDownloadApps.reg"
echo "DisableWindowsConsumerFeatures"=dword:00000001 >> "%usbpath%CustomInstall\DisableAutoDownloadApps.reg"
REM *********Erstelle Script Datei um Tasten als Eingabe zu verschicken***********
echo >%usbpath%CustomInstall\Enter.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "{ENTER}"
echo >%usbpath%CustomInstall\Left.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "{LEFT}"
echo >%usbpath%CustomInstall\Tab.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "{TAB}"
echo >%usbpath%CustomInstall\Space.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys " "
echo >%usbpath%CustomInstall\AltF4.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%{f4}"
REM *********Erstelle Script zum Windows Update starten*********
echo Set automaticUpdates = CreateObject("Microsoft.Update.AutoUpdate") > "%usbpath%CustomInstall\WinUpdate.vbs"
echo automaticUpdates.DetectNow() >> "%usbpath%CustomInstall\WinUpdate.vbs"
:Detect
REM ********Lese Modellnummer aus, um richtige Programme & Treiber zuzuordnen*********
for /f "tokens=2 delims==" %%I in ('wmic computersystem get model /format:list') do set "SYSMODEL=%%I"
REM ********Erkenne Windows Version*********
set WindowsVersion=Windows Version unbekannt
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "6.3" set WindowsVersion=Windows 8
if "%version%" == "6.1" set WindowsVersion=Windows 7
if "%version%" == "10.0" set WindowsVersion=Windows 10
echo %TIME%  %WindowsVersion% wurde automatisch ermittelt >> %usbpath%WPI_Log.txt 
if "%WindowsVersion%" == "Windows 7" echo Treiber Support wird unter Windows 7 nicht Garantiert. >> %usbpath%WPI_Log.txt
if "%WindowsVersion%" == "Windows Version unbekannt" echo Installierte Windows Version konnte nicht erkannt werden. Treiber Support wird nicht Garantiert. >> %usbpath%WPI_Log.txt
echo ######################################################################## >> %usbpath%WPI_Log.txt
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
echo           %WindowsVersion% laeuft auf diesem Geraet!
echo           SYSTEM MODELL: %SYSMODEL%
echo.

SET supported=Beginne Installation der Treiber
if "%SYSMODEL%"=="Latitude E6440" SET supported=Notebook wird offiziell unterstuetzt von diesem Programm && goto :PreInstall
if "%SYSMODEL%"=="Latitude E7440" SET supported=Notebook wird offiziell unterstuetzt von diesem Programm && goto :PreInstall
if "%SYSMODEL%"=="Latitude E7450" SET supported=Notebook wird offiziell unterstuetzt von diesem Programm && goto :PreInstall
echo "Geraet wird nicht offiziell unterstuetzt!"
echo "Falls du dennoch fortfahren moechtest bestaetige dies mit einer Taste!"
pause

:PreInstall
echo           %supported%
echo.

start %usbpath%CustomInstall\EdgeAutoDownload.reg
timeout /T 1 > NUL:
start %usbpath%CustomInstall\Enter.vbs
timeout /T 1 > NUL:
start %usbpath%CustomInstall\Enter.vbs
timeout /T 1 > NUL:

start %usbpath%CustomInstall\DisableAutoDownloadApps.reg
timeout /T 1 > NUL:
start %usbpath%CustomInstall\Left.vbs
timeout /T 1 > NUL:
start %usbpath%CustomInstall\Enter.vbs
timeout /T 1 > NUL:
start %usbpath%CustomInstall\Enter.vbs
timeout /T 1 > NUL:
start %usbpath%CustomInstall\Enter.vbs

start %usbpath%CustomInstall\WinUpdate.vbs
timeout /T 1 > NUL:
start %usbpath%CustomInstall\Enter.vbs
timeout /T 1 > NUL:
start %usbpath%CustomInstall\Enter.vbs

REM cd %SystemRoot%\system32\WindowsPowerShell\v1.0\
REM PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%usbpath%uninstall-preinstalledapps.ps1'"
cd %usbpath%
goto :Install

:Install
echo %SYSMODEL% wurde automatisch ermittelt | echo %TIME% %SYSMODEL% wurde automatisch ermittelt >> %usbpath%WPI_Log.txt | echo ######################################################################## >> %usbpath%WPI_Log.txt
:Install-Start
echo Errorlevelerklärungen: 0 (erfolgreich), 1 (fehlgeschlagen), 2 (Neustart erforderlich), 3 (gleiche Version bereits installiert), 5 (dieser Treiber ist fuer ein anderes Geraet), 9059 (Datei wurde nicht gefunden) >> %usbpath%WPI_Log.txt | echo ######################################################################## >> %usbpath%WPI_Log.txt

:WLAN
REM *********Starten der WLAN Installation********
if exist "%usbpath%_Driver\%SYSMODEL%\Wifi.exe" (echo "Starte WLAN Treiber Installation mit GUI" && start /d "%usbpath%_Driver\%SYSMODEL%\" Wifi.exe /s -s -norestart) else (echo "Geraete WIFI Treiber nicht hinterlegt, wird uebersprungen" && goto :WLAN2)
echo "Errorlevel (0 erfolgreich, 1 fehlgeschlagen) %errorlevel%" && echo WLAN Errorlevel: %errorlevel% >> %usbpath%WPI_Log.txt
timeout /T 3 > NUL:
goto :Mobilfunk

:WLAN2
REM *********Starten der WLAN Installation********
if exist "%usbpath%_Driver\WiFi_Intel_All\Setup.exe" (echo "Starte allgemeinen Intel WLAN Treiber im Silent Mode" && start /d "%usbpath%_Driver\WiFi_Intel_All" Setup.exe -s -norestart) else (echo "Intel WIFI Treiber nicht hinterlegt, wird uebersprungen" && goto :Mobilfunk)
echo "Errorlevel (0 erfolgreich, 1 fehlgeschlagen) %errorlevel%" && echo WLAN Errorlevel: %errorlevel% >> %usbpath%WPI_Log.txt
timeout /T 3 > NUL:

:Mobilfunk
REM *********Starten der Mobilfunk Installation********
echo "Starte Mobilfunk Treiber im Silent Mode"
if exist "%usbpath%_Driver\%SYSMODEL%\Mobilfunk.EXE" (start /d "%usbpath%_Driver\%SYSMODEL%\" Mobilfunk.EXE /s) else (echo "Mobilfunk Treiber nicht hinterlegt, wird uebersprungen" && goto :Fingerprint)
echo "Errorlevel (0 erfolgreich, 1 fehlgeschlagen) %errorlevel%" && echo Mobilfunk Errorlevel: %errorlevel% >> %usbpath%WPI_Log.txt
timeout /T 20 > NUL:

:Fingerprint
REM *********Starten der Fingerprint Installation********
echo "Starte Fingerprint Treiber im Silent Mode"
if exist "%usbpath%_Driver\%SYSMODEL%\Fingerprint.EXE" (start /d "%usbpath%_Driver\%SYSMODEL%\" Fingerprint.EXE /s) else (echo "Fingerprint Treiber nicht hinterlegt, wird uebersprungen" && goto :Touchpad)
echo "Errorlevel (0 erfolgreich, 1 fehlgeschlagen) %errorlevel%" && echo Fingerprint Errorlevel: %errorlevel% >> %usbpath%WPI_Log.txt
timeout /T 2 > NUL:

:Touchpad
REM *********Starten der Touchpad Installation********
echo "Starte Touchpad Treiber im Silent Mode"
if exist "%usbpath%_Driver\%SYSMODEL%\Touchpad.EXE" (start /d "%usbpath%_Driver\%SYSMODEL%\" Touchpad.EXE /s /f) else (echo "Touchpad Treiber nicht hinterlegt, wird uebersprungen" && goto :Video)
echo "Errorlevel (0 erfolgreich, 1 fehlgeschlagen) %errorlevel%" && echo Touchpad Errorlevel: %errorlevel% >> %usbpath%WPI_Log.txt
timeout /T 2 > NUL:

:Video
REM *********Starten der Grafikkarten Installation********
echo "Starte Intel Grafik Treiber im Silent Mode"
if exist "%usbpath%_Driver\%SYSMODEL%\Video.EXE" (start /d "%usbpath%_Driver\%SYSMODEL%\" Video.EXE /s) else (echo "Video Treiber nicht hinterlegt, wird uebersprungen" && goto :Audio)
echo "Errorlevel (0 erfolgreich, 1 fehlgeschlagen) %errorlevel%" && echo Grafik Errorlevel: %errorlevel% >> %usbpath%WPI_Log.txt
timeout /T 5 > NUL:

:Audio
REM *********Starten der Audio Installation********
echo "Starte Audio Treiber im Silent Mode"
if exist "%usbpath%_Driver\%SYSMODEL%\Audio.EXE" (start /d "%usbpath%_Driver\%SYSMODEL%\" Audio.EXE /s) else (echo "Audio Treiber nicht hinterlegt, wird uebersprungen" && goto :Bluetooth)
echo "Errorlevel (0 erfolgreich, 1 fehlgeschlagen) %errorlevel%" && echo Audio Errorlevel: %errorlevel% >> %usbpath%WPI_Log.txt
timeout /T 5 > NUL:

:Bluetooth
REM *********Starten der Bluetooth Installation********
echo "Starte Intel Grafik Treiber im Silent Mode"
if exist "%usbpath%_Driver\%SYSMODEL%\Bluetooth.exe" (start /d "%usbpath%_Driver\%SYSMODEL%\" Bluetooth.exe /s -s -norestart) else (echo "Bluetooth Treiber nicht hinterlegt, wird uebersprungen" && goto :Powermanagement)
echo "Errorlevel (0 erfolgreich, 1 fehlgeschlagen) %errorlevel%" && echo Bluetooth Errorlevel: %errorlevel% >> %usbpath%WPI_Log.txt
timeout /T 5 > NUL:

:Powermanagement
REM *********Starten der Powermanagement Installation********
echo "Starte Dell Powermanagement Installation im Silent Mode"
if exist "%usbpath%_Driver\%SYSMODEL%\Powermanagement.exe" (start /d "%usbpath%_Driver\%SYSMODEL%\" Powermanagement.exe /s) else (echo "Dell Powermanagement nicht hinterlegt, wird uebersprungen" && goto :DriverFinish)
echo "Errorlevel (0 erfolgreich, 1 fehlgeschlagen) %errorlevel%" && echo Bluetooth Errorlevel: %errorlevel% >> %usbpath%WPI_Log.txt
timeout /T 2 > NUL:

:DriverFinish
goto :Exit

:NoInternet
echo %TIME% Internet Verbindung konnte nicht hergestellt werden! Versuche automatisch mit RMA-5Ghz zu verbinden, ansonsten wird Programm offline fortgesetzt. >> %usbpath%WPI_Log.txt
msg * "Keine Internet Verbindung verfuegbar, versuche automatisch mit RMA-5Ghz zu verbinden, ansonsten wird Programm offline fortgesetzt."
echo "Verbinde mit WLAN aus Config \CustomInstall\connectwifi.xml"
netsh wlan add profile filename="%usbpath%CustomInstall\connectwifi.xml"
timeout /T 2 > NUL:
goto :Start

:Exit
echo Dialog schliesst sich in wenigen Sekunden und loescht temporaere Installationsfiles.
REM rd /s /q %usbpath%CustomInstall\
rd /s /q C:\Dell\UpdatePackage\log\
echo ######################################################################## >> %usbpath%WPI_Log.txt
echo %TIME% Installation abgeschlossen. BIOS Update gestartet. >> %usbpath%WPI_Log.txt
echo ######################################################################## >> %usbpath%WPI_Log.txt
start /min %usbpath%WPI_Log.txt
msg * "Installationen abgeschlossen! Damit die Treiber aktualisiert werden ist ein Neustart erforderlich. BIOS Update wird nun gestartet wenn vorhanden."
REM *********Starten der BIOS Update Installation********
start /d "%usbpath%_Driver\%SYSMODEL%\" BIOS.exe
start /min %usbpath%WPI_Log.txt
slmgr.vbs /ato
exit
