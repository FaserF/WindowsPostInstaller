@echo off
title Treiber Installation by Fabian Seitz
color 89

:Default
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
cd C:\Users\%username%\Downloads\
cls
echo             ================================================
echo                               Automatische
echo                   Treiber Installation by Fabian Seitz
echo                              Fuer Windows 10
echo             ================================================
echo.
echo            Als Administrator gestartet?
echo            Downloade Google Chrome ! Stark empfohlen!
echo.
start C:\Users\%username%\Downloads\CustomInstall\EdgeAutoDownload.reg
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
timeout /T 1
start C:\Users\%username%\Downloads\CustomInstall\Enter.vbs
start https://ninite.com/7zip-chrome/ninite.exe
echo Warte auf Beendigung des Downloads, dann ...
timeout /T 10
REM *********Umbenennung da Leerzeichen im Namen********
Ren "C:\Users\%username%\Downloads\Ninite 7Zip Chrome Steam Installer.exe" Ninite-Chrome-7zip-Steam.exe
start Ninite-Chrome-7zip-Steam.exe
echo Warte auf Fertigstellung von Chrome Installation! Wichtig!, dann
timeout /T 60
REM *********Default Browser wird in Chrome geändert und anschließende Wartezeit von ca 4 Sekunden********
start C:\Users\%username%\Downloads\CustomInstall\ChromeDefaultBrowser.vbs
timeout /T 4
taskkill /IM MicrosoftEdge.exe
goto :Start

:Start
cls
cd C:\Users\%username%\Downloads\
echo             ================================================
echo                               Automatische
echo                   Treiber Installation by Fabian Seitz
echo                              Fuer Windows 10
echo             ================================================
echo.
echo            !!!!!!!INTERNET VERBINDUNG WIRD BENOETIGT!!!!!!!
echo            Bitte Geraet auswaehlen!
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

:Auswahl
set asw=0
set /p asw="Bitte Auswahl eingeben: "

if %asw%==1 goto :E6520
if %asw%==2 goto :E6510
if %asw%==3 goto :M6500
if %asw%==4 goto :T5500

if %asw%==0 exit
if %asw%==exit exit

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
goto :exit

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
goto :exit

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
goto :exit

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
goto :exit

:exit
del /q C:\Users\%username%\Downloads\*.exe
rd /s /q C:\Users\%username%\Downloads\CustomInstall\
msg * "Installationen abgeschlossen!"
exit
