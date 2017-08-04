@echo off
title Automatische Callmobile SIM Karten Bestellung by FaserF - V1.0.0
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

:AutoSetVariables
echo.
echo Lese Settings.txt aus, falls vorhanden.
echo.
if exist C:\Users\%username%\Downloads\ACSKB\Settings.txt goto :Exists
if exist C:\Users\%username%\Downloads\Settings.txt goto :Exists
goto :Infos

:Infos

cls
echo             ============================================================
echo                                    Automatische
echo                           Callmobile SIM Karten Bestellung
echo                           Settings.txt wurde nicht gefunden!
echo             ============================================================
echo.
echo.
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
goto:Start

:Exists
echo exists
SET /p Skin=<Skin.txt
goto :Start

:Start
REM *********Erstelle Script Datei fuer Seite 1***********
echo >C:\Users\%username%\Downloads\ACSKB\page1.vbs set WshShell = WScript.CreateObject("WScript.Shell")
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
echo >>C:\Users\%username%\Downloads\ACSKB\page2.vbs set WshShell = WScript.CreateObject("WScript.Shell")

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


start C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo weiter mit Seite 2
pause
start C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo weiter mit Seite 3
pause
start C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo fertig
goto :Exit

:Exit
rd /s /q C:\Users\%username%\Downloads\ACSKB\
exit