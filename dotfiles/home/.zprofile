# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"

# Start gnome-keyring-daemon
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
export SSH_AUTH_SOCK