.dotfiles
=========

This repository consists of configuration files for :

* `nvim`: `nvim/init.vim`
* `tmux` : `.tmux.conf`
* `zsh` : `.zshrc`

## Zsh

1. Setup [ohmyzsh](https://ohmyz.sh/)
2. Install [starship](https://starship.rs/)
3. Install [base16-themes](https://github.com/tinted-theming/base16-shell#bashzsh)
4. Install [nvm](https://github.com/nvm-sh/nvm)

## Neovim

### Install neovim
Follow the instructions [over here](https://github.com/neovim/neovim/wiki/Installing-Neovim)

### Adding `nvm`

Using [nvm.fish](https://github.com/jorgebucaran/nvm.fish).

Copy `conf.d/nvm.fish`, `functions/nvm.fish` and `completions/nvm.fish` to
their respective directories after install `nvm`.

## Tmux

### Install `tmux`

Install `tmux` for you OS using the instructions [over
here](https://github.com/tmux/tmux/wiki/Installing)

### Install TPM

Install tmux [plugin manager (TPM)](https://github.com/tmux-plugins/tpm) to install the plugins

### Configuring `tmux`

Copy the `.tmux.conf` file to your home directory using
```sh
cp .tmux.conf $HOME
```

## Mac OS

* To enable press and hold use `defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false`
