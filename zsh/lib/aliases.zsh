# Basic directory operations
alias  ..='cd ..'
alias ...='cd ../..'

# Super user
alias _='sudo'

# List direcory contents
alias ll='ls -lah'

# Well, you know - everyone keeps forgeting this
alias wget='curl -OLR'

# Easy updating of dotfiles where ever you are
alias update-dotfiles='(cd ~/.dotfiles; git pull)';

# Set docker env vars for dev docker machine
alias d-env='eval $(docker-machine env default)';

alias gg='cd ~/Documents/Web/Global\ Group/projects/';

# mkdir & cd to it
function mcdir() {
    mkdir -p "$1" && cd "$1";
}

# Open in ...
alias stree='open -a SourceTree'
alias storm='open -a PhpStorm'

