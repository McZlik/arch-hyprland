# ----------------------------------------------------- 
# Variables
# ----------------------------------------------------- 
DIR_ROOT="$HOME/mczlik"
DIR_VERSION="$DIR_ROOT/$VERSION"
DIR_DOTFILES="$DIR_VERSION/dotfiles"

# ----------------------------------------------------- 
# Colors
# ----------------------------------------------------- 
NONE='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'

# ----------------------------------------------------- 
# Functions
# ----------------------------------------------------- 

# Check if package is installed
_isInstalled() {
    package="$1";
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

# Install required packages
_installPackages() {
    toInstall=();
    for pkg; do
        if [[ $(_isInstalled "${pkg}") == 0 ]]; then
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
    sudo pacman --noconfirm -Syu "${toInstall[@]}";
}

_installPackagesYay() {
    toInstall=();
    for pkg; do
        if [[ $(_isInstalledYay "${pkg}") == 0 ]]; then
            echo ":: ${pkg} is already installed.";
            continue;
        fi;
        toInstall+=("${pkg}");
    done;

    if [[ "${toInstall[@]}" == "" ]] ; then
        # echo "All packages are already installed.";
        return;
    fi;

    # printf "AUR packags not installed:\n%s\n" "${toInstall[@]}";
    yay --noconfirm -S "${toInstall[@]}";
}

# Install Yay
_installYay() {
    if sudo pacman -Qs yay > /dev/null ; then
        echo ":: yay is already installed!"
    else
        echo ":: yay is not installed. Will be installed now!"
        _installPackages "base-devel"
        SCRIPT=$(realpath "$0")
        temp_path=$(dirname "$SCRIPT")
        echo $temp_path

        # Remove existing folder
        if [ -d ~/yay-git ] ;then
            rm -rf ~/yay-git
            echo ":: Existing yay folder removed"
        fi

        git clone https://aur.archlinux.org/yay-git.git ~/yay-git
        cd ~/yay-git
        makepkg -si
        cd $temp_path
        echo ":: yay has been installed successfully."

        rm -rf ~/yay-git
        echo ":: Yay folder removed"
    fi
}


# isKVM
_isKVM() {
    iskvm=$(sudo dmesg | grep "Hypervisor detected")
    if [[ "$iskvm" =~ "KVM" ]] ;then
        echo 0
    else
        echo 1
    fi
}