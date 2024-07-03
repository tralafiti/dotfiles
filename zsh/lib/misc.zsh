## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## pager
export PAGER=less

export LC_CTYPE=$LANG

# thank you docker inc for the free ads
export DOCKER_SCAN_SUGGEST=false
export DOCKER_CLI_HINTS=false

# stop it brew
export HOMEBREW_NO_ENV_HINTS=true

## remove douplicate entries in path
export PATH=$(awk -F: '{for(i=1;i<=NF;i++){if(!($i in a)){a[$i];printf s$i;s=":"}}}'<<<$PATH)
