@echo off
title Windows Driver & Programm Installer by FaserF
color 89
:Default
cd C:\Users\%username%\Downloads\
cls
echo             ============================================================
echo                                    Automatische
echo                   Treiber und Programm Installation by Fabian Seitz
echo                         ----> Thanks to @KaiSMR und Luis
echo             ============================================================
echo.
echo            Lade neueste Version herunter....
echo.
echo.
REM ********* Das hier ist ein dummy File nur um das neueste release herunterzuladen und zu starten ********
start https://github.com/FaserF/FaserFQuickTools/releases/download/1.0/AutomaticWindowsAfterinstall.exe
timeout /T 4
exit
