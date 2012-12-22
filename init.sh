#!/bin/sh
cp ~/.dotfiles/githook.post-commit ~/.dotfiles/.git/hooks/post-commit
cp ~/.dotfiles/githook.post-merge ~/.dotfiles/.git/hooks/post-merge
chmod +x ~/.dotfiles/.git/hooks/post-commit ~/.dotfiles/.git/hooks/post-merge
find ~/.dotfiles/dots -type f -name ".*" -exec ln -sfi {} $HOME \;
find ~/.dotfiles/dots -type f -name "default.*" -exec sh -c 'cp -i $1 $HOME/.${1##*.}' funcname {} \;
