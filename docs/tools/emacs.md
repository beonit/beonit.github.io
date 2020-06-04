---
layout: default
title: Emacs
parent: Tools
date: 2020-02-19
---

Best editor in the world.

## 유용한 함수

- 덮어쓰기 모드 : `overwrite-mode`
- line-wrap 방지 : `toggle-truncate-lines`

## Hotkey

- [window configuration register](https://www.gnu.org/software/emacs/manual/html_node/emacs/Configuration-Registers.html#Configuration-Registers)
  - save register : `C-x r w`
  - load register : `C-x r j`
- mode manual : `C-c h ?`

## find-grep-dired

## replace-regexp

- 문자열 전체를 매치 : `(replace-regexp "\\(.*\\)" "function-name \\1")`
- 마지막 `.` 이후의 문자열을 분리 : `(replace-regexp "\\(.*\\)\\.\\([a-zA-Z]+\\)" "\\1 \\2")`
- Kotlin vo to spock test : `(replace-regexp "\\(val\\|var\\) \\(.*\\):.*" "vo1.\\2 == vo2.\\2")`
- 두개 그룹의 순서 바꾸기 : `(replace-regexp "\\(.*\\)\t\\(.*\\)" "\\2\t\\1")`

## .emacs

```elisp
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-startup-message t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)
(transient-mark-mode t)
(show-paren-mode t)
(setq backup-directory-alist `(("." . "~/backup")))
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("84890723510d225c45aaff941a7e201606a48b973f0121cb9bcb0b9399be8cba" default)))
 '(package-selected-packages
   (quote
    (markdown-mode markdown-preview-mode zenburn-theme helm org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'helm-config)

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-,") 'helm-buffers-list)
(global-set-key (kbd "C-.") 'next-multiframe-window)
(custom-set-variables
 '(default-input-method "korean-hangul"))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(helm-mode 1)

(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(add-to-list 'default-frame-alist '(font . "Monaco-10"))

(load-theme 'zenburn t)

;; /usr/share/applications/emacs.desktop
;; Exec=env XMODIFIERS= emacs %F

(add-to-list 'default-frame-alist '(font . "Monaco-10"))
(set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))
```
