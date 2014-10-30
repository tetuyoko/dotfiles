#export V_TARGET_ID="android-16"
export V_TARGET_ID="android-14"
export IPHONE_SIM=~/Library/Application\ Support/iPhone\ Simulator
# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/yokoyama_tetsuro/cocos2d-x-3.2/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/Cellar/ant/1.9.3/libexec/bin
export PATH=$ANT_ROOT:$PATH

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Android dev environment for MacOS
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
export JAVA_HOME=`/usr/libexec/java_home -v 1.6`
export ANDROID_HOME=/opt/adt-bundle-mac-x86_64/sdk
export ANDROID_NDK_ROOT=/opt/android-ndk-r8e
export PATH=${ANDROID_NDK_ROOT}:$PATH
export PATH=${ANDROID_HOME}/platform-tools:$PATH
export PATH=${ANDROID_HOME}/tools:$PATH

export NDK_ROOT=${ANDROID_NDK_ROOT} 
export NDK_CCACHE=`which ccache`
export ANDROID_SDK_ROOT=${ANDROID_HOME}

export USDPRO=/Users/yokoyama_tetsuro/project/usdragon/git-wk3/usdragon-server
export SAKURAS=/Users/yokoyama_tetsuro/project/sakura-server
export SAKURAC=/Users/yokoyama_tetsuro/project/sakura-client
export SK_WORK_DIR=/Users/yokoyama_tetsuro/project/sakura-client
export WST=/Users/tetuyoko/test/workstation

#############################################
# aliases
#############################################

## basics
#alias ls='ls -AF'
#for mac
alias so='source'
alias less='less -R'
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

## Rails
alias be='bundle exec'
alias bes='bundle exec spring'
alias biv='bundle install --path=vendor/bundle' 

#alias git-archive='git archive --format=tar HEAD | gzip > foo.tar.gz'

## search
#alias rgrep="rgrep -R"
#alias rgrepsvn="rgrep --exclude=\"*.svn*\""

#############################################
# zsh
#############################################

## Keybind
bindkey -v
umask 002

## historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

## Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
setopt EXTENDED_HISTORY

autoload -U compinit
compinit -u
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct
setopt list_packed
setopt nolistbeep

## LANG
export LANG=ja_JP.UTF-8
#export LANG=en_US.UTF-8


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

. /usr/local/etc/autojump.zsh

precmd() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
   [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"

   pwd=`pwd`
   #echo "[^[[35m$pwd^[[m]"
   autojump -a $pwd
   echo $pwd > ~/.curdir
}

RPROMPT="%1(v|%F{green}%1v%f|)"

#############################################
## function
#############################################

function chpwd() { ls }
#function cdup() {
#  echo
#  cd ..
#  zle reset-prompt
#}

#zle -N cdup
#bindkey '\^' cdup''

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
