# include the local bash_profile if possible
[ -s "$HOME/.bash_profile.local" ] && source "$HOME/.bash_profile.local"

# include the bashrc if possible
[ -s "$HOME/.bashrc" ] && source "$HOME/.bashrc"

# include sh legacy profile if possible
[ -s "$HOME/.profile" ] && source "$HOME/.profile"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# set PATH for jenv
export PATH="$HOME/.jenv/bin:$PATH"

# eval jenv init script
env which -s jenv && eval "$(jenv init -)"

# set up dinghy
env which -s dinghy && eval "$(dinghy env)"

export PATH="/usr/local/sbin:$PATH"

