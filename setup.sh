#!/bin/bash


# ----------------------------------------------------- 
# Functions
# ----------------------------------------------------- 

# Check if package is installed
_isPackageInstalled() {
    package="$1";
    check="$(sudo yay -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

# Install required packages
_installPackagesPacman() {
    toInstall=();
    for pkg; do
        if [[ $(_isPackageInstalled "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed.";
            continue;
        fi;
        toInstall+=("${pkg}");
    done;
    if [[ "${toInstall[@]}" == "" ]] ; then
        # echo "All pacman packages are already installed.";
        return;
    fi;
    printf "Package not installed:\n%s\n" "${toInstall[@]}";
    sudo pacman --noconfirm -S "${toInstall[@]}";
}

# ----------------------------------------------------- 
# Packages
# ----------------------------------------------------- 

# Required packages for the installer on Arch
installer_packages_arch=(
    "figlet"
    "git"
)

clear

NONE='\033[0m'
GREEN='\033[0;32m'

# Header
echo -e "${GREEN}"
cat <<"EOF"
 ____       _               
/ ___|  ___| |_ _   _ _ __  
\___ \ / _ \ __| | | | '_ \ 
 ___) |  __/ |_| |_| | |_) |
|____/ \___|\__|\__,_| .__/ 
                     |_|    

EOF
echo "for McZlik's Arch Hyprland setup"
echo
echo -e "${NONE}"

# 0. Are we ready?
echo "This script will download and install McZlik's Arch Hyprland and dotiles configurations."
echo
while true; do
    read -p "DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo "Installation started."
            echo
        break;;
        [Nn]* ) 
            echo "Installation canceled."
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "Installing required packages..."
_installPackagesPacman "${installer_packages_arch[@]}";

# Create the Downloads folder if doesn't exists
if [ ! -d ~/Downloads ] ;then
    mkdir ~/Downloads
    echo ":: Downloads folder created"
fi

# Change into Downloads directory
cd ~/Downloads

# Remove existing folder
if [ -d ~/Downloads/arch-hyprland ] ;then
    rm -rf ~/Downloads/arch-hyprland
    echo ":: Existing installation folder removed"
fi

# Clone the packages
# git clone --depth 1 https://github.com/McZlik/arch-hyprland.git
git clone --depth 1 --branch feature/first-setup https://github.com/McZlik/arch-hyprland.git

echo ":: Installation files cloned into Downloads folder"

# Change into the folder
cd arch-hyprland

# Start the actual installation
./install.sh