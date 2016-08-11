#
#  ███████  ██████░██      ██████  █████ 
# ░░░░░██  ██░░░░ ░██████ ░░██░░█ ██░░░██
#     ██  ░░█████ ░██░░░██ ░██ ░ ░██  ░░ 
#    ██    ░░░░░██░██  ░██ ░██   ░██   ██
#   ██████ ██████ ░██  ░██░███   ░░█████ 
#  ░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░  
#
# █▓▒░ load configs
for config (~/.zsh/*.zsh) source $config

# Block of OS X ElCapitan /etc/zshprofile load.
setopt no_global_rcs

## Keybind
bindkey -v # vim bind
umask 002

## historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
#bindkey "^N" history-beginning-search-forward-end
#bindkey "^R" history-incremental-pattern-search-backward
#bindkey "^S" history-incremental-pattern-search-forward

## Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS     # ignore duplication command history list
setopt SHARE_HISTORY        # share command history data
setopt EXTENDED_HISTORY

fpath=($HOME/zsh/functions/cd-gitroot(N-/) $fpath)
fpath=($HOME/zsh/functions/zsh-completions/src(N-/) $fpath)

setopt AUTO_CD            # less cd only directory
setopt AUTO_PUSHD         # save cd history to PUSHD
setopt PUSHD_IGNORE_DUPS  # ignore duplication  PUSHD
setopt CORRECT            # pattern展開
setopt LIST_PACKED
setopt NO_LIST_BEEP
setopt NO_BEEP
setopt IGNORE_EOF # ^Dでzshを終了しない
setopt NO_FLOW_CONTROL # ^Q/^Sのフローコントロールを無効にする

#############################################
## function
#############################################
autoload -Uz cd-gitroot

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
zle -N cdup
#bindkey '\^' cdup

# UNIXTIME to date
function ut2date {
  /bin/date -u -r $1 +"%Y/%m/%d %H:%M:%S UTC"
  /bin/date -r $1 +"%Y/%m/%d %H:%M:%S"
}

# date to UNIXTIME
function date2ut {
  /bin/date -j -f "%Y/%m/%d %H:%M:%S" "$1" +%s
}

function exists { which $1 &> /dev/null }

if exists peco; then
  function peco_select_history() {
    local tac
    exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
    BUFFER=$(history -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER         # move cursor
    zle -R -c               # refresh
  }


  zle -N peco_select_history

  bindkey '^R' peco_select_history
fi

function clear_line() {
  clear
  zle reset-prompt
}
zle -N clear_line
bindkey '^K' clear_line

function history-all { history -E 1 }

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
