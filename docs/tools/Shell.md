---
layout: default
title: Shell
parent: Tools
date: 2020-04-13
---

## aliases

```bash
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ld='ls -ld .*/'
```

## User config

```bash
git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

export EDITOR="emacs -nw"

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[00;33m\]$(git_branch)\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# ls
alias ll='ls -alF'
alias la='ls -lA'
alias l='ls -CF'

# cd
alias c='cd ..'
alias files='find . -type f'

source ~/util/shell_utils/bash_dir.sh

# find grep
alias fn='find . -name '
alias fg='find . -type f -print0 | xargs -0 -e grep -nH -e '
alias files='find . -type f'
alias find-grep='find . -type f -print0 | xargs -0 -e grep -nH -e '
alias find-hgrep='find . -type f -print0 | xargs -0 -e grep -h -e '
alias find-ngrep='find . -type f -print0 | xargs -0 -e grep -h -e '
alias find-igrep='find . -type f -print0 | xargs -0 -e grep -nH -i -e '
alias find-xgrep='find . -name *.xml -type f -print0 | xargs -0 -e grep -nH -e '
alias find-mgrep='find . -name *.mk -type f -print0 | xargs -0 -e grep -nH -e '
alias find-jgrep='find . -name *.java -type f -print0 | xargs -0 -e grep -nH -e '
alias find-cgrep='find . -name *.[ch] -type f -print0 | xargs -0 -e grep -nH -e '
alias find-rgrep='find . -name *.rc -type f -print0 | xargs -0 -e grep -nH -e '
alias find-dir='find . -type d -name '

alias ec='emacsclient -nw '

alias epoch="date +'%s'"
function epochconvert() { date -d $@; }

```
