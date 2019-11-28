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

./neovim/setup.sh
