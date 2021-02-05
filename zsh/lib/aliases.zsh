# Basic directory operations
alias  ..='cd ..'
alias ...='cd ../..'

# Super user
alias _='sudo'

# List direcory contents
alias ll='ls -lah'

# Easy updating of dotfiles where ever you are
alias update-dotfiles='(cd ~/.dotfiles; git pull)';

# Set docker env vars for dev docker machine
#alias d-env='eval $(docker-machine env default)';
function d-up() {
  open --background -a "Docker";
  echo 'Docker For Desktop started. Waiting for hyperkit-VM to come up...'
  while ! docker system info > /dev/null 2>&1; do sleep 1; done
  echo 'Done'
}
function d-down() {
  osascript -e 'quit app "Docker"';
}
# Set minishift oc env vars
alias oc-env='eval $(minishift oc-env)';

alias gcs='cd ~/Development/GCS/projects/';

# mkdir & cd to it
function mcdir() {
  mkdir -p "$1" && cd "$1";
}

# Open in ...
alias stree='open -a SourceTree'
alias storm='open -a PhpStorm'

