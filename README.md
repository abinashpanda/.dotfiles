.dotfiles
=========

This repository consists of configuration files for :

* `nvim`: `nvim/init.vim`
* `tmux` : `.tmux.conf`
* `fish`: `fish`

## Neovim

### Install neovim
Follow the instructions [over here](https://github.com/neovim/neovim/wiki/Installing-Neovim)

### Install Vim Plug
Install `vim-plug` using the instructions [over here](https://github.com/junegunn/vim-plug#neovim)

### Configuring `nvim`

* Copy the `nvim/init.vim` to `~/.config/nvim/` directory (if present, else create it).
* Open `nvim` and run `:PlugInstall` to install all the plugins
* Install the following **coc-plugins** using
```vim
:CocInstall coc-json coc-tssserver coc-graphql coc-eslint coc-prettier coc-python
```

### Adding `nvm`

Using [nvm.fish](https://github.com/jorgebucaran/nvm.fish).

Copy `conf.d/nvm.fish`, `functions/nvm.fish` and `completions/nvm.fish` to
their respective directories after install `nvm`.

## Tmux

### Install `tmux`

Install `tmux` for you OS using the instructions [over
here](https://github.com/tmux/tmux/wiki/Installing)

### Configuring `tmux`

Copy the `.tmux.conf` file to your home directory using
```sh
cp .tmux.conf $HOME
```

## Mac OS

* To enable press and hold use `defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false`
