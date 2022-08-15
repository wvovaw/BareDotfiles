#!/bin/env bash
wget -O "discord.tar.gz" "https://discord.com/api/download?platform=linux&format=tar.gz"
tar xf discord.tar.gz
sudo yes | cp -rvR Discord /usr/share/
sudo rm /bin/Discord
sudo ln -s /usr/share/Discord/Discord /bin/Discord
rm -rf ./Discord
rm ./discord.tar.gz
