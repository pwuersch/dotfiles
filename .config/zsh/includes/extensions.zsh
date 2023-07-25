#!/usr/bin/env zsh

# ------------------------------ fzf ------------------------------
if [ -d "${FZF_HOME}/bin" ]; then
  # Setup fzf
  if [[ ! "$PATH" == *$FZF_HOME/bin* ]]; then
    PATH="${PATH:+${PATH}:}$FZF_HOME/bin/bin"
  fi

  # Auto-completion
  [[ $- == *i* ]] && logged_source "$FZF_HOME/shell/completion.zsh" 2>/dev/null

  # Key bindings
  logged_source "$FZF_HOME/shell/key-bindings.zsh"
fi

# ------------------------------ zsh-autosuggestions ------------------------------
if [ -f "${ZSH_PLUGIN_DIR}/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  logged_source "${ZSH_PLUGIN_DIR}/zsh-autosuggestions/zsh-autosuggestions.zsh"
  bindkey '^f' autosuggest-accept
fi

# ------------------------------ zsh-completions ------------------------------
if [ -d "${ZSH_PLUGIN_DIR}/zsh-completions/src" ]; then
  fpath=("${ZSH_PLUGIN_DIR}/zsh-completions/src" $fpath)
fi

# ------------------------------ zsh-syntax-highlighting ------------------------------
if [ -f "${ZSH_PLUGIN_DIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  logged_source "${ZSH_PLUGIN_DIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# ------------------------------ zsh-z ------------------------------
if [ -f "${ZSH_PLUGIN_DIR}/zsh-z/zsh-z.plugin.zsh" ]; then
  logged_source "${ZSH_PLUGIN_DIR}/zsh-z/zsh-z.plugin.zsh"
  fpath=("${ZSH_PLUGIN_DIR}/zsh-z" $fpath)
  zstyle ':completion:*' menu select
fi

# ------------------------------ zsh-alias-finder ------------------------------
if [ -f "${ZSH_PLUGIN_DIR}/zsh-alias-finder/zsh-alias-finder.plugin.zsh" ]; then
  logged_source "${ZSH_PLUGIN_DIR}/zsh-alias-finder/zsh-alias-finder.plugin.zsh"
fi

# ------------------------------ trash-cli ------------------------------
if command -v trash &>/dev/null; then
  alias rm=trash
  alias rr=trash
  alias t=trash
fi

# ------------------------------ pyenv ------------------------------
if command -v pyenv &>/dev/null; then
  eval "$(pyenv init -)"
fi

# ------------------------------ fnm ------------------------------
# install fnm: curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell --install-dir $XDG_DATA_HOME/fnm
# install completions: fnm completions --shell zsh

if command -v fnm &>/dev/null; then
  eval "$(fnm env)"
fi
