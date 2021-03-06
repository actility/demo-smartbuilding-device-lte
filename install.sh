#! /bin/sh

# tested with raspbian ISO 2016-09-23-raspbian-jessie.img
# run the following command to perform install:
# cd /home/pi && git clone https://github.com/actility/demo-smartbuilding-device && chmod +x demo-smartbuilding-device/install.sh && ./demo-smartbuilding-device/install.sh

echo '***************************************'
echo '* Demo SmartBuilding Device installer *'
echo '* Powered with LoRa by Actility       *'
echo '***************************************'

sudo apt-get update

# sudo apt-get upgrade -y
# sudo apt-get dist-upgrade �y

echo 'setxkbmap fr' >> /home/pi/.profile

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo sed -i '/README/alcd_rotate=2' /boot/config.txt

sudo sed -i '/# Seat defaults/axserver-command=X -nocursor -s 0 -dpms' /etc/lightdm/lightdm.conf

echo '#!/bin/bash
cd /home/pi/demo-smartbuilding-device && node server.js' >> /home/pi/launcher.sh
chmod +x /home/pi/launcher.sh

mv /home/pi/.config/lxsession/LXDE-pi/autostart /home/pi/.config/lxsession/LXDE-pi/autostart.bak
echo '@xset s noblank
@xset s off
@xset -dpms
@lxpanel --profile LXDE-pi
@pcmanfm --desktop --profile LXDE-pi
@xscreensaver -no-splash
@point-rpi
@lxterminal -e "/home/pi/launcher.sh"
@chromium-browser --disable-infobars --disable-session-crashed-bubble --start-fullscreen http://localhost:8080 ' >> /home/pi/.config/lxsession/LXDE-pi/autostart

cd /home/pi/demo-smartbuilding-device && npm install

sudo reboot