---
layout: default
title: OS - Ubuntu
parent: Tools
date: 2020-04-13
---

## Ubuntu

.desktop file

- `~/.local/share/applications`
- `/usr/share/applications`

install deb

- `sudo dpkg -i filename.deb`

## Unsplash

- [How To Set Random Wallpapers From Unsplash.com For Ubuntu](http://youness.net/linux/set-random-wallpapers-unsplash-com-ubuntu)

```bash
wget -O /tmp/wallpaper.jpg https://unsplash.it/1920/1080/?nature
gsettings set org.gnome.desktop.background picture-uri file:///tmp/wallpaper.jpg
```

## Settings

- 프린터 자동 설치 중단 : [How do I disable automatic remote printer installation?](https://askubuntu.com/a/369122)

## Zsh

- [How to Install ZSH Shell on Ubuntu 18.04 LTS](https://linuxhint.com/install_zsh_shell_ubuntu_1804/)

## redis-cli

connect : `redis-cli -p 6379`
all key : `keys *`
