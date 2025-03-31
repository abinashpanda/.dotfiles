# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG=en_US.UTF-8

# brew
if [ -e /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# bin
export PATH=$PATH:$HOME/.local/bin

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1
zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

plugins=(
  git
  colored-man-pages
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

if [[ -v VSCODE_INJECTION ]]; then
else
  eval "$(zellij setup --generate-auto-start zsh)"
fi

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

# kubectl
export KUBE_EDITOR=nvim

# atuin setup
if [ -d $HOME/.atuin ]; then . $HOME/.atuin/bin/env; fi
eval "$(atuin init zsh)"

# Python
alias python=python3
alias pip=pip3
alias uvr="uv run"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
