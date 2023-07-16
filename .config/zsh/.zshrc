eval "$(starship init zsh)"

fpath=("${ZDOTDIR}/zfuncs" $fpath)

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
  file="$ZDOTDIR/includes/$file.zsh"

  start=`date +%s.%N`
  source "$file"
  end=`date +%s.%N`
  
  debug_loaded_files+="$file ($(echo "$end - $start" | bc -l))\n"
done

for file in $ZDOTDIR/local/*(D); do
  start=`date +%s.%N`
  source $file
  end=`date +%s.%N`

  debug_loaded_files+="$file ($(echo "$end - $start" | bc -l))\n"
done

autoload -U +X bashcompinit && bashcompinit
autoload -U compaudit compinit zrecompile

unset includes file start end
