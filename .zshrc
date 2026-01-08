export TERM=xterm-256color

# Add deno completions to search path
if [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then export FPATH="$HOME/.zsh/completions:$FPATH"; fi
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# bin
export PATH=$PATH:$HOME/.local/bin
export XDG_CONFIG_HOME=$HOME/.config

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# brew
if [ -e /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
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

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
# bun completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# Deno
if [ -d $HOME/.deno ]; then . $HOME/.deno/env; fi

# Java
case "$(uname -s)" in
Linux)
  # Set JAVA_HOME for Linux
  export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
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
export PATH=$PATH:$ANDROID_HOME/build-tools

# use eza for ls
if command -v eza &>/dev/null; then
  alias ls='eza --icons=always --color=always --long'
fi

# use bat for cat
if command -v bat &>/dev/null; then
  alias cat='bat'
fi

# zoxide setup
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# fzf setup
if command -v fzf &>/dev/null; then
  source <(fzf --zsh)
  export FZF_CTRL_T_COMMAND=
  export FZF_ALT_C_COMMAND=
fi

# atuin setup
if [ -d $HOME/.atuin ]; then . $HOME/.atuin/bin/env; fi
eval "$(atuin init zsh)"

# kubectl
export KUBE_EDITOR=nvim
if command -v kubectl &>/dev/null; then
  source <(kubectl completion zsh)
fi
export PATH=${KREW_ROOT:-$HOME/.krew}/bin:$PATH

# Go
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/go/bin

eval "$(starship init zsh)"

if [[ -v VSCODE_INJECTION ]]; then
else
  eval "$(zellij setup --generate-auto-start zsh)"
fi

TS_NATIVE_PROJECT_HOME=$HOME/Projects/typescript-go
if [ -d "$TS_NATIVE_PROJECT_HOME" ]; then
  export PATH=$PATH:$TS_NATIVE_PROJECT_HOME/built/local
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$($HOME, '/miniconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
  else
    export PATH="$HOME/miniconda3/bin:$PATH"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Cuda
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64
export PATH=$PATH:$CUDA_HOME/bin

# opencode
export PATH=$HOME/.opencode/bin:$PATH

# uv Setup
export PATH=$HOME/.local/bin:$PATH
alias uvr="uv run"

# sst
export PATH=$HOME/.sst/bin:$PATH

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# bun run alias
alias brb="bun run --bun build"
alias brc="bun run --compile build"
alias brd="bun run --bun dev"
. "$HOME/.deno/env"
