# McHypr
McZlik's custom install scripts to automate the installating of hyprland on arch based systems

## Inspiration
First setup based on [ML4W's hyprland-starter](https://github.com/mylinuxforwork/hyprland-starter/tree/1.0.1)

## Installation
Just copy the following command into your terminal and execute.

> [!IMPORTANT]
> Hyprland does not officially support NVIDIA hardware. But many users have reported a successful installation. Please read: https://wiki.hyprland.org/Nvidia/

``` bash
bash <(curl -s https://raw.githubusercontent.com/McZlik/arch-hyprland/refs/heads/feature/first-setup/setup.sh)
```

## Packages

The script will install the following packages and the corresponding configurations:

* Window Manager: hyprland
* Status Bar: waybar
* Launcher: rofi-wayland
* Browser: Firefox
* Terminal: kitty
* Notification Service: SwayNC ~~dunst~~
* File Manager: Nautilus ~~Thunar~~
* xdg-desktop-portal-hyprland
* qt5-wayland
* qt6-wayland
* Lock screen: hyprlock

## Todo
- Get this working on a VM
- Find a way to install and enable gnome keyring, probably hard :c
- Check if we can preset the gtk theme after installing everything
- Expand docs in general
- Find out what filesystem file picker vscode uses