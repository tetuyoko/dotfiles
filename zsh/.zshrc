#############################################
# aliases
#############################################

## basics
#alias ls='ls -AF'
#for mac
alias so='source'
alias less='less -qR'
alias ls='ls -G'
alias ll='ls -l -h'
alias df='df -h'
alias du='du -h'
alias sdif='svn diff . | /usr/share/vim/vim73/macros/less.sh'
alias svnlog='svn log -v -r {2012-12-25}:HEAD'
alias grep='grep --color=auto'
#alias rm='rmtrash'
alias mv='mv -i'
alias vi=vim
alias sc=screen
alias chrm='open "/Applications/Google Chrome.app" --args --profile-directory="Defalut"'
alias ctags="`brew --prefix`/bin/ctags"
alias hp='history-all | peco'

## Rails
alias be='bundle exec'
alias bes='bundle exec spring'
alias biv='bundle install --path=vendor/bundle --jobs=4' 

alias tailess='less -qR +F log/development.log'

## global
alias -g L='| less'
alias -g G='| grep'
alias -g H='| head'
alias -g N='> /dev/null'

## use GNU readlink
alias readlink=greadlink

#alias git-archive='git archive --format=tar HEAD | gzip > foo.tar.gz'

## search
#alias rgrep="rgrep -R"
#alias rgrepsvn="rgrep --exclude=\"*.svn*\""

alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'

#############################################
# zsh
#############################################

## Keybind
bindkey -v # vim bind
umask 002

## historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

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
## PROMPT
#############################################

## PROMPT
local pinfo="%n@%m${WINDOW:+"[$WINDOW]"}"
local pdir="%B%F{blue}%1~%f%b"
local pmark="%B%(?,%F{gray},%F{red})%(!.%%.%%)%f%b"
PROMPT="[$pinfo $pdir] $pmark "

## SPROMPT
SPROMPT="%{%F{red}correct%f%{$reset_color%}: %R -> %r ?(ynae) "

## RPROMPT
# VCS settings
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' actionformats '(%b|%a)'

#. /usr/local/bin/autojump

precmd() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
   [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"

   pwd=`pwd`
   #echo "[^[[35m$pwd^[[m]"
   #autojump -a $pwd
   echo $pwd > ~/.curdir
}

RPROMPT="%1(v|%F{green}%1v%f|)"

#############################################
## function
#############################################

autoload -Uz cd-gitroot
alias cdu='cd-gitroot'

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
#compinit -u

source $HOME/zsh/functions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(direnv hook zsh)"
export PATH="/usr/local/bin:$PATH"
