#!/bin/bash

# Start the keyring daemon and capture its output
# eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

# Explicitly export env vars for downstream processes
# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"
# export DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS"
# export XDG_CURRENT_DESKTOP=GNOME  # or XFCE to match Thunar

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
