@echo off
title Automatische Callmobile SIM Karten Bestellung by FaserF - V0.9.0
color 89

REM *****Hier Hinweis, damit User weiß, dass Tool noch nicht fertig!****
msg * "Tool ist noch nicht fertig. Automatische Erkennung funktioniert noch nicht! Bugs erwartet! Bitte momentan manuellen weg nutzen mit .vbs Dateien!!! "

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
goto :Start

:Exists
echo             ============================================================
echo                              Settings.txt wurde gefunden!
echo                Nichts klicken! Tool führt Programm automatisch durch!
echo             ============================================================
SET /p Skin=<Skin.txt
goto :Start

:Start
REM *********Erstelle Script Datei fuer Seite 1***********
echo set WshShell = WScript.CreateObject("WScript.Shell") >C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "%{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs

echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{ENTER}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 200 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WshShell.SendKeys "{ENTER}" >>C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo WScript.Sleep 6000 >>C:\Users\%username%\Downloads\ACSKB\page1.vbs

REM *********Erstelle Script Datei fuer Seite 2***********
echo set WshShell = WScript.CreateObject("WScript.Shell")

echo WshShell.SendKeys "%{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs

echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "VName" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "NName" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "01" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "01" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "1998" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "P" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "Ausweisnummer" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "Straße" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "1C" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "80331" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "Ort" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "004912345567" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "deine@email.de" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "deine@email.de" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "Hallo123!!" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "Hallo123!!" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "DIE_IBAN" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo set shell = CreateObject("WScript.Shell"):shell.SendKeys "DEINEBANKLEITZAHL" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WshShell.SendKeys " " >>C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page2.vbs

REM *********Erstelle Script Datei fuer Seite 3***********

echo set WshShell = WScript.CreateObject("WScript.Shell") >>C:\Users\%username%\Downloads\ACSKB\page3.vbs

echo WshShell.SendKeys "%{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page3.vbs

echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WshShell.SendKeys " " >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WshShell.SendKeys " " >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WshShell.SendKeys " " >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WshShell.SendKeys "{TAB}" >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WshShell.SendKeys "{ENTER}" >>C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo WScript.Sleep 20 >>C:\Users\%username%\Downloads\ACSKB\page3.vbs

start C:\Users\%username%\Downloads\ACSKB\page1.vbs
echo weiter mit Seite 2
pause
start C:\Users\%username%\Downloads\ACSKB\page2.vbs
echo weiter mit Seite 3
pause
start C:\Users\%username%\Downloads\ACSKB\page3.vbs
echo Alles wurde ausgeführt, Taste drücken um Programm zu beenden....
pause
goto :Exit

:Exit
rd /s /q C:\Users\%username%\Downloads\ACSKB\
exit