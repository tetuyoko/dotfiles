# Main .zshrc
# Load configs.
for config (~/ghq/github.com/tetuyoko/dotfiles/zsh/**/*.zsh) source $config
source $HOME/ghq/github.com/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



# Bind keys.
bindkey -v
bindkey '^K' clear_line
bindkey '^R' fzf_select_history
#bindkey '^E' fzf-cdr
bindkey '^]' ghq-fzf
bindkey '^G' gconf
bindkey '^O' git-checkout

unalias run-help
HELPDIR=/usr/local/share/zsh/help
zle -N cdup
zle -N clear_line


# Completions.
cd `cat ~/.curdir`
compinit -u
umask 002

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh ]]
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi

source <(kubectl completion zsh)
#source <(helm completion zsh)


# Function.
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

fpath=($HOME/zsh/functions/cd-gitroot(N-/) $fpath)
fpath=($HOME/zsh/functions/zsh-completions/src(N-/) $fpath)

eval "$(rbenv init - zsh)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tetuyoko/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tetuyoko/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tetuyoko/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tetuyoko/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/tetuyoko/.docker/completions $fpath)
compinit
# End of Docker CLI completions
