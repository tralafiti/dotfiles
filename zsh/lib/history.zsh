## Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=30000
SAVEHIST=30000


# read and write to history file directly (dont combine with inc_append_history)
#setopt share_history
# write to history file immediately, not when the shell exits
setopt inc_append_history_time
# also record timestamp of each command
setopt extended_history
# skip duplicates when stepping through history
setopt hist_find_no_dups
# dont write commands prefixed with a space to history
setopt hist_ignore_space
# reload history command into the editing buffer instead of directly executing it
setopt hist_verify
# delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_expire_dups_first

# TODO https://unix.stackexchange.com/questions/16101/zsh-search-history-on-up-and-down-keys
#autoload -U up-line-or-beginning-search
#autoload -U down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search
#bindkey "$terminfo[kcuu1]" up-line-or-beginning-search # Up
#bindkey "$terminfo[kcud1]" down-line-or-beginning-search # Down
