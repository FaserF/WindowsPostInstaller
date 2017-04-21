@echo off
title Treiber Installation by Fabian Seitz
color 89

:Start
cls
cd C:\Users\%username%\Downloads\
echo             ================================================
echo                               Automatische
echo                   Treiber Installation by Fabian Seitz
echo                              Fuer Windows 7
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
echo   [U]    Windows 7 Update Pack
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

if %asw%==U goto :Update
if %asw%==0 goto :exit
if %asw%==exit goto :exit

echo Nächste Auswahl? Bitte eine Zahl von oben waehlen!
goto:Auswahl

:E6520
start https://ninite.com/7zip-chrome/ninite.exe
echo Warte auf Beendigung des Downloads, dann ...
pause
Ren "C:\Users\%username%\Downloads\Ninite 7Zip Chrome Installer.exe" Ninite-7zip-Chrome.exe
start C:\Users\%username%\Downloads\Ninite-7zip-Chrome.exe
echo Warte auf Beendigung der Chrome Installation, dann ...
pause
start ChromeDefaultBrowser.vbs
echo Bei Fehlermeldung konnte nicht gefunden werden bitte Chrome manuell als Standard Browser einstellen! Einstellungen -> Apps -> Standard-Apps
ping -n 3 127.0.0.1 > nul
start https://downloadmirror.intel.com/25977/eng/win64_153343.4425.exe
start https://downloadmirror.intel.com/26656/eng/Wireless_19.50.0_PROSet64_Win7.exe
start https://downloadmirror.intel.com/18713/eng/PROWinx64.exe
start https://downloads.dell.com/input/DRVR_WIN_R311554.EXE
echo Warte auf Beendigung des Downloads, dann ...
pause
start *.exe
taskkill /IM iexplore.exe
echo Installationen gestartet.
pause
echo Dialog schließt sich in 5 Sekunden und loescht Installationsfiles.
del /q C:\Users\%username%\Downloads\*.exe
ping -n 6 127.0.0.1 > nul
goto :exit

:E6510
start E:\E6510-WLAN-Driver.exe
start E:\E6510-EThernet-Driver.exe
echo Warte auf Beendigung der Installationen, dann ...
pause
start https://ninite.com/7zip-chrome/ninite.exe
echo Warte auf Beendigung des Downloads, dann ...
pause
Ren "C:\Users\%username%\Downloads\Ninite 7Zip Chrome Installer.exe" Ninite-7zip-Chrome.exe
start C:\Users\%username%\Downloads\Ninite-7zip-Chrome.exe
echo Warte auf Beendigung der Chrome Installation, dann ...
pause
start ChromeDefaultBrowser.vbs
echo Bei Fehlermeldung konnte nicht gefunden werden bitte Chrome manuell als Standard Browser einstellen! Einstellungen -> Apps -> Standard-Apps
ping -n 3 127.0.0.1 > nul
start https://downloads.dell.com/video/VIDEO_DRVR_WIN_R296701.EXE
start https://downloads.dell.com/FOLDER01449251M/1/Input_Driver_GGY5W_WN_8.1200.101.127_A06.EXE
echo Warte auf Beendigung des Downloads, dann ...
pause
start *.exe
taskkill /IM iexplore.exe
echo Installationen gestartet.
echo Dialog schließt sich in 5 Sekunden und loescht Installationsfiles.
del /q C:\Users\%username%\Downloads\*.exe
ping -n 6 127.0.0.1 > nul
goto :exit

:M6500
start https://ninite.com/7zip-chrome/ninite.exe
echo Warte auf Beendigung des Downloads, dann ...
pause
Ren "C:\Users\%username%\Downloads\Ninite 7Zip Chrome Installer.exe" Ninite-7zip-Chrome.exe
start C:\Users\%username%\Downloads\Ninite-7zip-Chrome.exe
echo Warte auf Beendigung der Chrome Installation, dann ...
pause
start ChromeDefaultBrowser.vbs
echo Bei Fehlermeldung konnte nicht gefunden werden bitte Chrome manuell als Standard Browser einstellen! Einstellungen -> Apps -> Standard-Apps
ping -n 3 127.0.0.1 > nul
start http://support.amd.com/en-us/download/workstation/mobile?oem=Dell&os=Windows+7+-+64
start https://downloads.dell.com/input/PREM6500_DRVR_WIN_R280879.EXE
start https://downloads.dell.com/FOLDER01694314M/2/Network_Driver_3MNPT_WN_15.10.0.10_A06.EXE
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
start https://ninite.com/7zip-chrome/ninite.exe
echo Warte auf Beendigung des Downloads, dann ...
pause
Ren "C:\Users\%username%\Downloads\Ninite 7Zip Chrome Installer.exe" Ninite-7zip-Chrome.exe
start C:\Users\%username%\Downloads\Ninite-7zip-Chrome.exe
echo Warte auf Beendigung der Chrome Installation, dann ...
pause
start ChromeDefaultBrowser.vbs
echo Bei Fehlermeldung konnte nicht gefunden werden bitte Chrome manuell als Standard Browser einstellen! Einstellungen -> Apps -> Standard-Apps
ping -n 3 127.0.0.1 > nul
start http://www.nvidia.de/content/DriverDownload-March2009/confirmation.php?url=/Windows/Quadro_Certified/377.11/377.11-quadro-grid-desktop-notebook-win10-64bit-international-whql.exe&lang=de&type=Quadro
start https://downloads.dell.com/FOLDER00308409M/1/Network_Driver_YM9NC_WN32_17.0.2_A00.EXE
echo Warte auf Beendigung des Downloads, dann ...
pause
start *.exe
taskkill /IM iexplore.exe
echo Installationen gestartet.
echo Dialog schließt sich in 5 Sekunden und loescht Installationsfiles.
del /q C:\Users\%username%\Downloads\*.exe
ping -n 6 127.0.0.1 > nul
goto :exit

:Update
start http://winfuture.de/downloadvorschalt,2671.html
goto :Start

:exit
msg * "Installationen abgeschlossen! Windows ist NICHT aktiviert. Bitte Key auf Rückseite / unterhalb des Akkus von dem Notebook nutzen!"
exit
