#!/bin/bash

sudo raspi-config nonint disable_overlayfs
sudo raspi-config nonint disable_bootro
sudo reboot