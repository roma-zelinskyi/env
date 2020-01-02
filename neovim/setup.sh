#!/bin/bash
## title         : setup.sh
## description   : Installs neovim text editor, and performing its configuration
## author        : Roman Zelinskyi
## version       : 0.1
## usage         : bash setup.sh
## bash_version  : 4.4.20(1)-release
#===================================================================================

# Installation for Debian based OS using apt-get package manager
function debian_based_setup {
    # NeoVim installation step
    apt-get install --yes software-properties-common

    add-apt-repository --yes ppa:neovim-ppa/stable
    apt-get --yes update
    apt-get install --yes neovim

    if (( $(echo "$RELEASE < 18.04" |bc -l) )); then
        apt-get install --yes python-software-properties
        apt-get install --yes python3-setuptools
        easy_install3 pip
    fi

    update-alternatives --install `which vim` vim `which nvim` 60

    # DEPENDENCIES
    apt-get --yes install nodejs
    apt-get --yes install npm
    apt-get install fonts-powerline
}

function configure {
    # Install VimPlug plugin manager
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Copy NeoVim configuration files to $HOME/.config/nvim/
    mkdir -p $HOME/.config/nvim
    cp -v ./neovim/config/* $HOME/.config/nvim/

    # Run plugin instalation
    echo "Installing plugins..."
    vim +'PlugInstall --sync' +qall &> /dev/null
}

export -f configure

if [ "$DIST" = "Ubuntu" ]; then
    debian_based_setup
fi

su $LOGGED_USER -c "bash -c configure"
exit 0
