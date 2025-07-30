#!/bin/bash
#     _             _     _   _                  
#    / \   _ __ ___| |__ | | | |_   _ _ __  _ __ 
#   / _ \ | '__/ __| '_ \| |_| | | | | '_ \| '__|
#  / ___ \| | | (__| | | |  _  | |_| | |_) | |   
# /_/   \_\_|  \___|_| |_|_| |_|\__, | .__/|_|   
#                               |___/|_|          
#  

set -e pipefail

# ----------------------------------------------------- 
# Version
# ----------------------------------------------------- 
VERSION=$(cat install/version)

# ----------------------------------------------------- 
# Library
# ----------------------------------------------------- 
source install/includes/library.sh

# ----------------------------------------------------- 
# Install required packages
# ----------------------------------------------------- 
source install/install_required.sh

# ----------------------------------------------------- 
# Header
# ----------------------------------------------------- 
source install/includes/header.sh

# ----------------------------------------------------- 
# Confirm Start
# ----------------------------------------------------- 
source install/includes/confirm.sh

# ----------------------------------------------------- 
# Preparation
# ----------------------------------------------------- 
source install/includes/preparation.sh

# ----------------------------------------------------- 
# Hardware Detection
# ----------------------------------------------------- 
source install/includes/hardware_detection.sh

# ----------------------------------------------------- 
# Install Hyprland Packages
# ----------------------------------------------------- 
source install/install_packages.sh

# Don't think backup is needed if we do dotfiles with a dotfile manager
# -----------------------------------------------------
# Create Backup
# -----------------------------------------------------
# source install/includes/backup.sh

# Not needed if we don't use any settings folders
# Also don't think this is needed if we use a dotfile manager
# -----------------------------------------------------
# Restore settings
# -----------------------------------------------------
# source install/includes/restore.sh

# Need dotfiles setup firt
# ----------------------------------------------------- 
# Keyboard
# ----------------------------------------------------- 
# source install/includes/keyboard.sh

# Need dotfiles setup firt
# ----------------------------------------------------- 
# Screen Resolution
# ----------------------------------------------------- 
# source install/includes/monitor.sh

# Need dotfiles setup firt
# ----------------------------------------------------- 
# KVM
# ----------------------------------------------------- 
# source install/includes/kvm.sh

# Copy has to be replaced with stow
# ----------------------------------------------------- 
# Copy the configuration
# ----------------------------------------------------- 
# source install/includes/copy.sh

# TODO: Add a git clone script to collect the dotfiles
# TODO: Redirect the below stow script into the stow.sh of the dotfile repo

# -----------------------------------------------------
# Download and install external dotfiles
# -----------------------------------------------------
source install/includes/dotfiles.sh

# ----------------------------------------------------- 
# Stow the configuration
# ----------------------------------------------------- 
#source install/includes/stow.sh

# ----------------------------------------------------- 
# Enable all services
# ----------------------------------------------------- 
source install/includes/services.sh

# ----------------------------------------------------- 
# Setup SDDM
# ----------------------------------------------------- 
source install/includes/sddm.sh

# ----------------------------------------------------- 
# Reboot
# ----------------------------------------------------- 
source install/includes/reboot.sh