#!/bin/bash

sudo apt install wiringpi

echo -e "\n\n========= Filament Runout - Installation Script ==========="
echo -e "\n\nServer Ip:"
read ip
echo "Server port:"
read port
echo "Printer Name:"
read printer
echo "API Key:"
read apikey
echo "Sensor (normaly open(1)/closed(0)):"
read sensor
echo "Gpio Pin use WiringPi Pin:"
read pin


if [ -z "$ip" ] ; then
    echo 'Server IP Eingeben!'
    exit 1
fi
if [ -z "$port" ] ; then
    echo 'Server port Eingeben!'
    exit 1
fi
if [ -z "$printer" ] ; then
    echo 'Printer Name Eingeben!'
    exit 1
fi
if [ -z "$apikey" ] ; then
    echo 'apikey Eingeben Eingeben!'
    exit 1
fi
if [ -z "$sensor" ] ; then
    echo 'normaly Open (0) or Closed (1)!'
    exit 1
fi
if [ -z "$pin" ] ; then
    echo 'Gpio pin Eingeben!'
    exit 1
fi


sleep 1
echo "#######Server/Sensor Config#########" > Filament_config.sh

echo "ip="$ip"" >> Filament_config.sh

echo "port="$port"" >> Filament_config.sh

echo "printer="$printer"" >> Filament_config.sh

echo "apikey="$apikey"" >> Filament_config.sh

echo "sensor="$sensor"" >> Filament_config.sh

echo "pin="$pin"" >> Filament_config.sh

echo "#######Config End#########" >> Filament_config.sh
sleep 1
chmod 755 filament.sh
chmod 755 Filament_config.sh

echo -e "\n\n========= Filament Runout - Installation Autostart ==========="

crontab -u pi -l | grep -v 'sh /home/pi/filament_runout_Repetier/filament.sh &'  | crontab -u pi -
sleep 1
(crontab -u pi -l ; echo "@reboot sh /home/pi/filament_runout_Repetier/filament.sh &") | crontab -u pi -

exit 1
