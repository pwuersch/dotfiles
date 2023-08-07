#!/usr/bin/env zsh

eval "$(starship init zsh)"

fpath=("${ZDOTDIR}/zfuncs" $fpath)

# provides a proxy to `source` files with tracked time
logged_source() {
  start=`date +%s.%N`
  source $1
  end=`date +%s.%N`
  debug_loaded_files+="$(echo "$end - $start" | bc -l): $1\n"
}

includes=(
  aliases
  completion
  directories
  history
  keybindings
  git
  misc
  extensions
)

# load "includes" in order they were defined from ./includes/{name}
for file in "${includes[@]}"; do
  logged_source "$ZDOTDIR/includes/$file.zsh"
done
unset file includes

# load local addons
for file in $ZDOTDIR/local/*(D); do
  logged_source "$file"
done
unset file

# initialize completions
autoload -Uz compinit bashcompinit
compinit
bashcompinit

# cleanup local variables / functions related to debugging and tracing
unset logged_source start end
