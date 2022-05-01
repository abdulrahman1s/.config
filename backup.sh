CONFIG_FILES=(
    zsh
    "Code/User/settings.json"
    "autostart/redshift-gtk.desktop"
)

for name in "${CONFIG_FILES[@]}"; do
    if [ -f ~/.config/$name ]; then
        mkdir -p "./$(dirname "${name}")"
    fi
    cp -r ~/.config/$name ./$name
done
