echo ":: Downloading dotfiles from github"

# Check if dotfiles directory already exists
if [ -d "$DIR_DOTFILES" ]; then
    echo "Dotfiles directory already exists. Updating..."
    cd "$DIR_DOTFILES"
    git pull
    cd -
else
    echo "Cloning dotfiles repository to $DIR_DOTFILES"
    git clone https://github.com/McZlik/dotfiles.git "$DIR_DOTFILES"
fi
#
## Export the dotfiles directory for use in stow.sh
#export DIR_DOTFILES

# Call stow.sh from the dotfiles repository
if [ -f "$DIR_DOTFILES/stow.sh" ]; then
    echo "Running stow.sh from dotfiles repository"
    bash "$DIR_DOTFILES/stow.sh"
else
    echo "Error: stow.sh not found in dotfiles repository"
    exit 1
fi

echo ":: Dotfiles setup completed"