# include the local zprofile if possible
[ -s "$HOME/.zprofile.local" ] && source "$HOME/.zprofile.local"

# eval jenv init script
env which -s jenv && eval "$(jenv init -)" && export PATH="$HOME/.jenv/bin:$PATH"

# set up dinghy
env which -s dinghy && eval "$(dinghy env)"
