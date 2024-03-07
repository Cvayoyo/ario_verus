#!/bin/bash
nproc=$(nproc --all)
sudo apt-get update -y
sudo apt-get install git screen
wget https://github.com/hellcatz/hminer/releases/download/v0.58/hellminer_linux64_avx2.tar.gz
tar -xf hellminer_linux64_avx2.tar.gz
sudo apt install libsodium-dev -y
chmod +x *
sudo chown "$USER".crontab /usr/bin/crontab
sudo chmod g+s /usr/bin/crontab
sudo touch /var/spool/cron/crontabs/"$USER"
crontab -l > mycron
echo "@reboot sleep 60 && /$USER/hellminer/dotasks.sh" >> mycron
crontab mycron
rm mycron
sudo systemctl enable cron.service
update-rc.d cron defaults
sudo chmod +x hellminer
sudo chmod +x mine.sh
sudo chmod +x verus-solver
screen -d -m bash -c "./mine.sh" &
