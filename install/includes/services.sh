# Enable all the service we installed that require enabling
# blueman
# zsh
# ...

sudo systemctl enable bluetooth
sudo systemctl enable NetworkManager

# Set zsh as default
chsh -s /bin/zsh