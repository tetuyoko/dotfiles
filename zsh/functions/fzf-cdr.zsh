## Incremental search for change directories.
#
function fzf-cdr() {
  local selected_dir=$(cdr -l | awk '{ print $2 }' | fzf)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf-cdr
