@echo off
title Automatische Callmobile SIM Karten Bestellung by FaserF - V0.9.1
color 89

:Default
md C:\Users\%username%\Downloads\ACSKB\
cd C:\Users\%username%\Downloads\ACSKB\
cls
echo             ============================================================
echo                                    Automatische
echo                           Callmobile SIM Karten Bestellung
echo             ============================================================
echo.
echo.
echo.

msg * "Tool ist noch nicht fertig. Automatische Erkennung funktioniert noch nicht! Bugs erwartet! Bitte momentan manuellen weg nutzen mit .vbs Dateien!!! "
goto :Exit

:AutoSetVariables
echo.
echo Lese Infos.txt aus, falls vorhanden.
echo.
REM if exist C:\Users\%username%\Downloads\ACSKB\Infos.txt goto :Exists
REM if exist C:\Users\%username%\Downloads\Infos.txt goto :Exists
if exist C:\Users\%username%\Downloads\ACSKB\Infos.txt msg * "Leider noch nicht funktional! Variablen werden noch nicht erfolgreich ausgelesen. Wird uebersprungen!
if exist C:\Users\%username%\Downloads\Infos.txt msg * "Leider noch nicht funktional! Variablen werden noch nicht erfolgreich ausgelesen. Wird uebersprungen!
goto :Infos

:Infos

cls
echo             ============================================================
echo                                    Automatische
echo                           Callmobile SIM Karten Bestellung
echo                           Infos.txt wurde nicht gefunden!
echo             ============================================================
echo.
echo.
echo             Bitte jetzt in Browser wechseln, anschliessend wieder in dieses Tool wechseln! Wichtig!
echo.

set vname=leer
set /p vname="Bitte Vornamen eingeben: "
set nname=leer
set /p nname="Bitte Nachname eingeben: "
set tag=01
set /p tag="Bitte Geburtsag eingeben (00) eingeben: "
set monat=01
set /p monat="Bitte Geburtsmonat (00) eingeben: "
set jahr=1998
set /p jahr="Bitte Geburtsjahr (0000) eingeben: "
set ausweis=leer
set /p ausweis="Bitte Ausweisnummer (XXXXXX0000) eingeben: "
set srasse=leer
set /p strasse="Bitte Strasse (OHNE Hausnummer!) eingeben: "
set hausnr=leer
set /p hausnr="Bitte Hausnummer eingeben: "
set plz=leer
set /p plz="Bitte PLZ eingeben: "
set ort=leer
set /p ort="Bitte Ort eingeben: "
set telnr=004912345567
set /p telnr="Bitte Telefonnummer (0049XXXXXXXXX) eingeben: "
set email=leer
set /p email="Bitte E-Mail eingeben: "
set pw=Hallo123!!
set /p pw="Bitte Passwort eingeben: "
set iban=leer
set /p iban="Bitte IBAN eingeben: "
set blz=leer
set /p blz="Bitte BLZ eingeben: "

echo Seite 1 starten?
pause
goto :ErstelleDateien

:Exists
echo             ============================================================
echo                              Infos.txt wurde gefunden!
echo                Nichts klicken! Tool führt Programm automatisch durch!
echo             ============================================================
echo.
echo             Bitte jetzt in Browser wechseln, anschliessend wieder in dieses Tool wechseln! Wichtig!
pause
for /f "skip=1" %%G IN (Infos.txt) DO if not defined line set "line=%%G"
set vname=%line%
echo %vname%
for /f "skip=2" %%G IN (Infos.txt) DO if not defined line set "line=%%G"
set nname=%line%
echo %nname%
for /f "skip=3" %%G IN (Infos.txt) DO if not defined line set "line=%%G"
set tag=%line%
echo %tag%
for /f "skip=4" %%G IN (Infos.txt) DO if not defined line set "line=%%G"
set monat=%line%
echo %monat%
for /f "skip=5" %%G IN (Infos.txt) DO if not defined line set "line=%%G"
set jahr=%line%
echo %jahr%
for /f "skip=6" %%G IN (Infos.txt) DO if not defined line set "line=%%G"
set ausweis=%line%
echo %ausweis%
for /f "skip=7" %%G IN (Infos.txt) DO if not defined line set "line=%%G"
set strasse=%line%
echo %strasse%
for /f "skip=8" %%G IN (Infos.txt) DO if not defined line set "line=%%G"
set hausnr=%line%
echo %hausnr%
for /f "skip=9" %%G IN (Infos.txt) DO if not defined line set "line=%%G"
set plz=%line%
echo %plz%
for /f "skip=10" %%G IN (Infos.txt) DO if not defined line set "line=%%G"
set ort=%line%
echo %ort%
for /f "skip=11" %%G IN (Infos.txt) DO if not defined line set "line=%%G"
set telnr=%line%
echo %telnr%
for /f "skip=12" %%G IN (Infos.txt) DO if not defined line set "line=%%G"
set email=%line%
echo %email%
for /f "skip=13" %%G IN (Infos.txt) DO if not defined line set "line=%%G"
set pw=%line%
echo %pw%
for /f "skip=14" %%G IN (Infos.txt) DO if not defined line set "line=%%G"
set iban=%line%
echo %iban%
for /f "skip=15" %%G IN (Infos.txt) DO if not defined line set "line=%%G"
set blz=%line%
echo %blz%
goto :ErstelleDateien

:ErstelleDateien
REM *********Erstelle Script Datei fuer Seite 1***********
echo >C:\Users\%username%\Downloads\ACSKB\page1.vbs set WshShell = WScript.CreateObject("WScript.Shell")
echo. >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "%{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20

echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{ENTER}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 200
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WshShell.SendKeys "{ENTER}"
echo >>C:\Users\%username%\Downloads\ACSKB\page1.vbs WScript.Sleep 6000

REM *********Erstelle Script Datei fuer Seite 2***********
echo >C:\Users\%username%\Downloads\ACSKB\page2.vbs set WshShell = WScript.CreateObject("WScript.Shell")
echo. >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "%{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20

echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%vname%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%nname%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%tag%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%monat%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%jahr%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "P"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%ausweis%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%strasse%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%hausnr%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%plz%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%ort%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%telnr%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%email%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%email%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%pw%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%pw%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%iban%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set shell = CreateObject("WScript.Shell"):shell.SendKeys "%blz%"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WshShell.SendKeys " "
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs WScript.Sleep 20

REM *********Erstelle Script Datei fuer Seite 3***********

echo >C:\Users\%username%\Downloads\ACSKB\page3.vbs set WshShell = WScript.CreateObject("WScript.Shell")
echo. >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WshShell.SendKeys "%{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WshShell.SendKeys " "
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WshShell.SendKeys " "
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WshShell.SendKeys " "
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WshShell.SendKeys "{TAB}"
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WScript.Sleep 20
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WshShell.SendKeys "{ENTER}"
echo >>C:\Users\%username%\Downloads\ACSKB\page3.vbs WScript.Sleep 20
goto :Start

:Start
start C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo weiter mit Seite 2
ping 127.0.0.1 -n 12 > nul
start C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo weiter mit Seite 3
ping 127.0.0.1 -n 12 > nul
start C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo Alles wurde ausgeführt, Taste drücken um Programm zu beenden....
ping 127.0.0.1 -n 12 > nul
goto :Exit

:Exit
rd /s /q C:\Users\%username%\Downloads\ACSKB\
exit