# include the local bash_profile if possible
[ -s "$HOME/.bash_profile.local" ] && source "$HOME/.bash_profile.local"

# include the bashrc if possible
[ -s "$HOME/.bashrc" ] && source "$HOME/.bashrc"
