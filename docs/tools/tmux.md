---
layout: default
title: tmux
parent: Tools
date: 2020-04-29
---

# Tmux

## Shortcuts

- [tmux cheat sheet](https://gist.github.com/andreyvit/2921703)

session:

	tmux new-session -s work
    tmux attach -t work
    tmux attach

Detach from a session: `C-b d`.
Rename session: `C-b $`.


Switch between sessions:

	C-b (          previous session
	C-b )          next session
	C-b L          ‘last’ (previously used) session
	C-b s          choose a session from a list

window:

    C-b c          create a new window
    C-b 1 ...      switch to window 1, ..., 9, 0
    C-b p          previous window
    C-b n          next window

Pane:

    C-b "          split vertically (top/bottom)
    C-b %          split horizontally (left/right)

Switching between panes:

    C-b left       go to the next pane on the left
    C-b right      (or one of these other directions)
    C-b up
    C-b down
    C-b o          go to the next pane (cycle through all of them)
    C-b ;          go to the ‘last’ (previously used) pane

Resizing panes:

    C-b M-up, C-b M-down, C-b M-left, C-b M-right
                   resize by 5 rows/columns
    C-b C-up, C-b C-down, C-b C-left, C-b C-right
                   resize by 1 row/column

## Session save

- [Restore tmux session after reboot](https://superuser.com/a/615716)
  - `tmux-session save`, `tmux-session restore`

## Start shell with tmux

- [Start with tmux](https://unix.stackexchange.com/a/306165)
