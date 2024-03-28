if [ "$TMUX" = "" ]; then tmux -u; fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Use neovim
alias vim="nvim"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="eastwood"
# ZSH_THEME="awesomepanda"
ZSH_THEME="local-agnoster"

# Download Znap, if it's not there yet.
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh  # Start Znap

# `znap source` automatically downloads and starts your plugins.
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

bindkey '^I' autosuggest-accept

# `znap eval` caches and runs any kind of command output for you.
znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

BASE16_SHELL_PATH="$HOME/.config/base16-shell"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL_PATH/profile_helper.sh" ] && \
    source "$BASE16_SHELL_PATH/profile_helper.sh"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export ANDROID_HOME=$HOME/Library/Android/sdk
path+=($ANDROID_HOME/emulator $ANDROID_HOME/platform-tools)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/abinashpanda/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/abinashpanda/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/abinashpanda/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/abinashpanda/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# NVM Setup
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

# pnpm
export PNPM_HOME="/Users/abinashpanda/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export BUN_INSTALL=$HOME/.bun
export PATH=$PATH:$BUN_INSTALL/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/abinashpanda/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/abinashpanda/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/abinashpanda/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/abinashpanda/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

path+=($HOME/Softwares/)

eval "$(zoxide init zsh)"

# Add installed go packages in path
path+=($HOME/go/bin)
