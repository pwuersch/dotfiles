#!/usr/bin/env zsh

# ------------------------------ Custom Aliases ------------------------------
alias _='sudo '
alias e="exit 0"
alias n="nvim"
alias md='mkdir -p'
alias cpr="cp -r"
alias dba="docker build -t app ."
alias gs="git switch"
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
alias bzl="bazelisk"
alias pnpu="corepack prepare pnpm@latest --activate"

# ------------------------------ Utility functions ------------------------------
secret() {
  output=~/"$1".$(date +%s).enc
  gpg -eao $output -r $KEYID "$1" && echo "$1 -> $output"
}

reveal() {
  output=$(echo "$1" | rev | cut -c16- | rev)
  gpg -do $output "$1" && echo "$1 -> $output"
}

gpl() {
  git fetch -p --all
  git branch -r |
    awk '{print $1}' |
    egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) |
    awk '{print $1}' |
    xargs git branch -d
}

gplf() {
  git fetch -p --all
  git branch -r |
    awk '{print $1}' |
    egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) |
    awk '{print $1}' |
    xargs git branch -D
}

yayu() {
  yay -Rsu $(yay -Qtdq)
}

clear_completions() {
  rm "${ZDOTDIR}/.zcompdump*"
  compinit
}
