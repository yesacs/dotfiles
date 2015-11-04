function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref#refs/heads/}") "
}

YELLOW="\[\033[0;33m\]"
GREEN="\[\033[m\]"
ORANGE="\[\033[0;36m\]"
BLACK="\[\033[0;30m\]"
BLACKBOLD="\[\033[1;30m\]"
RED="\[\033[0;31m\]"
REDBOLD="\[\033[1;31m\]"
GREENBOLD="\[\033[1;32m\]"
YELLOWBOLD="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
BLUEBOLD="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
PURPLEBOLD="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
CYANBOLD="\[\033[1;36m\]"
WHITE="\[\033[0;37m\]"
WHITEBOLD="\[\033[1;37m\]"

PS1="$PURPLE\d \t\n$CYANBOLD[ $CYAN\h $CYANBOLD \w$YELLOW \$(parse_git_branch)$CYANBOLD] $GREEN"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

CVSROOT=:pserver:ddccaseys@cvs.dealer.com:/projects/nexus
export CVSROOT

export VISUAL=vim
export EDITOR="$VISUAL"

case `uname` in
'Darwin')
# Mac specific settings
  alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
  alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
# End Mac specific settings
;;
'Linux')
# Linux specific settings
  export TERM=xterm-256color
# End Linux specific settings
;;
esac

