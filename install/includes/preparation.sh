# Check if the root directory exists
if [ ! -d $DIR_ROOT ] ;then
    mkdir $DIR_ROOT
fi

# Check if the currently installing version already exists, if so delete it
if [ -d ~$DIR_VERSION ] ;then
    stow -D -t $HOME/.config $DIR_DOTFILES/.config
    stow -D -t $HOME $DIR_DOTFILES/home
    rm -rf $DIR_VERSION
fi

# Make sure the dotfiles folder exsists
if [ ! -d $DIR_DOTFILES ] ;then
    mkdir -p $DIR_DOTFILES
fi

# TODO: Move the dotfiles out of here and into their own repository for better separation
# Copy the dotfiles to the local directory
cp -r dotfiles/. $DIR_DOTFILES
echo ":: McZlik's Arch Hyprland configuration prepared in $DIR_VERSION"