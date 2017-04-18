@echo off
title FaserF's Quick Playlist Writer
color 89
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
goto :Start

:Start
Pushd "%1"
chcp 1252
dir /b /o:n *.mp* *.ogg *.fla* *.ape *.aac *.wv *.wav >MixedPlaylist.m3u
copy MixedPlaylist.m3u > C:\Users\%username%\OneDrive\Musik\Wiedergabelisten
start MixedPlaylist.m3u
exit

:About
echo             ======================================
echo                 FaserF's Quick Playlist Writer
echo             ======================================
echo.
echo   		Vielen Dank fuer das Nutzen dieser Batch Datei!
echo.
echo		Wenn du das hier siehst wurde eine Playlist "MixedPlaylist.m3u"
echo		mit allen Liedern aus diesem ordner erstellt.
echo.
pause