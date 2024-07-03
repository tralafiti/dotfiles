# include completions managed by homebrew
if type brew &>/dev/null; then
  FPATH=$FPATH:$(brew --prefix)/share/zsh/site-functions
fi
