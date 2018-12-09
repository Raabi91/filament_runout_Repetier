#!/bin/bash

sudo apt-get purge wiringpi
hash -r

echo -e "\n\n========= Filament - Installation Script ==========="
echo -e "\n\nServer Ip:"
read ip
echo "Server port"
read port
echo "Printer Name"
read printer
echo "API Key"
read apikey
echo "Sensor (normaly open(1)/closed(0))"
read sensor
echo "gpio Pin Use WiringPi Pin"
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
echo "#######Variable#########" > Filament_config.sh
sleep 1
echo "ip=$ip2" >> Filament_config.sh
sleep 1
echo "port=$port" >> Filament_config.sh
sleep 1
echo "printer=$printer" >> Filament_config.sh
sleep 1
echo "apikey=$apikey" >> Filament_config.sh
sleep 1
echo "sensor=$sensor" >> Filament_config.sh
sleep 1
echo "pin=$pin" >> Filament_config.sh
sleep 1
echo "#######Variable End#########" >> Filament_config.sh
sleep 1
chmod 755 filament.sh
chmod 755 Filament_config.sh

exit 1
