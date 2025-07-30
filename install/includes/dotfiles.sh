echo ":: Dotfiles Configuration"
echo -e "${GREEN}Dotfiles Installation${NONE}"

# Default repository URL
DEFAULT_REPO="https://github.com/McZlik/dotfiles.git"

echo "This will download and install dotfiles from: $DEFAULT_REPO"
echo "Options:"
echo "1. Use default repository"
echo "2. Specify custom repository URL"
echo "3. Skip dotfiles installation"
echo ""

read -p "Enter your choice [1-3]: " choice

# Handle user choice
case $choice in
    1)
        echo "Using default repository: $DEFAULT_REPO"
        REPO_URL="$DEFAULT_REPO"
        ;;
    2)
        read -p "Enter custom repository URL: " custom_url
        if [[ -z "$custom_url" ]]; then
            echo "No URL provided, using default: $DEFAULT_REPO"
            REPO_URL="$DEFAULT_REPO"
        else
            REPO_URL="$custom_url"
            echo "Using custom repository: $REPO_URL"
        fi
        ;;
    3)
        echo "Skipping dotfiles installation"
        exit 0
        ;;
    *)
        echo "Invalid choice, using default: $DEFAULT_REPO"
        REPO_URL="$DEFAULT_REPO"
        ;;
esac

# Check if dotfiles directory already exists
if [ -d "$DIR_DOTFILES" ]; then
    echo "Dotfiles directory already exists. Updating..."
    cd "$DIR_DOTFILES"
    git pull
    cd -
else
    echo "Cloning dotfiles repository to $DIR_DOTFILES"
    git clone "$REPO_URL" "$DIR_DOTFILES"
fi
#
## Export the dotfiles directory for use in stow.sh
#export DIR_DOTFILES

# Call stow.sh from the dotfiles repository
if [ -f "$DIR_DOTFILES/stow.sh" ]; then
    echo "Running stow.sh from dotfiles repository"
    bash "$DIR_DOTFILES/stow.sh"
else
    echo "${RED}Error: stow.sh not found in dotfiles repository${NONE}"
    echo "Make sure you install/stow the dotfiles before usage"
fi

echo ":: Dotfiles setup completed"