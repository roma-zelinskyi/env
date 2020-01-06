#!/bin/bash
## title         : setup.sh
## description   : Starts process of setting up preferred working environment
## author        : Roman Zelinskyi
## version       : 0.1
## usage         : bash setup.sh
## bash_version  : 4.4.20(1)-release
#===================================================================================

[ -f current-env.sh ] && source current-env.sh

echo "${OS} ${DIST}(${RELEASE})"


# PREREQUISITES
if [ "$DIST" = "Ubuntu" ]; then
    # NVim requires those packages for python modules.
    apt-get install --yes python-dev python-pip python3-dev python3-pip

    apt-get install --yes curl
fi

pushd neovim
./setup.sh
echo -e "neovim setup: Done!\n"
popd

pushd clang-tools
./setup.sh
echo -e "clang-tools setup: Done!\n"
popd

pushd home
./setup.sh
echo -e "home setup: Done!\n"
popd

exit 0
