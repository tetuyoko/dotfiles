#█▓▒░ aliases
#
#███████▓▒░ basic
alias so='source'
alias less='less -qR'
alias ll="ls -l -h"
alias ls="ls -G"
alias df='df -h'
alias du='du -h'
alias grep='grep --color=auto'
#alias rm='rmtrash'
alias mv='mv -i'
alias vi=vim
alias sc=screen
alias chrm='open "/Applications/Google Chrome.app" --args --profile-directory="Defalut"'
alias ctags="`brew --prefix`/bin/ctags"
alias hp='history-all | peco'
alias tailess='less -qR +F log/development.log'

#███████▓▒░ rails
alias be='bundle exec'
alias biv='bundle install --path=vendor/bundle --jobs=4' 

#███████▓▒░ pipe
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
alias cdu='cd-gitroot'

alias tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'
alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; diskutil list; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h;'
alias record="ffmpeg -f x11grab -s 1366x768 -an -r 16 -loglevel quiet -i :0.0 -b:v 5M -y" #pass a filename

tmx() {
  [[ $# -eq 0 ]] && bash ~/bin/tmx 0 || bash ~/bin/tmx $#
}
email() {
	echo $3 | mutt -s $2 $1
}
# colorized cat
c() {
  for file in "$@"
  do
    pygmentize -O style=sourcerer -f console256 -g "$file"
  done
}
# colorized less
l() {
  pygmentize -O style=sourcerer -f console256 -g $1 | less -r
}
# read markdown files like manpages
md() {
    pandoc -s -f markdown -t man "$*" | man -l -
}
# nullpointer url shortener
short() {
  curl -F"shorten=$*" https://0x0.st
}
