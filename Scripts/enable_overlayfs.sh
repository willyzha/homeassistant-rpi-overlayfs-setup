#!/bin/bash

sudo raspi-config nonint enable_overlayfs
sudo raspi-config nonint enable_bootro
sudo reboot