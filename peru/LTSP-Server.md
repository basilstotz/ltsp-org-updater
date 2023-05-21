# LTSP-Server

## Vorbereitung

### Hardware

- Einen Computer (Laptop oder Desktop) als Server:
  
  - Prozessor: i3 (oder besser)
  - RAM: 4Gbyte (oder mehr)
  - Disk: 64 GByte (das ist nur ein Testserver, wir wollen k(l)eine Daten speichern)

- Einen Computer (Laptop oder Desktop) als Client: 
  
  - Processor: CoreDuo (oder besser)
  - RAM: 2 GByte (oder mehr)
  - Disk: Beliebig (,denn es wird gar keine Disk benötigt.)

- Ein Switch (Netzwerkverteiler) mit Internet-Anschluss und zwei freien Ports.

- Zwei Netzwerkkabel (um die Computer mit dem Switch zu verbinden)

- Zwei USB-Speichersticks:n 
  
  - einen mit mind. 8 GByte
  - einen mit mind. 16 GByte

### Software

##### Downloads

Alle benötigten Dateien werden aus dem Internet heruntegeladen. Da die Dateien jedoch riesig sind kann das sehr lange dauern. Es ist daher besser diese vorher herunter zu laden:

- Lernstick: https://releases.lernstick.ch/lernstick_debian11_latest.iso   (12 GByte!)
- Debian-LTSP: https://www.amxa.ch/debian/debian-ltsp_latest.iso   (4.5 GByte!)
- balenaEtcher: https://github.com/balena-io/etcher/releases/download/v1.7.9/balenaEtcher-Portable-1.7.9.exe   (123 MByte) 

##### USB-Stick "Lernstick"

Die Datei **lernstick_debian11_latest.iso** wrid ganz normal (mit drag'n'drop im FileExplorer) auf den grösseren USB-Stick kopiert.

##### USB-Stick "Debian-LTSP"

Dieser Stick kann nicht mit dem Windows-Explorer kopiert werden! Es muss das Programm **balenaEtcher** (cf. https://balena.io/etcher ), (welches du bereits herunter geladen hast) verwendet werden. (Das Programm muss nicht installiert werden: Einfach auf die Datei doppelkicken.)

1. Stecke den kleineren US-Stick an deinem Computer ein.
2. Mit mit Doppelklick auf **balenaEtcher-Portable-1.7.9.exe** das Programm starten.
3. Wähle bei **Select Image** die Datei **debian-ltsp_latest.iso**
4. Wähle bei **Select Drive** den eingesteckten US-Stick aus.
5. Dann klickst Du auf **Flash**
6. Das war's dann schon!

(Falls dieser Vorgang nicht richtig funktioniert, kopierst Du die Datei ganz nomal auf den Stick und machen dann "live")
