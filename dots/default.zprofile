# place environment exports here
export LANG="en_US.UTF-8"
export EDITOR="vim"
export LESS="$LESS eFRX"

# Homebrew on macOS
#export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
#export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# explicitly set default kube config to enable "merging" of additional configs via direnv
export KUBECONFIG=$HOME/.kube/config
