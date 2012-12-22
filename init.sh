#!/bin/sh
find ~/.dotfiles/githooks -type f -exec ln -sfi {} ~/.dotfiles/.git/hooks \;
find ~/.dotfiles/dots -type f -name ".*" -exec ln -sfi {} ~ \;
find ~/.dotfiles/dots -type f -name "default.*" -exec sh -c 'cp -i $1 ~/.${1##*.}' funcname {} \;
