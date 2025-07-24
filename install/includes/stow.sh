echo ":: Stowing dotfiles"

# Get the current working directory
SCRIPT=$(realpath "$0")
temp_path=$(dirname "$SCRIPT")

cd $DIR_DOTFILES

# Stow the dotfiles
echo "stowing $DIR_DOTFILES/.config -> $HOME/.config"
stow -t $HOME/.config .config
# Stow the homefolder files
echo "stowing $DIR_DOTFILES/home -> $HOME"
stow -t $HOME home

cd $temp_path

echo ":: Dotfiles stowed"