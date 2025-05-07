#!/bin/bash
#     _             _     _   _                  
#    / \   _ __ ___| |__ | | | |_   _ _ __  _ __ 
#   / _ \ | '__/ __| '_ \| |_| | | | | '_ \| '__|
#  / ___ \| | | (__| | | |  _  | |_| | |_) | |   
# /_/   \_\_|  \___|_| |_|_| |_|\__, | .__/|_|   
#                               |___/|_|          
#  

# ----------------------------------------------------- 
# Version
# ----------------------------------------------------- 
VERSION=$(cat install/version)

# ----------------------------------------------------- 
# Library
# ----------------------------------------------------- 
source install/includes/library.sh

# ----------------------------------------------------- 
# Header
# ----------------------------------------------------- 
source install/includes/header.sh

# Don't think we need this, we only focus on arch
# # ----------------------------------------------------- 
# # Check supported Linux distribution
# # ----------------------------------------------------- 
# source install/includes/checkdistro.sh

# We have no distro specific library, all is arch
# ----------------------------------------------------- 
# Load Library for used distro
# ----------------------------------------------------- 
# source install/$installer/library.sh

# ----------------------------------------------------- 
# Install required packages
# ----------------------------------------------------- 
source install/install_required.sh

# ----------------------------------------------------- 
# Confirm Start
# ----------------------------------------------------- 
source install/includes/confirm.sh

# ----------------------------------------------------- 
# Preparation
# ----------------------------------------------------- 
source install/includes/preparation.sh

# ----------------------------------------------------- 
# Install Hyprland Packages
# ----------------------------------------------------- 
source install/install_packages.sh

# Don't think backup is needed if we do dotfiles with a dotfile managre
# ----------------------------------------------------- 
# Create Backup
# ----------------------------------------------------- 
# source install/includes/backup.sh

# Not needed if we don't use any settings folders
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

# ----------------------------------------------------- 
# Stow the configuration
# ----------------------------------------------------- 
source install/includes/stow.sh

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