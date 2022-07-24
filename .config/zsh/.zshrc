() {
  # ------------------------------ Set zsh plugins and set their options ------------------------------
  plugins=(
    command-not-found
    alias-finder
    git
    yarn
    rust
    golang
    docker
    docker-compose
    zsh-z
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-interactive-cd
    zsh-completions
  )

  ZSH_ALIAS_FINDER_AUTOMATIC=true
  ZSH_THEME="powerlevel10k/powerlevel10k"

  # ------------------------------ Miscellaneous ------------------------------
  compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

  # ------------------------------ Load external scripts conditionally ------------------------------
  fpath=(
    $ZDOTDIR/scripts
    $ZDOTDIR/zfuncs
    "${fpath[@]}"
  )

  autoload -Uz $fpath[1]/*

  local source_if_found() {
    [ -f $1 ] && source $1
  }

  source_if_found "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  source_if_found "$ZSH/oh-my-zsh.sh"
  source_if_found "$ZDOTDIR/.p10k.zsh"
  source_if_found "$FZF_HOME/.fzf.zsh"
  source_if_found "$XDG_CONFIG_HOME/nvm/nvm.sh"

  source $ZDOTDIR/local/*(D)

  unset -f source_if_found

  # ------------------------------ Conditionally override existing command ------------------------------
  local conditional_override() {
    if command -v $2 &> /dev/null ; then
      alias "$1=$2"
    fi
  }

  conditional_override rm trash
  conditional_override rr trash
  conditional_override t trash

  unset -f conditional_override

  # ------------------------------ Set aliases ------------------------------
  alias e="exit 0"
  alias n="nvim"
  alias cpr="cp -r"
  alias dba="docker build -t app ."
  alias gs="git switch"
  alias gpl="git branch --merged > /tmp/merged-branches && nvim /tmp/merged-branches && xargs git branch -d </tmp/merged-branches"
  alias gtr="git reset --hard"
  alias gtro="gtr origin/master"
  alias cds="cd ~/source"
  alias tf="terraform"
  alias tfa="tf apply --auto-approve"
  alias tfd="tf destroy --auto-approve"
  alias yayr="yay -Rsu"
  alias yays="yay -Syu"
  alias cb="wl-copy"
  alias l="exa -l --group-directories-first"
  alias la="exa -la --group-directories-first"
  alias wolp="wol 30:9C:23:8B:9D:6B"
  alias config="git --git-dir=$HOME/.cfg --work-tree=$HOME"
  alias code="code --enable-features=UseOzonePlatform --ozone-platform=wayland"
  alias dosh="./do.sh"
  alias c="ggt commit --debug"
  alias k="kubectl"
  alias hui="helm upgrade --install --debug --atomic"
  alias gvm="$GOPATH/bin/g"
  alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
  alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"

  function yayu() { yay -Rsu $(yay -Qtdq) }

  # ------------------------------ Utility functions ------------------------------
  secret () {
    output=~/"$1".$(date +%s).enc
    gpg -eao $output -r $KEYID "$1" && echo "$1 -> $output"
  }

  reveal () {
    output=$(echo "$1" | rev | cut -c16- | rev)
    gpg -do $output "$1" && echo "$1 -> $output"
  }


  # ------------------------------ Setup fzf addons ------------------------------
  # Auto-completion
  [[ $- == *i* ]] && source "${FZF_HOME}/shell/completion.zsh" 2> /dev/null

  # Key bindings
  source "${FZF_HOME}/shell/key-bindings.zsh"
}
