envfile="$HOME/.gnupg/gpg-agent.env"
if ( [[ ! -e "$HOME/.gnupg/S.gpg-agent" ]] && 
     [[ ! -e "/var/run/user/$(id -u)/gnupg/S.gpg-agent" ]] );
 then
     killall pinentry > /dev/null 2>&1
     gpgconf --reload scdaemon > /dev/null 2>&1
     pkill -x -INT gpg-agent > /dev/null 2>&1
     gpg-agent --daemon --enable-ssh-support > $envfile
 fi

# Wake up smartcard to avoid races

gpg --card-status > /dev/null 2>&1

source "$envfile"
