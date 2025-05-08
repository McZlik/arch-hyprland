echo ":: Stowing dotfiles"

# Stow the dotfiles
stow -t $HOME/.config $DIR_DOTFILES/.config
# Stow the homefolde files
stow -t $HOME $DIR_DOTFILES/home

echo ":: Dotfiles stowed"