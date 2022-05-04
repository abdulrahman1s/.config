CONFIG_FILES=(
    zsh
    "Code/User/settings.json"
    "autostart/redshift-gtk.desktop"
    ranger
    nvim
)

for name in "${CONFIG_FILES[@]}"; do 
    rm -rf "$(basename "./${name}")"
done

for name in "${CONFIG_FILES[@]}"; do
    if [ -f ~/.config/$name ]; then
        mkdir -p "./$(dirname "${name}")"
    fi
    cp -r ~/.config/$name ./$name
done

mapfile -t gits < <(find . -name .git -type d -prune)

for git in "${gits[@]}"; do 
    if [ "$git" != "./.git" ]; then
       rm -rf $git
    fi
done
