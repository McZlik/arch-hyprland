# ----------------------------------------------------- 
# Install packages 
# -----------------------------------------------------

# CPU microcode selection
source install/includes/cpu_drivers.sh

# GPU driver selection
source install/includes/gpu_drivers.sh

# TODO: Add vim or neovim back in?
# Thunar or nautilus?

os_packages=(
  "base"
  "base-devel"
  "linux"
  "linux-headers"
  "linux-firmware"
  "sudo"
  "nano"
  "man-db"
  "man-pages"
  "usbutils"
  "xterm"
)
_installPackages "${os_packages[@]}";

connectivity_packages=(
#  Networking
  "networkmanager"
  "wpa_supplicant"
  "nss-mdns"
  "iwd"
  "dnsutils"
  "reflector"
  "ufw"
# Bluetooth
  "bluez"
  "bluez-utils"
)
_installPackages "${connectivity_packages[@]}";

audio_packages=(
  "pipewire"
  "pipewire-pulse"
  "wireplumber"
  "alsa-utils"
  "alsa-plugins"
  "pavucontrol"
  "ffmpeg"
  "gst-plugins-bad"
  "gst-libav"
  "gst-plugins-ugly"
)
_installPackages "${audio_packages[@]}";

typography_packages=(
  "ttf-font-awesome"
  "ttf-fira-sans"
  "ttf-fira-code"
  "ttf-firacode-nerd"
  "noto-fonts"
  "noto-fonts-emoji"
  "ttf-dejavu"
  "ttf-liberation"
  "ttf-opensans"
)
_installPackages "${typography_packages[@]}";

system_packages=(
  "pacman-contrib"
  "flatpak"
  "pkgfile"
  "plocate"
  "smartmontools"
  "power-profiles-daemon"
  "haveged"
  "ntp"
  "brightnessctl"
  "cups"
  "system-config-printer"
  "print-manager"
  "tlp"
)
_installPackages "${system_packages[@]}";

# --------------- Hyprland & Core Components ---------------
hyprland_core_packages=(
  "hyprland"
  "hyprpaper"
  "hyprlock"
  "hypridle"
  "xdg-desktop-portal-hyprland"
  "swaync"
  "swayosd"
  "waybar"
)
_installPackages "${hyprland_core_packages[@]}"

# --------------- Desktop Environment/Integration ---------------
hyprland_de_integration_packages=(
  "rofi-wayland"
  "nautilus"
  "nwg-look"
  "qt5-wayland"
  "qt6-wayland"
  "gtk4"
  "libadwaita"
  "xdg-desktop-portal"
  "xdg-desktop-portal-gtk"
  "gnome-keyring"
)
_installPackages "${hyprland_de_integration_packages[@]}"

# --------------- Shell & Prompt ---------------
hyprland_shell_prompt_packages=(
  "zsh"
  "starship"
)
_installPackages "${hyprland_shell_prompt_packages[@]}"

# --------------- Utilities & Tools ---------------
util_packages=(
  "kitty"
  "firefox"
  "blueman"
  "fastfetch"
  "fuse2"
  "jq"
  "python-gobject"
  "xdotool"
  "unzip"
  "htop"
)
_installPackages "${util_packages[@]}"

installer_yay=(
  "iwgtk"
  "catppuccin-gtk-theme-latte"
  "catppuccin-gtk-theme-mocha"
  "hyprshot"
)
_installPackagesYay "${installer_yay[@]}";