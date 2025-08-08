# McHypr
McZlik's custom install scripts to automate the installating of hyprland on arch based systems

## Inspiration
First setup based on [ML4W's hyprland-starter](https://github.com/mylinuxforwork/hyprland-starter/tree/1.0.1)

## Installation
Just copy the following command into your terminal and execute.

> [!IMPORTANT]
> Hyprland does not officially support NVIDIA hardware. But many users have reported a successful installation. Please read: https://wiki.hyprland.org/Nvidia/

``` bash
bash <(curl -s https://raw.githubusercontent.com/McZlik/arch-hyprland/main/setup.sh)
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
- Find a way to install and enable gnome keyring, probably hard :c
- Check if we can preset the gtk theme after installing everything
- Expand docs in general
- Find out what filesystem file picker vscode uses

## Must-have additions
- [x] Session/login
    - greetd (simple login manager) + a greeter, e.g. tuigreet (AUR: greetd-tuigreet), or use SDDM instead. This gives you a graphical/TTY login.

- [x] Privilege escalation (required for mounting drives, changing network, etc.)
    - polkit
    - polkit-gnome (polkit agent; autostart it in your Hyprland session)

- [ ] Networking quality-of-life
  - nm-connection-editor (GUI editor for NetworkManager)
  - avahi (for mDNS/Bonjour; you already have nss-mdns)
    - Tip: ensure hosts line in /etc/nsswitch.conf includes mdns_minimal [NOTFOUND=return] before resolve/dns.
    
    Decide on NM backend: use wpa_supplicant (default) or iwd, but not both at the same time. If you stick to NetworkManager, iwgtk isn’t needed (it targets iwd directly).

- [ ] Audio compatibility
  - pipewire-alsa (routes legacy ALSA apps through PipeWire)

- [ ] Files/Storage integration (for automount, trash, network shares in Nautilus)
  - gvfs
  - udisks2
  - gvfs-mtp (Android), optionally gvfs-smb (Windows shares), gvfs-nfs

- [ ] Clipboard (Wayland)
  - wl-clipboard
  - cliphist (lightweight clipboard manager) or copyq

- [ ] Bluetooth file transfers
  - bluez-obex (OBEX support; useful with Blueman)

- [ ] User directories and basics
  - xdg-user-dirs
  - git
