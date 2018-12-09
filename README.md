#### Filament Rounout Script for Repetier Server

I Use a 2 wire Endstop Sensor. 1 Wire is on GND the second wire is on A GPIO Pin

#### Install:
```
git clone https://github.com/Raabi91/filament_rounout_Repetier
cd filament_rounout_Repetier
sh install_filament.sh
```

Input You Settings:



Server Ip --> normall localhost

Server Port --> normally 3344

Printer Name See --> https://www.repetier-server.com/en/wp-content/uploads/2017/02/s3d2.png

APIkey see --> [https://www.repetier-server.com/en/wp-content/uploads/2017/02/33d3.png](https://www.repetier-server.com/en/wp-content/uploads/2017/02/33d3.png)

Sensor --> Is Your sensor (without Filament) normally closed use 0 or normally Open use 1

Pin --> Gpio Pin where your sensor is connected (see [http://wiringpi.com/pins/](http://wiringpi.com/pins/) use WiringPi pin )



then we need the automatic start for the script:
```
sudo nano /etc/rc.local
```
put this line's

```
# Filament Rounout starten
sh /home/pi/filament_rounout_Repetier/filament.sh &
```
bevor
```
exit 0
```
Save with Strg+O

exit with Strg+X

then reboot the pi
```
sudo Reboot
```

#### How Upgrade the script
```
cd ~/filament_rounout_Repetier
git pull
sudo reboot
```


#### How Edit my Server and sensor config
```
sudo nano /home/pi/filament_rounout_Repetier/Filament_config.sh
```
