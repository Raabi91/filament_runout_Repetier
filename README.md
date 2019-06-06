# Attention

V3 has some changes to use multiple Sensors wenn you will use  V2 or V1 then delete the old script complete
the delete the old start scripts
V1:
```
# Filament Rounout starten
#sh /home/pi/filament_runout_Repetier/filament.sh &
```

form /ect/rc.local

V2:
'''
#sh /home/pi/filament_runout_Repetier/filament.sh &
'''
from 
'''
#crontab -e
'''

# Filament Runout Script for Repetier Server for Raspberry PI

I Use a 2 wire Endstop Sensor. 1 Wire is on GND the second wire is on A GPIO Pin.
If ohter sensors work let me know ist

## Install:
```
sudo apt install git
git clone https://github.com/Raabi91/filament_runout_Repetier
cd filament_runout_Repetier
sh install_filament.sh
```

Input Your Settings in putty Wenn you will ask:



Server Ip --> normally localhost

Server Port --> normally 3344

Printer Name See --> https://www.repetier-server.com/en/wp-content/uploads/2017/02/s3d2.png

API-key see --> [https://www.repetier-server.com/en/wp-content/uploads/2017/02/33d3.png](https://www.repetier-server.com/en/wp-content/uploads/2017/02/33d3.png)

Sensor --> Is Your sensor (without Filament) normally closed use 0 or normally Open use 1

Pin --> Gpio Pin where your sensor is connected (see [WiringPi_Pinout.md](https://github.com/Raabi91/filament_runout_Repetier/blob/master/WiringPi_Pinout.md) use wPI column for pin number )

number  --> Number or Name to to distinguish the sensors (every sensor must have a unique id)

wait a moment the automatic startup will now set automaticly

then reboot the pi
```
sudo reboot
```
## Install a other sensor:
```
cd filament_runout_Repetier
sh install_filament.sh
```
Input your settings like the first installation
```
sudo reboot
```

## How Upgrade the script
```
cd ~/filament_runout_Repetier
git reset --hard HEAD
git pull
sudo reboot
```

## How delete a sensor:
```
crontab -e
```
an delete the line who is for the sensor. 
The can you delete the folder for the sensor to in /home/pi/filament_runout_Repetier/

after all make a
```
sudo reboot
```

## How Edit my Server and sensor config

Put at "Sensorname" the name of the sensor waht do you use under number in the installation script

```
sudo nano /home/pi/filament_runout_Repetier/sensor_"Sensornumber"/Filament_config.sh

```
or use Ftp and search the file to edit and reupload it. the path is /home/pi/filament_runout_Repetier/"Sensornumber"/

After Edit the Config do a Reboot

```
sudo reboot
```
