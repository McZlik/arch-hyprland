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
    if gum confirm "Would you like to install SDDM theme Eucalyptus Drop?" ;then
        yay -S --noconfirm sddm-eucalyptus-drop
        echo ":: SDDM theme installed"

        sudo mkdir -p /etc/sddm.conf.d
        echo -e "[Theme]\nCurrent=eucalyptus-drop" | sudo tee /etc/sddm.conf.d/theme.conf
        echo ":: Theme set in SDDM"

        _updateThemeFiles

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

_updateThemeFiles() {
    # Variables
    THEME_DIR="/usr/share/sddm/themes/eucalyptus-drop"
    BACKGROUND_NAME="wallpaper.jpg"
    SOURCE_IMAGE="$DIR_DOTFILES/.config/mczlik/wallpapers/$BACKGROUND_NAME"
    DEST_IMAGE="$THEME_DIR/backgrounds/$BACKGROUND_NAME"
    CONF_FILE="$THEME_DIR/theme.conf.user"

    # Create backgrounds directory if it doesn't exist
    mkdir -p "$THEME_DIR/Backgrounds"

    # Copy background image
    sudo cp "$SOURCE_IMAGE" "$DEST_IMAGE"
    echo ":: Copied $SOURCE_IMAGE to $DEST_IMAGE"

    # Create or update theme.conf.user to set new background
    echo ":: Generating theme settings at: $CONF_FILE"
    echo "[General]" | sudo tee "$CONF_FILE" > /dev/null
    echo "Background=ackgrounds/$BACKGROUND_NAME" | sudo tee -a "$CONF_FILE" > /dev/null
    echo "FullBlur=true" | sudo tee -a "$CONF_FILE" > /dev/null
    echo "BlurRadius=50" | sudo tee -a "$CONF_FILE" > /dev/null
    echo "FormPosition=center" | sudo tee -a "$CONF_FILE" > /dev/null
    echo "ForceHideCompletePassword=true" | sudo tee -a "$CONF_FILE" > /dev/null
    sudo echo ":: Updated Corners theme settings"
}

_installSDDM
