#!/usr/bin/env zsh

eval "$(starship init zsh)"

fpath=("${ZDOTDIR}/zfuncs" $fpath)

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

for file in "${includes[@]}"; do
  logged_source "$ZDOTDIR/includes/$file.zsh"
done

for file in $ZDOTDIR/local/*(D); do
  logged_source "$file"
done

autoload -U +X bashcompinit && bashcompinit
autoload -U compaudit compinit zrecompile

unset includes file start end
