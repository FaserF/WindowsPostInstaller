@echo off
title Treiber Installation by Fabian Seitz
color 89

:Default
md C:\Users\%username%\Downloads\CustomInstall\
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
echo                             Windows 10 Edition
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

start /min https://ninite.com/7zip-chrome/ninite.exe
timeout /T 10
REM *********Umbenennung da Leerzeichen im Namen********
Ren "C:\Users\%username%\Downloads\Ninite 7Zip Chrome Installer.exe" Ninite-Chrome-7zip.exe
start Ninite-Chrome-7zip.exe
echo Warte auf Fertigstellung von Chrome Installation! Wichtig!, dann
timeout /T 60
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
REM *********Default Browser wird in Chrome geändert und anschließende Wartezeit von ca 4 Sekunden********
start C:\Users\%username%\Downloads\CustomInstall\ChromeDefaultBrowser.vbs
timeout /T 4
taskkill /IM MicrosoftEdge.exe

:Start
echo >C:\Users\%username%\Downloads\CustomInstall\Left.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "{LEFT}"
echo >C:\Users\%username%\Downloads\CustomInstall\Tab.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "{TAB}"
echo >C:\Users\%username%\Downloads\CustomInstall\Space.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys " "
echo >C:\Users\%username%\Downloads\CustomInstall\AltF4.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%{f4}"
del /q C:\Users\%username%\Downloads\*.zip
cd C:\Users\%username%\Downloads\
goto :Ermittelung

:Ermittelung
if "%SYSMODEL%"=="Latitude 6520" goto :E6520
if "%SYSMODEL%"=="Latitude 6510" goto :E6510
if "%SYSMODEL%"=="Precision T5500" goto :T5500
if "%SYSMODEL%"=="Precision M6500" goto :M6500
if "%SYSMODEL%"=="Latitude 7480" goto :RenamePC

goto :Auswahl

:Auswahl
start /min https://github.com/FaserF/FaserFQuickTools/releases/download/1.0/RenamePC.vbs
cls
cd C:\Users\%username%\Downloads\
echo             ================================================
echo                               Automatische
echo                   Treiber Installation by Fabian Seitz
echo                              Fuer Windows 10
echo             ================================================
echo.
echo            !!!!!!!INTERNET VERBINDUNG WIRD BENOETIGT!!!!!!!
echo            Dein Geraet lautet: %SYSMODEL%
echo.
echo.
echo   [1]    Latitude E6520 / Notebook
echo   [2]    Latitude E6510 / Notebook
echo   [3]    Precision M6500 / CAD Notebook
echo   [4]    Precision T5500 / CAD PC
echo.
echo   [0]    EXIT / Abbruch
echo.
echo.

set asw=0
set /p asw="Bitte Auswahl eingeben: "

if %asw%==1 goto :E6520
if %asw%==2 goto :E6510
if %asw%==3 goto :M6500
if %asw%==4 goto :T5500

if %asw%==0 goto :RenamePC
if %asw%==exit goto :RenamePC

echo Nächste Auswahl? Bitte eine Zahl von oben waehlen!
goto:Auswahl

:E6520
start https://downloadmirror.intel.com/25977/eng/win64_153343.4425.exe
start https://downloadmirror.intel.com/26653/eng/Wireless_19.50.1_PROSet64_Win10.exe
start https://downloadmirror.intel.com/25016/eng/PROWinx64.exe
start https://downloads.dell.com/FOLDER01669864M/1/Input_Driver_VW486_WN_8.1200.101.134_A07.EXE
echo Warte auf Beendigung des Downloads, dann ...
timeout /T 120
start *.exe
taskkill /IM Chrome.exe /F
echo Installationen gestartet.
pause
echo Dialog schließt sich in 5 Sekunden und loescht Installationsfiles.
del /q C:\Users\%username%\Downloads\*.exe
timeout /T 5
goto :RenamePC

:E6510
start https://downloadmirror.intel.com/21642/eng/PROWinx64.exe
start https://downloadmirror.intel.com/26653/eng/Wireless_19.50.1_PROSet64_Win10.exe
start https://downloads.dell.com/FOLDER01449251M/1/Input_Driver_GGY5W_WN_8.1200.101.127_A06.EXE
echo Warte auf Beendigung des Downloads, dann ...
timeout /T 120
start *.exe
taskkill /IM Chrome.exe /F
echo Installationen gestartet.
pause
echo Dialog schließt sich in 5 Sekunden und loescht Installationsfiles.
del /q C:\Users\%username%\Downloads\*.exe
timeout /T 5
goto :RenamePC

:M6500
start http://support.amd.com/en-us/download/workstation/mobile?oem=Dell&os=Windows+8.1+-+64#pro-driver
start https://downloads.dell.com/input/PREM6500_DRVR_WIN_R280879.EXE
start https://downloads.dell.com/FOLDER01694314M/2/Network_Driver_3MNPT_WN_15.10.0.10_A06.EXE
echo Warte auf Beendigung des Downloads, dann ...
timeout /T 120
start *.exe
taskkill /IM Chrome.exe /F
echo Installationen gestartet.
pause
echo Dialog schließt sich in 5 Sekunden und loescht Installationsfiles.
del /q C:\Users\%username%\Downloads\*.exe
timeout /T 5
goto :RenamePC

:T5500
start http://www.nvidia.de/content/DriverDownload-March2009/confirmation.php?url=/Windows/Quadro_Certified/377.11/377.11-quadro-grid-desktop-notebook-win10-64bit-international-whql.exe&lang=de&type=Quadro
echo Warte auf Beendigung des Downloads, dann ...
timeout /T 120
start *.exe
taskkill /IM Chrome.exe /F
echo Installationen gestartet.
pause
echo Dialog schließt sich in 5 Sekunden und loescht Installationsfiles.
del /q C:\Users\%username%\Downloads\*.exe
timeout /T 5
goto :RenamePC

:RenamePC
del /q C:\Users\%username%\Downloads\*.exe
del /q C:\Users\%username%\Downloads\*.msi
move C:\Users\%username%\Downloads\RenamePC.vbs C:\Users\%username%\Downloads\CustomInstall\RenamePC.vbs
set NEWPCNAME=""
set /p NEWPCNAME="Bitte neuen Computernamen eingeben: (Frei lassen um Namen zu behalten)"

start C:\Users\%username%\Downloads\CustomInstall\RenamePC.vbs %NEWPCNAME%
goto :Exit

:Exit
del /q C:\Users\%username%\Downloads\*.exe
rd /s /q C:\Users\%username%\Downloads\CustomInstall\
slmgr.vbs /dli
msg * "Installationen abgeschlossen!"
exit
