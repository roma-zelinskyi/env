#!/bin/bash
## title         : setup.sh
## description   : Export information about current enviroment, such as OS, LOGGED_USER, etc...
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
