#!/bin/bash

# Installation for Debian based OS using apt-get package manager
function debian_based_setup {
    apt-get install --yes software-properties-common

    add-apt-repository --yes ppa:neovim-ppa/stable
    apt-get --yes update
    apt-get install --yes neovim

    apt-get install --yes python-dev python-pip python3-dev python3-pip

    if (( $(echo "$RELEASE < 18.04" |bc -l) )); then
        apt-get install --yes python-software-properties
        apt-get install --yes python3-setuptools
        easy_install3 pip
    fi

    update-alternatives --install `which vim` vim `which nvim` 60
}

if [ "$DIST" = "Ubuntu" ]; then
    debian_based_setup
fi

