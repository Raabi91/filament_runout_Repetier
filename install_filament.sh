#!/bin/bash

sudo apt install wiringpi

echo -e "\n\n========= Filament Runout - Installation Script ==========="
echo -e "\n\n========= pleas input your settings description on github ==========="
echo -e "\n\nyour server Ip:"
read ip
echo "your server port:"
read port
echo "your printername:"
read printer
echo "your apikey:"
read apikey
echo "your sensor (normaly open(1)/closed(0)):"
read sensor
echo "your Gpio Pin (use WiringPi Pin):"
read pin

echo -e "\n\n========= check variables ==========="
if [ -z "$ip" ] ; then
    echo 'please enter server IP!'
    exit 1
fi
if [ -z "$port" ] ; then
    echo 'please enter server port!'
    exit 1
fi
if [ -z "$printer" ] ; then
    echo 'please enter printername!'
    exit 1
fi
if [ -z "$apikey" ] ; then
    echo 'please enter apikey!'
    exit 1
fi
if [ -z "$sensor" ] ; then
    echo 'please enter sensor (normaly open (0) or closed (1))!'
    exit 1
fi
if [ -z "$pin" ] ; then
    echo 'please enter Gpio pin !'
    exit 1
fi

echo -e "\n\n========= creat Filament_config.sh ==========="
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

echo -e "\n\n========= installation autostart ==========="

crontab -u pi -l | grep -v 'sh /home/pi/filament_runout_Repetier/filament.sh &'  | crontab -u pi -
sleep 1
(crontab -u pi -l ; echo "@reboot sh /home/pi/filament_runout_Repetier/filament.sh &") | crontab -u pi -

echo -e "\n\n========= installation end ==========="

exit 1
