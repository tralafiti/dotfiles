# Basic directory operations
alias  ..='cd ..'
alias ...='cd ../..'

# Super user
alias _='sudo'

# List direcory contents
alias ll='ls -lah'

# mkdir & cd to it
function mcdir() {
    mkdir -p "$1" && cd "$1";
}

