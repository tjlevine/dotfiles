# custom pf alias
alias pf='ps -ef | grep $1'

# some ls aliases
alias ll='ls -AlF'
alias la='ls -la'
alias l='ls -ACF'

# source is too long, and I do this
# a lot when writing bash scripts
alias so='source'

# source local aliases
[ -e "$HOME/.bash_aliases.local" ] && source "$HOME/.bash_aliases.local"

# vim: ft=sh
