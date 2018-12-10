# Filament Runout Script for Repetier Server for Raspberry PI

I Use a 2 wire Endstop Sensor. 1 Wire is on GND the second wire is on A GPIO Pin. 
If ohter sensors work let me know ist

## Install:
```
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



then we need a automatic start for the script:
```
sudo nano /etc/rc.local
```
put this line's

```
# Filament Runout starten
sh /home/pi/filament_runout_Repetier/filament.sh &
```
bevor
```
exit 0
```
Save with Strg+O

exit with Strg+X

then reboot the pi
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


## How Edit my Server and sensor config
```
sudo nano /home/pi/filament_runout_Repetier/Filament_config.sh
```

After Edit the Config do a Reboot

```
sudo reboot
```
