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
source $HOME/zsh/functions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# vim bind
bindkey -v

fpath=($HOME/zsh/functions/cd-gitroot(N-/) $fpath)
fpath=($HOME/zsh/functions/zsh-completions/src(N-/) $fpath)

zle -N cdup
zle -N clear_line
bindkey '^K' clear_line

unalias run-help
HELPDIR=/usr/local/share/zsh/help

cd `cat ~/.curdir`
compinit -u
umask 002

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh ]]

eval "$(direnv hook zsh)"
eval "$(rbenv init - zsh)"

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
