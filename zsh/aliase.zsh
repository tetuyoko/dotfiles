## Alias
#
alias so='source'
alias sed='gsed'

alias kc='kubectl'
alias less='less -qR'
alias ll="ls -lh"
#alias ls="ls -Gh"
alias ls='gls --color=auto'
alias df='df -h'
alias du='du -h'
alias grep='grep --color=auto'
#alias rm='rmtrash'
alias mv='mv -i'
alias vi=vim
#alias sc=screen
alias chrm='open "/Applications/Google Chrome.app" --args --profile-directory="Defalut"'
alias ctags="`brew --prefix`/bin/ctags"
#alias node='node --expose_gc --optimize_for_size --max_old_space_size=4096 --gc_interval=100'

alias fzf='fzf --layout=reverse --height=65%'
alias hp='history-all | fzf'
alias tailess='less -qR +F log/development.log'
alias zmv='noglob zmv -W'
alias readlink=greadlink
alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'
#alias cdu='cd-gitroot'
alias tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'
alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; diskutil list; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h;'
alias record="ffmpeg -f x11grab -s 1366x768 -an -r 16 -loglevel quiet -i :0.0 -b:v 5M -y" #pass a filename

alias ssh-add='ssh-add -K'

# Rails
alias be='bundle exec'
alias biv='bundle install --path=vendor/bundle --jobs $(nproc)'

# Python
alias python='python3'

# Pipe
alias -g L='| less'
alias -g G='| grep'
alias -g H='| head'
alias -g P='| fzf'
alias -g N='> /dev/null'

#alias tmux="TERM=screen-256color-bce tmux"
#eval "$(hub alias -s)"
