#!/bin/bash
## title         : setup.sh
## description   : Starts process of setting up preferred working environment
## author        : Roman Zelinskyi
## version       : 0.1
## usage         : bash setup.sh
## bash_version  : 4.4.20(1)-release
#===================================================================================

export OS=`uname -s`

if [ "${OS}" = "Linux" ] ; then
    if [ -f /etc/lsb-release ] ; then
        export DIST=`lsb_release -si`
        export RELEASE=`lsb_release -sr`
    else
        echo "Unsupported DISTRO!"
        exit
    fi
else
    echo "Unsupported OS!"
    exit
fi

echo "${OS} ${DIST}(${RELEASE})"


# PREREQUISITES
if [ "$DIST" = "Ubuntu" ]; then
    # NVim requires those packages for python modules.
    apt-get install --yes python-dev python-pip python3-dev python3-pip

    apt-get install --yes curl
fi

./neovim/setup.sh
