#!/usr/bin/env zsh

set -euo pipefail

GIT_REPOS=(
  https://github.com/zsh-users/zsh-autosuggestions.git
  https://github.com/zsh-users/zsh-syntax-highlighting.git
  https://github.com/zsh-users/zsh-completions.git
  https://github.com/agkozak/zsh-z.git
)

cd "$ZSH_PLUGIN_DIR" # This variable should be set from .zshenv

for repo in "${GIT_REPOS[@]}"; do
  echo "$repo"
  git clone --depth 1 "$repo" || echo Failed to clone "$repo"
done
