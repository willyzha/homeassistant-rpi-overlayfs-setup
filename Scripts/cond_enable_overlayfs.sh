#!/bin/bash

if mount -t overlayfs | grep -q "overlay"; then
    echo "OverlayFS is enabled."
else
    echo "OverlayFS is not enabled."
    echo "Enabling OverlayFS..."
    sudo raspi-config nonint enable_overlayfs
    sudo raspi-config nonint enable_bootro
    sudo reboot
fi
