# AUTOMATISCHE WINDOWS POST INSTALLATION

## Beschreibung

Dieses Projekt hat denn Sinn die Windows Installation und besonders die Nachinstallation (Post Installation) nach Abschluss der Windows Installation auf dem PC zu vereinfachen.
Das Tool ist in der Lage diverse Aufgaben abzuarbeiten wie u.a.:
- Google Chrome Installation und Standard Browser konfigurieren (auch mit neuen Win10 kompatibel)
- Installation von nützlichen Programmen
- Automatische Hardware Erkennung und Treiber Installation
- Auswahl zwischen 2 Steam Skins und automatische Installation
- Windows Aktivierung

## Nutzung

Wie kann ich das Programm nutzen?
1. Lade dir WindowsPostInstaller von meinem GitHub herunter (https://github.com/FaserF/WindowsPostInstaller/releases/latest)
2. Erstelle einen Windows USB Stick (http://go.microsoft.com/fwlink/?LinkId=691209)
3. Kopiere die autounattended.xml auf das Hauptverzeichnis deines USB Sticks (https://github.com/FaserF/WindowsPostInstaller/tree/master/autounattend)
4. Kopiere die Datei WindowsPostInstaller.exe auf deinen USB Stick.
5. Installiere Windows, indem du den USB Stick bootest
6. Öffne, sobald du auf dem Desktop bist, deinen USB Stick Laufwerk und starte die WindowsPostInstaller.exe
7. Warte auf Abschluss des Downloads meiner neuesten Version des WindowsPostInstaller.exe
8. Wenn du die Steam Skin Installation auch automatisch machen lassen willst, ohne Nachfrage, erstelle vor dem Ausführen der .exe eine Datei mit dem Namen "skin.txt" im Downloads Ordner und schreibe dort folgendes hinein:
	Threshold oder Metro oder skip oder kein oder deinstallieren
9. Starte das Programm und klicke/tippe nur bei Aufforderung in den Installation Prozess nicht zu stören!


## Was machen die Programme?

Autounattended.xml:
Diese Datei wird von Windows während der Installation ausgelesen, es sagt Windows bestimmte Sachen automatisch zu erledigen während der Installation (keine EULA, Versuch Widnows zu aktivieren usw)

WindowsPostInstaller.exe/bat
Die Hauptdatei meines Projektes und der Großteil meiner Arbeit. Hier spielt sich das meiste ab. Mein Projekt wird in der .bat stetig fortgeführt und weiter entwickelt als Hobby Projekt und ist für jeden einsichtbar und steht zur weiter Nutzung bereit. Die .exe hat nur den Nutzen, dass der Download nicht von Edge und Chrome aus Sicherheitsgründen geblockt wird.

Get_WPI_WinDefender.zip
Dieses Programm dient lediglich dazu, die neueste Version von GitHub herunter zu laden und WindowsDefender zu umgehen, da mein Script teilweise fälschlicherweise als Virus erkannt wird.
Warum sollte ich nicht gleich die .exe auf meinen Stick kopieren? -> Weil die meisten ihren Windows Stick anschließend herum liegen lassen und irgend wann wieder verwenden. Nun wäre eine veraltete Version meines Tools auf deinem Stick.

WindowsPostInstaller-Business.bat
Dies ist eine Modifizierte Version meines Scripts, speziell für Firmengeräte. Hier ist ein vereinfachter Installationsprozess und weiteres vorhanden.

## Welche Programme werden installiert?
# Hauptinstallation (wird auf jedem Gerät installiert)
Google Chrome (wird als Standard Browser gesetzt)
7Zip
Steam (optional, kann auch während oder vor dem Start des Scritps abgewählt werden)
Steam Skin deiner Wahl
Driver Booster
Nvidia GeforceExperience
Discord
Lightshot

# Geraete spezifische Programme
Ab hier ist es deine Wahl was installiert werden soll, mein Script ist nach meinen Bedürfnissen angepasst, willst du dein eigenes Gerät hinzufügen, kannst du das genau so machen wie du willst

## Unterstützte Geräte

*Für Hauptinstallation werden alle Geräte unterstützt. Geräte Spezifische Features werden nur für folgende Geräte unterstützt:
- ASUS: Z97-AR; Maxmimus Ranger VIII
- Dell: T5500, M6500, M4700, E7450, E7440

Du kannst natürlich dein Gerät selbst unterstützen und eintragen. Nimm dir einfach die fertige Batch Datei oder unseren Code und füge dein Gerät hinzu, es geht ganz einfach, da alles ja bereits für ein anderes Gerät in unserem Code steht. Wenn du dein Gerät in meiner offiziellen Liste finden möchtest, schicke mir den Code als Ticket auf meinem Github.

## Probleme / Q&A

Q: Das Programm sagt es kann das Verzeichnis deines Windows User Namen nicht finden.
A: Du darfst während der Windows Installation keinen User Name mit einem Leerzeichen wählen wie Max Mustermann.
Nenne dich einfach nur mit dem Vornamen und zur Not später wieder in den Windows Einstellungen um!

Q: Das Programm hat zu kurze Wartezeiten!
A: Sorry, ich habe eine SSD als Vorlage genommen, wenn deine Festplatte eine HDD ist, dauern Installationsprozeduren leider länger, was mein Tool nicht erwartet.

Q: Das Programm führt bestimmte Sachen nicht automatisch aus (Wie Administrator Nachfrage)
A: Du nutzt die .bat Datei oder hast der .exe Admin Rechte verweigert. Mein Tool benötigt Administrator Rechte!

Solltest du weitere Probleme haben, bitte ich dich einfach auf meinem GitHub ein Ticket zu öffnen und ich werde mich darum kümmern.

## Weiteres

Unterstützte Sprachen: Deutsch-German
Empfohlenes Programm für Windows ISO: Ntlite (Das Programm lässt dich die ISO nach deinen Bedürfnissen anpassen, vorinstallierte Apps entfernen & mehr!)
