## Prompt
#
# colors for permissions
if [[ "$EUID" -ne "0" ]]
then  # if user is not root
	USER_LEVEL="%F{white}"
else # root!
	USER_LEVEL="%F{red}"
fi

# VCS settings
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' actionformats '%b|%a'

## PROMPT
local pinfo="%n@%m${WINDOW:+"[$WINDOW]"}"
local pdir="%B%F{blue}%1~%f%b"
local pmark="%B%(?,%F{gray},%F{red})%(!.%%.%%)%f%b"
local vcs="🪵 %1v"
PROMPT="${USER_LEVEL}[$pinfo $pdir $vcs]
$pmark "

## SPROMPT
SPROMPT="%{%F{red}correct%f%{$reset_color%}: %R -> %r ?(ynae) "

autoload -U colors; colors

# allow functions in the prompt
setopt PROMPT_SUBST

# autoload zsh functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

#. /usr/local/bin/autojump
precmd() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
   [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"

   pwd=`pwd`
   echo $pwd > ~/.curdir
}
 
# enable auto-execution of functions
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
 
# prepend git functions needed for prompt
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
#precmd_functions+='_zsh_kubectl_prompt_precmd'
chpwd_functions+='chpwd_update_git_vars'
