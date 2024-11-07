#!/bin/bash

formulae=(
  "bat"
  "btop"
  "caddy"
  "eza"
  "fzf"
  "gum"
  "lazydocker"
  "neovim"
  "ripgrep"
  "tmux"
  "xh"
  "zoxide"
  "atuin"
)

for formula in "${formulae[@]}"; do
  brew install $formula
done
