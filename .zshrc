export LANG=en_US.UTF-8

# brew
if [ -e /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Download Znap, if it's not there yet.
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
  git clone --depth 1 -- \
    https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh # Start Znap

# `znap source` automatically downloads and starts your plugins.
znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-autosuggestions

plugins=(
  git
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# NVM Setup
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Go libraries
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/go/bin

# Java
case "$(uname -s)" in
Linux)
  # Set JAVA_HOME for Linux
  export JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"
  ;;
Darwin)
  # Set JAVA_HOME for macOS
  export JAVA_HOME="$HOME/Applications/Android Studio.app/Contents/jbr/Contents/Home"
  ;;
esac

# Android Studio
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# bin
export PATH=$PATH:$HOME/.local/bin

# use eza for ls
if command -v eza &>/dev/null; then
  alias ls='eza --icons=always --color=always --long'
fi

# use bat for cat
if command -v bat &>/dev/null; then
  alias cat='bat'
fi

# zoxide setup
eval "$(zoxide init zsh)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
# completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Deno
if [ -d $HOME/.deno ]; then . $HOME/.deno/env; fi

# fzf options
source <(fzf --zsh)
export FZF_CTRL_T_COMMAND=
export FZF_ALT_C_COMMAND=

# sst
export PATH=$PATH:$HOME/.sst/bin

# kubectl
export KUBE_EDITOR=nvim

# nix shell
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi

# atuin setup
if [ -d $HOME/.atuin ]; then . $HOME/.atuin/bin/env; fi
eval "$(atuin init zsh)"

# Temporarily disabling tmux as I am trying out zellij
# if [ "$TMUX" = "" ]; then tmux -u; fi
if [[ -v VSCODE_INJECTION ]]; then
else
  eval "$(zellij setup --generate-auto-start zsh)"
fi

alias python=python3
alias pip=pip3
alias uvr="uv run"
. "$HOME/.local/share/../bin/env"
