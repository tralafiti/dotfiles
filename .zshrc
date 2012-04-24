# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/zsh

# Add additional autocompletions to path
fpath=($ZSH/completions $fpath)

# Load all of the config files that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

# Load and run compinit
autoload -U compinit
compinit -i
