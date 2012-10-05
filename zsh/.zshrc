###############
# aliases
###############

## basics
#alias ls='ls -AF'
#for mac
alias ls='ls -G'
alias ll='ls -l'
alias df='df -h'
alias du='du -h'

## vim
alias vi=vim

## screen
alias sc=screen

## redis
alias telnet_redis='telnet localhost 6379'

## Rails
alias be='bundle exec'

## search
#alias rgrep="rgrep -R"
#alias rgrepsvn="rgrep --exclude=\"*.svn*\""

###############
# zsh
###############

## Keybind
bindkey -v

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

## PROMPT
#PROMPT="%/%% "
PROMPT="[${USER}@${HOST%%.*} %1~]%(!.%%.%%) "
#SPROMPT="%{$fg_bold[red]%}correct%{$reset_color%}: %R -> %r ? ""}]}"

#function chpwd() { ls -v -F --color=auto }
function chpwd() { ls }
#function cdup() {
#  echo
#  cd ..
#  zle reset-prompt
#}

#zle -N cdup
#bindkey '\^' cdup''
