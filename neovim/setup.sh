#!/bin/bash
## title         : setup.sh
## description   : Installs neovim text editor, and performing its configuration
## author        : Roman Zelinskyi
## version       : 0.1
## usage         : bash setup.sh
## bash_version  : 4.4.20(1)-release
#===================================================================================

# Installation for Debian based OS using apt-get package manager
function debian_based_installation {
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
    apt-get install --yes fonts-powerline
}

function configure {
    # Install VimPlug plugin manager
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    NVIM_CFG_DIR=$HOME/.config/nvim
    if [ ! -d "$NVIM_CFG_DIR" ]; then
        mkdir -p -v $NVIM_CFG_DIR
    fi

    # Copy NeoVim init.vim configuration file with defined plugins
    cp -v ./neovim/config/init.vim $NVIM_CFG_DIR
    # Run plugin instalation
    echo "Installing NeoVim plugins..."
    echo -e "[======]\n"
    echo "ctrlp.vim: Installing..."
    echo "vim-airline: Installing..."
    echo "vim-airline-themes: Installing..."
    echo "vim-solarized8: Installing..."
    echo "vim-cpp-modern: Installing..."
    echo "coc.vim: Installing..."
    vim +'PlugInstall --sync' +qall &> /dev/null

    # Copy rest of *.vim files that contains general, line appearance
    # and plugins configuration.
    cp -v ./neovim/config/general.vim $NVIM_CFG_DIR
    echo "source ~/.config/nvim/general.vim" >> ~/.config/nvim/init.vim
    cp -v ./neovim/config/line.vim $NVIM_CFG_DIR
    echo "source ~/.config/nvim/line.vim" >> ~/.config/nvim/init.vim
    cp -v ./neovim/config/plugged.vim $NVIM_CFG_DIR
    echo "source ~/.config/nvim/plugged.vim" >> ~/.config/nvim/init.vim
    cp -v ./neovim/config/coc-settings.json $NVIM_CFG_DIR

    # Copy coc snippets
    mkdir -p $HOME/.config/coc/ultisnips/
    cp -v ./neovim/snippets/* $HOME/.config/coc/ultisnips/
}

export -f configure

if [ "$DIST" = "Ubuntu" ]; then
    debian_based_installation
fi

su $LOGGED_USER -c "bash -c configure"
exit 0
