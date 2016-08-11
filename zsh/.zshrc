#                ░██      
#  ██████  ██████░██      
# ░░░░██  ██░░░░ ░██████  
#    ██  ░░█████ ░██░░░██ 
#   ██    ░░░░░██░██  ░██ 
#  ██████ ██████ ░██  ░██ 
# ░░░░░░ ░░░░░░  ░░   ░░  
#
# █▓▒░ load configs
for config (~/.zsh/*.zsh) source $config

## Keybind
bindkey -v # vim bind
umask 002

## historical backward/forward search with linehead string binded to ^P/^N

fpath=($HOME/zsh/functions/cd-gitroot(N-/) $fpath)
fpath=($HOME/zsh/functions/zsh-completions/src(N-/) $fpath)

#############################################
## function
#############################################
# % zman SHARE_HISTORY
function zman() {
  PAGER="less -g -s '+/^ {7}"$1"'" man zshall
}

function chpwd() { ls }

function cdup() {
  echo
  cd ..
  zle reset-prompt
}

# UNIXTIME to date
function ut2date {
  /bin/date -u -r $1 +"%Y/%m/%d %H:%M:%S UTC"
  /bin/date -r $1 +"%Y/%m/%d %H:%M:%S"
}

# date to UNIXTIME
function date2ut {
  /bin/date -j -f "%Y/%m/%d %H:%M:%S" "$1" +%s
}

function clear_line() {
  clear
  zle reset-prompt
}

function history-all { history -E 1 }

zle -N cdup
zle -N clear_line
autoload -Uz cd-gitroot
bindkey '^K' clear_line

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

cd `cat ~/.curdir`

# zmv -W '*.html' '*.txt'
autoload -Uz zmv
alias zmv='noglob zmv -W'

autoload -Uz compinit
compinit -u

source $HOME/zsh/functions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(direnv hook zsh)"
eval "$(rbenv init - zsh)"
