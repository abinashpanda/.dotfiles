# Kmonad

Install `kmonad` using `yay` as follow

```sh
yay -S kmonad
```

This is the Kmonad config for my 60% keyboard which doesn't have the proper navigation key binding.

1. Create the systemd user service file. Create this file: `/etc/systemd/system/kmonad.service`.

```
[Unit]
Description=KMonad Keyboard Configuration
Documentation=https://github.com/kmonad/kmonad

[Service]
Environment=PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin
Type=simple
ExecStart=/usr/bin/kmonad /home/abinash/.config/kmonad/config.kbd
Restart=always
RestartSec=2
User=root

[Install]
WantedBy=default.target
```

2. Create a symlink for the default config to `~/.config/kmonad/config.kbd`.

3. Enable and start the service

```
sudo systemctl daemon-reload
sudo systemctl enable kmonad.service
sudo systemctl start kmonad.service
```

4. Check service status

```
sudo systemctl kmonad.service
sudo journalctl -u kmonad
```
