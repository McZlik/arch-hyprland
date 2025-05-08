if [ ! -d $DIR_ROOT ] ;then
    mkdir $DIR_ROOT
fi
if [ -d ~$DIR_VERSION ] ;then
    stow -D -t $HOME/.config $DIR_DOTFILES/.config
    stow -D -t $HOME $DIR_DOTFILES/home
    rm -rf $DIR_VERSION
fi

if [ ! -d $DIR_DOTFILES ] ;then
    mkdir $DIR_DOTFILES
fi

cp -r dotfiles $DIR_DOTFILES
echo ":: McZlik's Arch Hyprland configuration prepared in $DIR_VERSION"