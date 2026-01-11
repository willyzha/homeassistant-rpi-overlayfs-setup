#!/bin/bash

if cat /boot/firmware/cmdline.txt | grep -q "overlayroot="; then
    echo "OverlayFS is enabled."
    echo "Disabling OverlayFS..."
    sudo raspi-config nonint disable_overlayfs
    sudo reboot
else
    echo "OverlayFS is not enabled."
fi
