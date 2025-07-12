setopt prompt_subst
autoload -U promptinit
promptinit

autoload -U add-zsh-hook
add-zsh-hook precmd _prompt

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

KUBE_PS1_HIDE_IF_NOCONTEXT="true"
KUBE_PS1_SYMBOL_ENABLE=false
KUBE_PS1_PREFIX=" to "
KUBE_PS1_SUFFIX=""
KUBE_PS1_CTX_COLOR="yellow"
KUBE_PS1_NS_COLOR="red"

_prompt() {
  print -rP '%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)$(kube_ps1)'
}
PROMPT='%# '
