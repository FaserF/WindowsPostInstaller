# AUTOMATISCHE WINDOWS AFTER INSTALLATION

## About

Dieses Tool wurde erstellt um Windows Neu Installationen zu vereinfachen.
Es gibt eine Auswahl an Geräten, unter welchem man sein Gerät nenn, anschließend lädt es alle benötigten Programme für diesen PC herunter und installiert diese. Bei so vielen wie möglich wird die Installation im silent mode gestartet, sprich keine Aufforderungen um Installationspfad etc anzugeben. Es werden zudem auch die Treiber heruntergeladen und deren Installation gestartet.
.zip Files werden automatisch extrahiert und gestartet. Der Steam Skin wird automatisch heruntergeladen und in den richtigen Steam Ordner kopiert.
Div. Probleme bei automatischen downloads und Installationen wurden gefixt.

## Nutzung

1. Windows Installationsdatenträger erstellen (am besten mit NTLite, um auch hier eine automatische Installation zu erhalten),
2. Anschließend auf den Installationsstick zugreifen und dort in den Ordner 
"\sources\$OEM$\$$\Setup\Scripts" 
gehen. Hier erstellen wir eine Datei namens "SetupComplete.cmd", mit dem Inhalt:

@echo off
rd /q /s "%WINDIR%\Setup\Files"
del /q /f "%0"
echo D | xcopy /s /y "DownloadAutomaticWindowsAfterinstall.bat" "C:\Users\%username%\Downloads\DownloadAutomaticWindowsAfterinstall.bat"
msg * "Um die Installation abzuschliessen bitte die Datei ~DownloadAutomaticWindowsAfterinstall.bat~ im Download Ordner ausfuehren."
exit

(Ist die Datei bereits vorhanden, lediglich die 2. Zeile von oben hinzufügen!)
3. Nun noch die Dateien "DownloadAutomaticWindowsAfterinstall.bat" von diesem Github (https://github.com/FaserF/FaserFQuickTools/blob/master/Windows%20Afterinstall/DownloadAutomaticWindowsAfterinstall.bat) herunterladen und auf den Stick unter 
"\sources\$OEM$\$$\Setup\Scripts" kopieren

## Unterstützte Geräte

- ASUS: Z97-AR; N53SN
- Dell: T5500, M6500, E6510, E6520
- Clevo: 

Du kannst natürlich dein Gerät selbst supporten und eintragen. Nimm dir einfach die fertige Batch Datei oder unseren Code und füge dein Gerät hinzu, es geht ganz einfach, da alles ja bereits für ein anderes Gerät in unserem Code steht.

## Weiteres

Unterstützte Sprachen: Deutsch-German
