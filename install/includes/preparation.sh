# Check if the root directory exists
if [ ! -d $DIR_ROOT ] ;then
    mkdir $DIR_ROOT
fi

# Check if the currently installing version already exists, if so delete it
if [ -d ~$DIR_VERSION ] ;then
    rm -rf $DIR_VERSION
fi

# Make sure the version folder exists
if [ ! -d $DIR_VERSION ] ;then
    mkdir -p $DIR_VERSION
fi

echo ":: McZlik's Arch Hyprland configuration prepared in $DIR_VERSION"