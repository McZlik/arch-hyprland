echo ":: Dotfiles Configuration"
echo -e "${GREEN}Dotfiles Installation${NONE}"

# Default repository URL
DEFAULT_REPO="https://github.com/McZlik/dotfiles.git"

echo "This will download and install dotfiles from: $DEFAULT_REPO"
echo "Select an option:"

# Define choice options
CHOICE_DEFAULT="Use default repository"
CHOICE_CUSTOM="Specify custom repository URL"
CHOICE_SKIP="Skip dotfiles installation"

choice=$(gum choose --selected="$CHOICE_DEFAULT" "$CHOICE_DEFAULT" "$CHOICE_CUSTOM" "$CHOICE_SKIP")

# Initialize flag for default repository usage
USED_DEFAULT_REPO=true

# Handle user choice
case $choice in
    "$CHOICE_DEFAULT")
        echo "Using default repository: $DEFAULT_REPO"
        REPO_URL="$DEFAULT_REPO"
        USED_DEFAULT_REPO=true
        ;;
    "$CHOICE_CUSTOM")
        custom_url=$(gum input --placeholder "Enter custom repository URL")
        if [[ -z "$custom_url" ]]; then
            echo "No URL provided, using default: $DEFAULT_REPO"
            REPO_URL="$DEFAULT_REPO"
            USED_DEFAULT_REPO=true
        else
            REPO_URL="$custom_url"
            echo "Using custom repository: $REPO_URL"
            USED_DEFAULT_REPO=false
        fi
        ;;
    "$CHOICE_SKIP")
        echo "Skipping dotfiles installation"
        export USED_DEFAULT_REPO=false
        exit 0
        ;;
    *)
        echo "No/invalid choice, using default: $DEFAULT_REPO"
        REPO_URL="$DEFAULT_REPO"
        USED_DEFAULT_REPO=true
        ;;
esac

# Export the flag so it can be used by the calling script
export USED_DEFAULT_REPO

echo "Downloading dotfiles to: $DIR_DOTFILES"

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