# ------------------------------ fzf ------------------------------
if [ -d "${FZF_HOME}/bin" ]; then
  # Setup fzf
  if [[ ! "$PATH" == *$FZF_HOME/bin* ]]; then
    PATH="${PATH:+${PATH}:}$FZF_HOME/bin/bin"
  fi

  # Auto-completion
  [[ $- == *i* ]] && source "$FZF_HOME/shell/completion.zsh" 2>/dev/null

  # Key bindings
  source "$FZF_HOME/shell/key-bindings.zsh"
fi

# ------------------------------ zsh-autosuggestions ------------------------------
if [ -f "${ZSH_PLUGIN_DIR}/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "${ZSH_PLUGIN_DIR}/zsh-autosuggestions/zsh-autosuggestions.zsh"
  bindkey '^f' autosuggest-accept
fi

# ------------------------------ zsh-completions ------------------------------
if [ -d "${ZSH_PLUGIN_DIR}/zsh-completions/src" ]; then
  fpath=("${ZSH_PLUGIN_DIR}/zsh-completions/src" $fpath)
fi

# ------------------------------ zsh-syntax-highlighting ------------------------------
if [ -f "${ZSH_PLUGIN_DIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "${ZSH_PLUGIN_DIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# ------------------------------ zsh-z ------------------------------
if [ -f "${ZSH_PLUGIN_DIR}/zsh-z/zsh-z.plugin.zsh" ]; then
  source "${ZSH_PLUGIN_DIR}/zsh-z/zsh-z.plugin.zsh"
  fpath=("${ZSH_PLUGIN_DIR}/zsh-z" $fpath)
  zstyle ':completion:*' menu select
fi

# ------------------------------ trash-cli ------------------------------
if command -v trash &>/dev/null; then
  alias rm=trash
  alias rr=trash
  alias t=trash
fi

# ------------------------------ nvm ------------------------------
if [ -f "${XDG_CONFIG_HOME}/nvm/nvm.sh" ]; then
  source "${XDG_CONFIG_HOME}/nvm/nvm.sh"
fi

# ------------------------------ pyenv ------------------------------
if command -v pyenv &>/dev/null; then
  eval "$(pyenv init -)"
fi
