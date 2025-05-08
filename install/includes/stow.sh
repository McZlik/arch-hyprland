echo ":: Stowing dotfiles"

# Stow the dotfiles
echo "stowing $DIR_DOTFILES/.config -> $HOME/.config"
stow -t $HOME/.config $DIR_DOTFILES/.config
# Stow the homefolde files
echo "stowing $DIR_DOTFILES/home -> $HOME"
stow -t $HOME $DIR_DOTFILES/home

echo ":: Dotfiles stowed"