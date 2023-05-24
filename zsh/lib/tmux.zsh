# update session environment variables if they got changed after re-attaching
# a tmux session
if [[ -n "$TMUX" ]]; then
    _update_env_from_tmux() {
        eval "$(tmux show-environment -s)"
    }
    add-zsh-hook precmd  _update_env_from_tmux
    add-zsh-hook preexec _update_env_from_tmux
fi
