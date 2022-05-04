#!/bin/bash

mapfile -t PACKAGES <packages-list.txt

add_third_party_ppa() {
    echo "Adding Thrid Party PPA..."
    sudo add-apt-repository ppa:spvkgn/exa -y
}

install_packages() {
    echo "Installing Packages..."
    sudo apt update && sudo apt install $@ -y
}

install_fonts() {
    echo "Installing Fonts..."

    if [ -f ~/.fonts/Fira-Code-Regular-Nerd-Font.tff ]; then
        echo "Font already exists.."
        return
    else
        mkdir -p ~/.fonts
        curl https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf -o ~/.fonts/Fira-Code-Regular-Nerd-Font.tff
        fc-cache -f -v
    fi
}

install_other_packages() {
    echo "Installing Other Packages..."

    echo "1. Installing Zoxied... (Smarter cd command)"
    wget -qO- https://github.com/ajeetdsouza/zoxide/releases/download/v0.8.1/zoxide-v0.8.1-x86_64-unknown-linux-musl.tar.gz | tar xvz -C /tmp
    mv /tmp/zoxide /home/abdulrahman/.local/bin/

    echo "2. Installing XH..."
    curl -sfL https://raw.githubusercontent.com/ducaale/xh/master/install.sh | sh

    echo "3. Installing Atuin (Smarter history command)"
    bash <(curl https://raw.githubusercontent.com/ellie/atuin/main/install.sh)
}

initialize_zsh() {
    chsh -s $(which zsh)
    ln -sf ~/.config/zsh/zshrc.zsh ~/.zshrc
}

add_third_party_ppa
install_packages "${PACKAGES[@]}"
install_other_packages
install_fonts

echo "Copying config files to ~/.config..."

for path in ./*; do
    if [ -d $path ]; then
        cp -r $path ~/.config/
    fi
done

initialize_zsh
