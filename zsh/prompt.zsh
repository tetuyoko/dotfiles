## Prompt
#
# colors for permissions
if [[ "$EUID" -ne "0" ]]
then  # if user is not root
	USER_LEVEL="%F{white}"
else # root!
	USER_LEVEL="%F{red}"
fi

## PROMPT
local pinfo="%n@%m${WINDOW:+"[$WINDOW]"}"
local pdir="%B%F{blue}%1~%f%b"
local pmark="%B%(?,%F{gray},%F{red})%(!.%%.%%)%f%b"
PROMPT="${USER_LEVEL}[$pinfo $pdir] $pmark "

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

autoload -U colors; colors
#RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
#RPROMPT='$ZSH_KUBECTL_PROMPT'

# allow functions in the prompt
setopt PROMPT_SUBST

# autoload zsh functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)
 
# enable auto-execution of functions
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
 
# prepend git functions needed for prompt
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
precmd_functions+='_zsh_kubectl_prompt_precmd'
chpwd_functions+='chpwd_update_git_vars'
