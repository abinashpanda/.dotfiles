#!/bin/bash

formulae=(
  "jandedobbeleer/oh-my-posh/oh-my-posh"
  "bat"
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
  "hyperfine"
  "glow"
  "gum"
  "jq"
)

for formula in "${formulae[@]}"; do
  brew install $formula
done
