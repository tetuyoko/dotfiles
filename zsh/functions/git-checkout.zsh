## Shortcut-key for Git branch checkout.
#
function git-checkout() {
  git branch | fzf | xargs git checkout
}
zle -N git-checkout
