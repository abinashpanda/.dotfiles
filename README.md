.dotfiles
=========

This repository consists of configuration files for :

* ```vim``` : ```.vimrc```
* ```tmux``` : ```.tmux.conf```

Along with it also contains ```.vim-airline.conf```, the configuration file
used to source in ```.tmux.conf``` for
[tmuxline](https://github.com/edkolev/tmuxline.vim).

### Note

For proper running of tmux and vim use ```tmux -u -2```.

### Mac OS

* To enable press and hold use `defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false`


### Adding `nvm`

Using [nvm.fish](https://github.com/jorgebucaran/nvm.fish).

Copy `conf.d/nvm.fish`, `functions/nvm.fish` and `completions/nvm.fish` to
their respective directories after install `nvm`.
