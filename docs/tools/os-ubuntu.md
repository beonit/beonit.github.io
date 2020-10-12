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

## Install DEV tools

tools : `sudo apt install git openssh-server tmux net-tools samba maven emacs26`
python : `sudo apt install python3.8 python-is-python3 python3-pip`
java : `sudo apt install openjdk-8-jdk openjdk-11-jdk openjdk-14-jdk`
java alternatives : `sudo update-alternatives --config java`
synergy : download & install synergy, `sudo apt install libqt5gui5`

## Unsplash

- [How To Set Random Wallpapers From Unsplash.com For Ubuntu](http://youness.net/linux/set-random-wallpapers-unsplash-com-ubuntu)

```bash
wget -O /tmp/wallpaper.jpg https://unsplash.it/1920/1080/?nature
gsettings set org.gnome.desktop.background picture-uri file:///tmp/wallpaper.jpg
```

## Settings

- 프린터 자동 설치 중단 : [How do I disable automatic remote printer installation?](https://askubuntu.com/a/369122)
- Capslock to ctrl : `sudo apt install gnome-tweaks`

## Zsh

- [How to Install ZSH Shell on Ubuntu 18.04 LTS](https://linuxhint.com/install_zsh_shell_ubuntu_1804/)

## redis-cli

connect : `redis-cli -p 6379`
all key : `keys *`


## samba

- [install samba on ubuntu 20 04](https://websiteforstudents.com/install-samba-on-ubuntu-20-04-18-04/)

## Docker

- [How To Install and Use Docker on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)