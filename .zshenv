export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONIFG_DIRS="/etc/xdg"

export ARCHFLAGS="-arch x86_64"
export TZ="Europe/Zurich"
export KEYID="0xFE5AF81974F5CD23"

export ZSH="$HOME/.oh-my-zsh"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export DENO_INSTALL="$XDG_DATA_HOME/deno"
export DVM_DIR="$XDG_DATA_HOME/dvm"
export KREW_ROOT="$XDG_DATA_HOME/krew"
export TFENV_ROOT="$XDG_DATA_HOME/tfenv"
export GOROOT="$XDG_DATA_HOME/go"
export GOPATH="$HOME/source/go"

export BROWSER="/usr/bin/firefox"
export MOZ_ENABLE_WAYLAND=1
export EDITOR=nvim

export PATH="$PATH:$DENO_INSTALL/bin"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/.yarn/bin"
export PATH="$PATH:$DENO_INSTALL/bin"
export PATH="$PATH:$DVM_DIR/bin"
export PATH="$PATH:$KREW_ROOT/bin"
export PATH="$PATH:$XDG_DATA_HOME/tfenv/bin"
export PATH="$PATH:$GOPATH/bin"
