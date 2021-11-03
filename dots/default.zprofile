# place environment exports here
export LANG="en_US.UTF-8"
export EDITOR="/usr/bin/env vim"
export LESS="$LESS eFRX"

# Homebrew on macOS
#export PATH="/opt/homebrew/bin:$PATH"
#export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# source local kubeconfigs
export KUBECONFIG=.kubeconfig:$HOME/.kube/config
