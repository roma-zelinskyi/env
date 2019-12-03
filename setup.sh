#!/bin/bash

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

# Install python as prerequisites for some packages. NVim requires those packages 
# for python modules.
if [ "$DIST" = "Ubuntu" ]; then
    apt-get install --yes python-dev python-pip python3-dev python3-pip
fi

./neovim/setup.sh
