---
layout: default
title: Ubuntu
parent: Tools
date: 2020-04-13
---

# Ubuntu

## .desktop file

- `~/.local/share/applications`
- `/usr/share/applications`


## Unsplash

- [How To Set Random Wallpapers From Unsplash.com For Ubuntu](http://youness.net/linux/set-random-wallpapers-unsplash-com-ubuntu)

```bash
wget -O /tmp/wallpaper.jpg https://unsplash.it/1920/1080/?nature
gsettings set org.gnome.desktop.background picture-uri file:///tmp/wallpaper.jpg
```
