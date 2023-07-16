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

debug_loaded_files=()
for f in "${includes[@]}"; do
  debug_loaded_files+=($f)
  source $ZDOTDIR/includes/$f.zsh
done

for f in $ZDOTDIR/local/*; do
  if [ -f $f ]; then
    debug_loaded_files+=("$f")
    source $f
  fi
done

autoload -U +X bashcompinit && bashcompinit
autoload -U compaudit compinit zrecompile
