if [ "$TMUX" = "" ]; then tmux -u; fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="local-agnoster"

# Download Znap, if it's not there yet.
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
	git clone --depth 1 -- \
		https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh # Start Znap

# `znap source` automatically downloads and starts your plugins.
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

# `znap eval` caches and runs any kind of command output for you.
znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

BASE16_SHELL_PATH="$HOME/.config/base16-shell"
[ -n "$PS1" ] &&
	[ -s "$BASE16_SHELL_PATH/profile_helper.sh" ] &&
	source "$BASE16_SHELL_PATH/profile_helper.sh"

plugins=(
	git
)

source $ZSH/oh-my-zsh.sh

# >>> conda initialize >>>
export MINICONDA_HOME=$HOME/miniconda3
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$MINICONDA_HOME/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$MINICONDA_HOME/etc/profile.d/conda.sh" ]; then
        . "$MINICONDA_HOME/etc/profile.d/conda.sh"
    else
        export PATH="$MINICONDA_HOME/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# activate base environment by default
conda activate base

# NVM Setup
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
	export JAVA_HOME="/usr/lib/jvm/java-20-openjdk-amd64"
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

# use batcat for cat
if command -v batcat >/dev/null 2>&1; then
	alias cat='batcat'
fi

# bin
export PATH=$PATH:$HOME/.local/bin

# use eza for ls
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons=always --color=always'
fi

# zoxide setup
eval "$(zoxide init zsh)"

# neovim setup
export PATH=$PATH:/opt/nvim-linux64/bin
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin
alias vim=nvim


# pulumi setup
export PATH=$PATH:$HOME/.pulumi/bin


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# fzf options
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export LANG=en_US.UTF-8

# sst
export PATH=/Users/abinashpanda/.sst/bin:$PATH
