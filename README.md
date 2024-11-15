# BeagleBone Green (BBG) konfigurieren
Alle Hinweise beziehen sich auf Linux Mint als Host.
1) Auf https://www.beagleboard.org/distros nach BeagleBone Green filtern. Image ohne Programmierung des des internen 4GB MMC downloaden! Getestet:
   * https://www.beagleboard.org/distros/am3358-debian-10-3-2020-04-06-1gb-sd-console
3) Image mit Rechtsklick entpacken.
4) Image mit Rechtsklick auf die µSD übertragen (Startfähigen USB-Stick erstellen). Getestet mit µSDs von 16GB bis 512GB.
5) Vorhandene Partion auf der µSD mit einem geeigneten Tool erweitern (z.B. GParted).
6) ~~Skript für erweiterte UDev-Regel downloaden und als sudo auf Mint ausführen~~ (Für Mint nicht notwendig!):
   * https://beagleboard.org/static/Drivers/Linux/FTDI/mkudevrule.sh
7) µSD in den BBG einlegen.
8) BBG über Mini-USB mit dem Rechner verbinden (Stromversorgung).
   * Auf dem Host mit dem Terminalprogramm eine SSH-Verbindung zum BBG aufbauen (User/Passwort: debian/temppwd):
     ```bash
     ssh debian@192.168.6.2
     ```
9) Auf dem Beaglebone Green:
   * Evtl. Passwort des Users debian ändern:
     ```bash
     passwd
     ```
   * Update durchführen:
     ```bash
     sudo apt update && sudo apt upgrade
     ```
   * Die Locale einstellen (z.B. de_DE.UTF-8). Die Verarbeitung dauert lange!:
     ```bash
     sudo apt install locales
     sudo dpkg-reconfigure locales
     ```
   * Mit dem User "debian" weiterarbeiten oder neuen User anlegen:
     ```bash
     sudo useradd -m BENUTZERNAME
     sudo passwd BENUTZERNAME
     sudo usermod --shell /bin/bash BENUTZERNAME
     sudo chfn -f "Voller Benutzername" BENUTZERNAME  # durchführen, wenn vollständiger Name erwünscht
     sudo usermod -aG sudo BENUTZERNAME               # optional, wenn neuer User in die SUDOer-Gruppe sein soll
     ```
   * Hinweis: die Ethernet-Schnittstelle des BBG funktioniert auch und bekommt die IP über DHCP
10) Git installieren:
    ```bash
    sudo apt install git
    ```
12) Dieses Repository klonen (für jeden USER):
    ```bash
    cd ~
    git clone https://github.com/boderu/BBG
    ```
14) Skript ausführen:
    ```bash
    ~/BBG/bin/bbg
    ```
    und viel Kaffee trinken. Durch die lange Laufzeit des Skripts wird immer wieder nach dem Passwort gefragt.
16) Für einen unkomplizierten Dateitransfer Nemo öffnen und in der Adressleiste den BBG mounten: sftp://192.168.6.2

# Diagnoseschnittstelle
Der BBG hat neben der Buchsenleiste P9 noch eine 6-polige Stiftleite. Hier ist die interne serielle Schnittstelle UART0 (Txd, RxD und GND) aufgelegt. Während des Bootvorgangs gibt das System auf dieser Schnittstelle alle Konsolenmeldungen aus. Der Spannungspegel ist 3,3V!
1) Eigenen Mint-User der Gruppe dialout hinzufügen. Evtl. auf dem Mint-Host neu einloggen.
2) Passendes FTDI-Kabel (z.B. TTL-232R-3V3) mit 6-poliger Buchsenleiste für 3,3V Digitalpegel and den BBG anschließen. Pin #1 ist in Richtung Ethernet-Buchse.
3) Ein neues Device taucht auf dem Host auf. Bei den Tests: /dev/ttyUSB0. Eine Suche zeigt die seriellen Schnittstellen in /dev.
4) Mit einem geeigneten Terminalprogramm (z.B. Putty, Minicom) oder seriellen Monitorprogramm (Cutecom, Moserial) die Schnittstelle öffnen. Die Spezifikation ist 115200-8-N-1.
5) Nach dem Einschalten des BBG kann man die Ausgaben sehen. Es wird auch ein Login angeboten.

# Sonstiges
Dieses Repository mit den Installationsskripten wird immer wieder mal geändert. Auch wenn die Installation bereits durchlaufen wurde, kann man jederzeit die Skripte ohne Neuinstallation starten:
```bash
cd ~/BBG
git pull
bbg
```
