#!/bin/sh
find ~/.dotfiles/githooks -type f -exec ln -sfi {} ~/.dotfiles/.git/hooks \;
find ~/.dotfiles/dots -name ".*" -prune -exec ln -sfi {} ~ \;
find ~/.dotfiles/dots -name "default.*" -prune -exec sh -c 'cp -i $1 ~/.${1##*.}' funcname {} \;
