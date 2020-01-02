#!/bin/bash
## title         : setup.sh
## description   : Installs clang-tools such as: clang-foramt for utomatic 
##                 reformatting of C++ sources files
## author        : Roman Zelinskyi
## version       : 0.1
## usage         : bash setup.sh
## bash_version  : 4.4.20(1)-release
#===================================================================================

# Installation for Debian based OS using apt-get package manager
function debian_based_installation {
    apt-get install --yes clang-format-8
}

function configure {
    # Copy configuration file to HOME directory
    cp -v ./clang-tools/config/.clang-format $HOME

    # Copy configuration file for Vim and NeoVim that will call
    # clang-format on source file for each save cmd.
    cp -v ./clang-tools/config/format.vim $HOME/.config/nvim/

    echo "source ~/.config/nvim/format.vim" >> ~/.config/nvim/init.vim
}

export -f configure

if [ "$DIST" = "Ubuntu" ]; then
    debian_based_installation
fi

su $LOGGED_USER -c "bash -c configure"
exit 0
