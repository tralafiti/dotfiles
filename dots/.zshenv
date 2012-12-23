# always source zprofile (environment variables)
if [[ $SHLVL == 1 && ! -o LOGIN ]]; then
    source ~/.zprofile
fi
