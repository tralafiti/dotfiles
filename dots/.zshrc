# Path to your zsh configuration.
ZSH=$HOME/.dotfiles/zsh
# Display red dots while waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Add additional autocompletions to path
fpath=($ZSH/completions $fpath)

# Load all of the config files that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

# Load and run compinit
autoload -U compinit
compinit -i
