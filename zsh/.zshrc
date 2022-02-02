# Main .zshrc
#
#

## Load configs.
#
for config (~/.zsh/**/*.zsh) source $config
source $HOME/zsh/functions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


## Bind keys.
#
bindkey -v
bindkey '^K' clear_line
bindkey '^R' peco_select_history
bindkey '^E' peco-cdr
bindkey '^G' gconf
bindkey '^O' git-checkout

unalias run-help
HELPDIR=/usr/local/share/zsh/help
zle -N cdup
zle -N clear_line


## Completions.
#
cd `cat ~/.curdir`
compinit -u
umask 002

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh ]]
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi

source <(kubectl completion zsh)
#source <(helm completion zsh)


## Function.
#
# % zman SHARE_HISTORY
#
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

fpath=($HOME/zsh/functions/cd-gitroot(N-/) $fpath)
fpath=($HOME/zsh/functions/zsh-completions/src(N-/) $fpath)

eval "$(direnv hook zsh)"
eval "$(rbenv init - zsh)"
#eval "$(pyenv init -)"

