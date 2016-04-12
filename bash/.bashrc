#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# .bashrc
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions

# Source global definitions
#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
#fi

# User specific aliases and functions


# Added by the canvas-lms setup script
# These settings make chruby work
# See https://github.com/postmodern/chruby
[ -f /usr/local/share/chruby/chruby.sh ] && . /usr/local/share/chruby/chruby.sh
[ -f /usr/local/share/chruby/auto.sh ] && . /usr/local/share/chruby/auto.sh
[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ] && . /usr/local/opt/chruby/share/chruby/chruby.sh
[ -f /usr/local/opt/chruby/share/chruby/auto.sh ] && . /usr/local/opt/chruby/share/chruby/auto.sh
