## Shortcut-key for Git branch checkout.
#
function git-checkout() {
  git branch | peco | xargs git checkout
}
zle -N git-checkout
