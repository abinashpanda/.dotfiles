# Kmonad

This is the Kmonad config for my 60% keyboard which doesn't have the proper navigation key binding.

Follow the steps below to run `kmonad` on startup without `sudo`

1. First, create a udev rule to allow your user to access uinput without sudo. Create this file: `/etc/udev/rules.d/99-kmonad.rules`

```
ACTION=="add", KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
```

2. Create the uinput group and add your user to it

```
sudo groupadd uinput
sudo usermod -aG input,uinput $USER
```

3. Create the systemd user service file. Create this file: `~/.config/systemd/user/kmonad.service`.

```
[Unit]
Description=KMonad Keyboard Configuration
Documentation=https://github.com/kmonad/kmonad

[Service]
Environment=PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin
Type=simple
ExecStart=/usr/local/bin/kmonad %h/.config/kmonad/config.kbd
Restart=always
RestartSec=2

[Install]
WantedBy=default.target
```

4. Create a symlink for the default config to `~/.config/kmonad/config.kbd`.

5. Reload udev rules

```
sudo udevadm control --reload-rules
sudo udevadm trigger
```

6. Enable and start the service

```
systemctl --user daemon-reload
systemctl --user enable kmonad
systemctl --user start kmonad
```

7. Check service status

```
systemctl --user status kmonad
journalctl --user -u kmonad
```
