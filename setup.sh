#!/bin/bash
## title         : setup.sh
## description   : Starts process of setting up preferred working environment
## author        : Roman Zelinskyi
## version       : 0.1
## usage         : bash setup.sh
## bash_version  : 4.4.20(1)-release
#===================================================================================


function find_logged_user() {
    thisPID=$$
    origUser=`whoami`
    thisUser=$origUser

    while [ "$thisUser" = "$origUser" ]
    do
        ARR=(`ps h -p$thisPID -ouser,ppid;`)
        thisUser="${ARR[0]}"
        myPPid="${ARR[1]}"
        thisPID=$myPPid
    done

    getent passwd "$thisUser" | cut -d: -f1
}

export LOGGED_USER=$(find_logged_user)
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
