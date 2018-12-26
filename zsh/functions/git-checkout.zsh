function git-checkout() {
  git branch | peco | xargs git checkout
}
zle -N git-checkout
