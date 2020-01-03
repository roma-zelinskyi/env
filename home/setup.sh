#!/bin/bash
## title         : setup.sh
## description   : Setup home directory by copying configuration files for bashrc, git...
## author        : Roman Zelinskyi
## version       : 0.1
## usage         : bash setup.sh
## bash_version  : 4.4.20(1)-release
#===================================================================================

GIT_NAME=`git config --global user.name`
GIT_EMAIL=`git config --global user.email`
GIT_USER=`git config --global github.user`

GIT_NAME=${GIT_NAME:-Roman Zelinskyi}
GIT_EMAIL=${GIT_EMAIL:-lord.zelinskyi@gmail.com}
GIT_USER=${GIT_USER:-roma-zelinskyi}

git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global github.user "$GIT_USER"

cat ./home/config/.gitconfig >> ~/.gitconfig
