@echo off
title Treiber Installation by Fabian Seitz
color 89
:Start
cd C:\Users\%username%\Downloads\
cls
echo             ================================================
echo                   Treiber Installation by Fabian Seitz
echo                  				 Windows 10
echo             ================================================
echo.
echo            Bitte Geraet auswaehlen!
echo.
echo.
echo   [1]    Latitude E6520
echo   [2]    Latitude E6510
echo   [0]    EXIT / Abbruch
echo.
echo.

:Auswahl
set asw=0
set /p asw="Bitte Auswahl eingeben: "

if %asw%==1 goto :E6520
if %asw%==2 goto :E6510

if %asw%==S goto :Settings
if %asw%==0 exit
if %asw%==exit exit

echo Nächste Auswahl? Bitte eine Zahl von oben waehlen!
goto:Auswahl

:E6520
start https://downloadcenter.intel.com/downloads/eula/25977/Intel-Graphics-Driver-for-Windows-10-and-Windows-7-8-1-15-33-?httpDown=https%3A%2F%2Fdownloadmirror.intel.com%2F25977%2Feng%2Fwin64_153343.4425.exe
start https://downloadcenter.intel.com/downloads/eula/26653/Intel-PROSet-Wireless-Software-and-Drivers-for-Windows-10?httpDown=https%3A%2F%2Fdownloadmirror.intel.com%2F26653%2Feng%2FWireless_19.50.1_PROSet64_Win10.exe
start https://downloadcenter.intel.com/downloads/eula/25016/Intel-Network-Adapter-Driver-for-Windows-10?httpDown=https%3A%2F%2Fdownloadmirror.intel.com%2F25016%2Feng%2FPROWinx64.exe
echo Warte auf Beendigung des Downloads, dann ...
pause
start *.exe
echo Installationen gestartet.
pause
echo Dialog schließt sich in 5 Sekunden und loescht Installationsfiles.
del /q C:\Users\%username%\Downloads\*.exe
ping -n 6 127.0.0.1 > nul

:E6510
echo Warte auf Beendigung des Downloads, dann ...
start *.exe
echo Installationen gestartet.
pause
echo Dialog schließt sich in 5 Sekunden und loescht Installationsfiles.
del /q C:\Users\%username%\Downloads\*.exe
ping -n 6 127.0.0.1 > nul
exit