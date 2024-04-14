#!/bin/bash
nproc=$(nproc --all)
sudo apt-get update -y
sudo apt-get install git screen
sudo apt install libsodium-dev -y
chmod +x *
sudo chown "$USER".crontab /usr/bin/crontab
sudo chmod g+s /usr/bin/crontab
sudo touch /var/spool/cron/crontabs/"$USER"
crontab -l > mycron
echo "@reboot sleep 240 && /$USER/ario_verus/dotasks.sh" >> mycron
echo "*/10 * * * * /$USER/ario_verus/reboot_script.sh" >> mycron
crontab mycron
rm mycron
sudo systemctl enable cron.service
update-rc.d cron defaults
sudo chmod +x *
screen -d -m bash -c "cd ario_verus ; ./mine.sh" &
