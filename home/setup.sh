#!/bin/bash
## title         : setup.sh
## description   : Setup home directory by copying configuration files for bashrc, git...
## author        : Roman Zelinskyi
## version       : 0.1
## usage         : bash setup.sh
## bash_version  : 4.4.20(1)-release
#===================================================================================

if [ -z ${LOGGED_USER+x} ]; then
    source ../current-env.sh
fi

function configure {
    GIT_NAME=`git config --global user.name`
    GIT_EMAIL=`git config --global user.email`
    GIT_USER=`git config --global github.user`
    
    GIT_NAME=${GIT_NAME:-Roman Zelinskyi}
    GIT_EMAIL=${GIT_EMAIL:-lord.zelinskyi@gmail.com}
    GIT_USER=${GIT_USER:-roma-zelinskyi}

    git config --global user.name "$GIT_NAME"
    git config --global user.email "$GIT_EMAIL"
    git config --global github.user "$GIT_USER"

    # extend gitconfig with prefered aliases
    cat ./config/.gitconfig >> ~/.gitconfig

    cp -v ./config/.bashrc $HOME/
    cp -v ./config/.bash_aliases $HOME/
}

export -f configure

# Run configuration step under logged user.
su $LOGGED_USER -c "bash -c configure"
exit 0
