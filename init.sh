#!/bin/sh
cp ~/.dotfiles/githook.post-commit ~/.dotfiles/.git/hooks/post-commit
cp ~/.dotfiles/githook.post-merge ~/.dotfiles/.git/hooks/post-merge
chmod +x ~/.dotfiles/.git/hooks/post-commit ~/.dotfiles/.git/hooks/post-merge
find ~/.dotfiles/ -type f -name ".*" -exec ln -s -f {} $HOME \;
