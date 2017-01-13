@echo off
title FaserF's Flashable ZIP Creator V1.0.0
color 89
mkdir C:\Users\%username%\Desktop\FlashableZIPFolder\META-INF\com\google\android
mkdir C:\Users\%username%\Desktop\FlashableZIPFolder\system\app
copy updater-script.txt > C:\Users\%username%\Desktop\FlashableZIPFolder\META-INF\com\google\android\updater-script.txt
:Start
cls
echo             =================================
echo             FaserF's Flashable ZIP Creator
echo             =================================
echo.
echo   [1]    Write your Name in the Recovery Installing Log
echo   [2]    Deleting System Apps
echo   [3]    Installing Apps as System App
echo   [4]    
echo   [5]    
echo   [6]    
echo   [7]    
echo   [8]    
echo   [9]    
echo   [10]   
echo   [11]   
echo .
echo   [S]    Settings
echo   [0]    EXIT
echo .
echo            INFO: Welcome to my Tool :)
echo .

:Auswahl1
set asw=0
set /p asw="Bitte Auswahl eingeben: "

if %asw%==1 goto :Name
if %asw%==2 goto :Delete
if %asw%==3 goto :Install
if %asw%==S goto :Settings
if %asw%==0 goto :Exit
if %asw%==exit goto :Exit

echo Nächste Auswahl? Bitte eine Zahl von oben waehlen!
goto:Auswahl1

:Name
Set "inputFile=updater-script.txt"
Set "outputFile=%updater-script%-TMP.txt"

>"%outputFile%" (
   For /f "delims=" %%* in (
     'find.exe /n /v ""^<"%inputFile%"'
     ) Do (
     Call:GoParse "''%%*"
     (echo\!WriteLine!)
   )   
)
pause
::# replace original file (! remove 'rem' !)
rem Move /Y "%outputFile%" "%inputFile%"
pause

:end   ----------

goto:eof
:GoParse lines
(Set /a i = %i% +1)&(Set "WriteLine=")
(Set Line=%1)&(Set Line=!Line:''[%i%]=!)

(Set EQsn==)
>nul (@echo\%Line% |Find.exe /i "username=" |Find.exe /i "password="
   )&&(For /f "tokens=3,5 delims=/%EQsn% " %%a in (
     'cmd /c @echo\%line%') Do (
     (Set Line=!Line:%%~a=%%username%%!)
     (Set Line=!Line:%%~b=%%username%%!)
   )
)
(Set WriteLine=!Line:~1,-1!)
goto:Start

:DoNotUse
<C:\Users\%username%\Desktop\FlashableZIPFolder\META-INF\com\google\android\updater-script.txt
set /p VAL= Input your displayed Name:
set VAL2= ui_print ("User: %VAL");
echo %VAL2    %line10%> C:\Users\%username%\Desktop\FlashableZIPFolder\META-INF\com\google\android\updater-script.txt
echo // %VAL    %line6%>> C:\Users\%username%\Desktop\FlashableZIPFolder\META-INF\com\google\android\updater-script.txt
pause
goto :Start

:DontUse
//FOR /F "delims=" %a in (C:\Users\%username%\Desktop\FlashableZIPFolder\META-INF\com\google\android\updater-script.txt) do @echo 127.0.0.1   %a >>updater-script.txt

echo done
pause
goto :Start

:Delete
cls
echo             =================================
echo             FaserF's Flashable ZIP Creator
echo             =================================
echo.
echo		What do you want to delete?
echo.
echo   [1]    YouTube
echo   [2]    Deleting System Apps
echo   [3]    Installing Apps as System App
echo   [4]    
echo   [5]    
echo   [0]    Zurueck

:Auswahl2
set asw=0
set /p asw="Bitte Auswahl eingeben: "

if %asw%==1 
if %asw%==2 
if %asw%==3 
if %asw%==S 
if %asw%==0 goto :Start

echo Nächste Auswahl? Bitte eine Zahl von oben waehlen!
goto:Auswahl2  