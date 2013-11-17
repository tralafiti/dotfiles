setopt prompt_subst
autoload -U promptinit
promptinit

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[cyan]%}s"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}t"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}d"
ZSH_THEME_GIT_PROMPT_PLACEHOLDER=" "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[blue]%}+"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[blue]%}-"
ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg[blue]%}*"

precmd() { print -rP '%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)'  }
PROMPT='%# '
