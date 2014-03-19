export USDPRO=/Users/yokoyama_tetsuro/project/usdragon/git-wk3/usdragon-server
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

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
alias rm='rmtrash'
alias mv='mv -i'
alias vi=vim
alias sc=screen

## Rails
alias be='bundle exec'
alias bes='bundle exec spring'
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

autoload -U compinit
compinit
setopt auto_cd
setopt auto_pushd
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
precmd() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
   [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
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

