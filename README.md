# BeagleBone Green (BBG) konfigurieren
Alle Hinweise beziehen sich auf Linux Mint als Host.
1) Auf https://www.beagleboard.org/distros nach BeagleBone Green filtern. Image ohne Programmierung des des internen 4GB MMC downloaden! Getestet:
   * https://www.beagleboard.org/distros/am3358-debian-10-3-2020-04-06-1gb-sd-console
3) Image mit Rechtsklick entpacken.
4) Image mit Rechtsklick auf die µSD übertragen (Startfähigen USB-Stick erstellen). Getestet mit einer 16GB µSD.
5) Vorhandene Partion auf der µSD mit einem geeigneten Tool erweitern (z.B. GParted).
6) Skript für erweiterte UDev-Regel downloaden und als sudo auf Mint ausführen:
   * https://beagleboard.org/static/Drivers/Linux/FTDI/mkudevrule.sh
7) µSD in den BBG einlegen.
8) BBG über Mini-USB mit dem Rechner verbinden (Stromversorgung). Eine SSH-Verbindung zum BBG aufbauen: (ssh debian@192.168.6.2) User/Passwort: debian/temppwd
   * Mit dem User "debian" weiterarbeiten oder neuen User anlegen.
   * Evtl. Passwort des Users debian ändern: passwd
   * Hinweis: die Ethernet-Schnittstelle des BBG funktioniert auch und bekommt die IP über DHCP
10) Git installieren:
    * sudo apt install git
12) Dieses Repository klonen (für jeden USER):
    * cd ~
    * git clone https://github.com/boderu/BBG
13) Skript ausführen: ~/BBG/bin/bbg und viel Kaffee trinken. Durch die lange Laufzeit des Skripts wird immer wieder nach dem Passwort gefragt.
14) Für einen unkomplizierten Dateitransfer Nemo öffnen und in der Adressleiste den BBG mounten: sftp:192.168.6.2
