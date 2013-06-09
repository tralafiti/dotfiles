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

# mkdir & cd to it
function mcdir() {
    mkdir -p "$1" && cd "$1";
}
