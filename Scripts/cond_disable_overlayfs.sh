#!/bin/bash

if mount -t overlayfs | grep -q "overlay"; then
    echo "OverlayFS is enabled."
    echo "Disabling OverlayFS..."
    sudo raspi-config nonint disable_overlayfs
    sudo reboot
else
    echo "OverlayFS is not enabled."
fi