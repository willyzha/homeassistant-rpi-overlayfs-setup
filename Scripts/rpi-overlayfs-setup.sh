#!/bin/bash

# 1. Install Docker
curl -fsSL https://test.docker.com -o /tmp/test-docker.sh
sudo sh /tmp/test-docker.sh
rm /tmp/test-docker.sh

# 2. Install and Configure the fuse-overlayfs Driver
sudo apt-get update
sudo apt-get install fuse-overlayfs

# 3. Configure docker to use fuse-overlayfs as storage-driver
sudo echo -e '{' | sudo tee /etc/docker/daemon.json
sudo echo -e '  "storage-driver": "fuse-overlayfs",' | sudo tee -a /etc/docker/daemon.json
sudo echo -e '  "log-driver": "json-file",' | sudo tee -a /etc/docker/daemon.json
sudo echo -e '  "log-opts": {' | sudo tee -a /etc/docker/daemon.json
sudo echo -e '    "max-size": "500k",' | sudo tee -a /etc/docker/daemon.json
sudo echo -e '    "max-file": "2"' | sudo tee -a /etc/docker/daemon.json
sudo echo -e '  }' | sudo tee -a /etc/docker/daemon.json
sudo echo -e '}' | sudo tee -a /etc/docker/daemon.json

# 4. Restart the Docker Service
sudo systemctl restart docker

# 5. Install portainer
mkdir -p ~/docker/portainer/data
PORTAINER_CONFIG_PATH=$(realpath ~/docker/portainer/data)
sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock --mount type=bind,src=${PORTAINER_CONFIG_PATH},dst=/data portainer/portainer-ce:alpine

sudo apt-get -y install bluez
bluetoothctl -- agent on
bluetoothctl -- discoverable on
bluetoothctl -- scan on

## Next install any docker containers before enabling overlayfs and bootro
#sudo raspi-config nonint enable_overlayfs
#sudo raspi-config nonint enable_bootro
#sudo reboot
