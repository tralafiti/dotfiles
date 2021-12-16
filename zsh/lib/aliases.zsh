# Basic directory operations
alias  ..='cd ..'
alias ...='cd ../..'

# Super user
alias _='sudo'

# List direcory contents
alias ll='ls -lah'

# Easy updating of dotfiles where ever you are
alias update-dotfiles='(cd ~/.dotfiles; git pull)';

# Start Docker Desktop silently
function d-up() {
  open --hide --background -a "Docker";
  echo 'Docker For Desktop started. Waiting for hyperkit-VM to come up...'
  while ! docker system info > /dev/null 2>&1; do sleep 1; done
  echo 'Done'
}
# Stop Docker Desktop
function d-down() {
  osascript -e 'quit app "Docker"';
}

# Get a shell within Doocker Desktop VM, see https://github.com/justincormack/nsenter1
alias d-shell='docker run -it --rm --privileged --pid=host justincormack/nsenter1'

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

