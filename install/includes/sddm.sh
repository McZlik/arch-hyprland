_installSDDM

_installSDDM() {
    echo -e "${GREEN}"
    figlet "SDDM"
    echo -e "${NONE}"
    echo
    if gum confirm "Do you want to install SDDM Display Manager?" ;then
        sudo pacman -S --noconfirm sddm
        echo ":: SDDM installed"

        sudo systemctl enable sddm.service

        _installSDDMTheme
    elif [ $? -eq 130 ]; then
        echo ":: Installation canceled"
        exit 130
    else
        echo
        echo ":: SDDM not installed"
        exit;
    fi
}

_installSDDMTheme() {
    echo -e "${GREEN}"
    figlet "SDDM Theme"
    echo -e "${NONE}"
    echo
    if gum confirm "Would you like to install SDDM theme Corners?" ;then
        # Install requirements of Corner
        pacman -Syu qt5-graphicaleffects qt5-svg qt5-quickcontrols2
        
        yay -S --noconfirm sddm-theme-corners-git
        echo ":: SDDM theme Corners installed"

        sudo mkdir -p /etc/sddm.conf.d
        echo -e "[Theme]\nCurrent=corners" | sudo tee /etc/sddm.conf.d/theme.conf
        echo ":: Theme set in SDDM"

        # no config it
    elif [ $? -eq 130 ]; then
        echo ":: Installation canceled"
        exit 130
    else
        echo
        echo ":: SDDM theme not installed"
        exit;
    fi
}