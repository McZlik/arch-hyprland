#!/bin/bash

# Cleary the terminal
clear;



# 1. Update the system packages
echo
if confirm "Would you like to update the system?"; then
echo "Updating the system packages."
    sudo pacman -Syu --noconfirm
fi

# 2. Install essentials
echo
echo "Installing essential base packages (git, base-devel, figlet)"
sudo pacman -S --noconfirm git base-devel figlet

# 3. Intall Yay
echo
echo "Installing AUR helper 'yay'";
if ! command -v yay &>/dev/null; then
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
else
    echo "'yay' is already installed"
fi

# 4. Install all the required packages
if confirm "Would you like to install the packages?"; then
    if [ -f packages.txt ]; then
        while IFS= read -r package || [[ -n "$package" ]]; do
            if pacman -Si "$package" &>/dev/null; then
                sudo pacman -S --noconfirm "$package"
            else
                yay -S --noconfirm "$package"
            fi
        done < packages.txt
    else
        echo "'packages.txt' not found."
        echo "Exiting installation..."
        exit;
    fi
else
    echo "Exiting installation..."
    exit;
fi

# 4.1 Install laptop dependencies
if confirm "Would you like to install laptop packages?"; then
    if [ -f laptop-packages.txt ]; then
        while IFS= read -r package || [[ -n "$package" ]]; do
            if pacman -Si "$package" &>/dev/null; then
                sudo pacman -S --noconfirm "$package"
            else
                yay -S --noconfirm "$package"
            fi
        done < laptop-packages.txt
    else
        echo "'laptop-packages.txt' not found, skipping this part..."
    fi
fi

# 4.2 Set settings
# Enable zsh

# 5. Clone and apply dotfiles
echo
if confirm "Would you like to clone and apply McZlik's dotfiles?"; then
    echo "Not yet implemented.." 

    # TODO: Add the github as a variable
    # 0. Install the dotfile manager
    # 1. Download the dotfiles
    # 2. Run the dotfiles script (stow?)

    # read -rp "Enter your dotfiles repository URL: " dotfiles_repo
    # if [ -n "$dotfiles_repo" ]; then
    #     git clone "$dotfiles_repo" ~/dotfiles
    #     cp -r ~/dotfiles/.config/* ~/.config/
    #     echo "Dotfiles have been applied."
    # else
    #     echo "No repository URL provided."
    # fi
fi

# 6. Enable and start necessary services
echo
if confirm "Would you like to enable and start necessary services?"; then
    echo "Not yet implemented.."

    # sudo systemctl enable --now NetworkManager.service
    # sudo systemctl enable --now bluetooth.service
fi

# 7. Install SDDM
if confirm "Would you like to install SDDM?"; then
    sudo pacman -S --noconfirm sddm

    if confirm "Would you like to install the SDDM theme?"; then
        yay -S --noconfirm sddm-eucalyptus-drop
    fi

    # Enable SDDM
    sudo systemctl enable sddm
fi

echo "All done!";