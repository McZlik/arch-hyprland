# ----------------------------------------------------- 
# Install packages 
# ----------------------------------------------------- 

# TODO: Add vim or neovim back in?
# Thunar or nautilus?

installer_packages=(
    "nano"
    "zsh"
    "pavucontrol"
    "hyprland"
    "hyprpaper"
    "hyprlock"
    "hypridle"
    "waybar"
    "rofi-wayland"
    "kitty"
    "starship"
    "swaync"
    "swayosd"
    "xdg-desktop-portal-hyprland"
    "xdg-desktop-portal-gtk"
    "nautilus"
    "qt5-wayland"
    "qt6-wayland"
    "ttf-font-awesome"
    "ttf-fira-sans" 
    "ttf-fira-code" 
    "ttf-firacode-nerd"
    "nwg-look"
    "firefox"
    "iwd"
    "bluez"
    "bluez-utils"
    "blueman"
    "power-profiles-daemon"
    "fastfetch"
    "fuse2"
    "gtk4"
    "libadwaita"
    "jq"
    "python-gobject"
    "xdotool"
    "brightnessctl"
    "wireplumber"
)

installer_yay=(
    "iwgtk" 
    "catppuccin-gtk-theme-latte"
    "catppuccin-gtk-theme-mocha"
    "hyprshot"
)

# PLEASE NOTE: Add more packages at the end of the following command
_installPackages "${installer_packages[@]}";
_installPackagesYay "${installer_yay[@]}";