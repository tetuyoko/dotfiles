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
bindkey '^R' peco_select_history
unalias run-help
HELPDIR=/usr/local/share/zsh/help

cd `cat ~/.curdir`
compinit -u
umask 002

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh ]]

eval "$(direnv hook zsh)"
eval "$(rbenv init - zsh)"
eval "$(pyenv init -)"

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

export PATH="$HOME/.yarn/bin:$PATH"

### Added by IBM Bluemix CLI
source /usr/local/Bluemix/bx/zsh_autocomplete

ssh-add ~/.ssh/github/id_rsa
ssh-add ~/.ssh/fujossy/fujossy.pem


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/tetuyoko/test/chromeless/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/tetuyoko/test/chromeless/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/tetuyoko/test/chromeless/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/tetuyoko/test/chromeless/serverless/node_modules/tabtab/.completions/sls.zsh
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tetuyoko/test/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/tetuyoko/test/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tetuyoko/test/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/tetuyoko/test/google-cloud-sdk/completion.zsh.inc'; fi
