# include the local zprofile if possible
[ -s "$HOME/.zprofile.local" ] && source "$HOME/.zprofile.local"

# set PATH for jenv
export PATH="$HOME/.jenv/bin:$PATH"

# eval jenv init script
env which -s jenv && eval "$(jenv init -)"

# set up dinghy
env which -s dinghy && eval "$(dinghy env)"

export PATH="/usr/local/sbin:$PATH"
