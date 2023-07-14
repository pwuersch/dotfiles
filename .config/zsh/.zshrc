eval "$(starship init zsh)" || echo "WARNING: was unable to load starship prompt"

fpath=("${ZDOTDIR}/zfuncs" $fpath)

debug_loaded_files=()

for f in $ZDOTDIR/includes/*; do
  if [ -f $f ]; then
    debug_loaded_files+=("$f")
    source $f
  fi
done

for f in $ZDOTDIR/local/*; do
  if [ -f $f ]; then
    debug_loaded_files+=("$f")
    source $f
  fi
done
unset f

autoload -U +X bashcompinit && bashcompinit
autoload -U compaudit compinit zrecompile
