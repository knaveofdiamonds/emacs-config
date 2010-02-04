;; My Emacs config. Much of this is stolen from http://github.com/technomancy/emacs-starter-kit
;; but I wanted to build up my own version to understand everything.

;; Basic Visual Changes

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(set-background-color "black")
(set-foreground-color "#eeeeee")

;; Load Paths

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(add-to-list 'load-path (concat dotfiles-dir "/custom"))

;; Library requires

(require 'cl)         ; Common Lisp Extensions? Provides mapc for example
(require 'uniquify)   ; Makes duplicate buffer names use filepaths instead of <1>,<2> etc.
(require 'saveplace)  ; Remember where you were in a file
(require 'ansi-color) ; translates ANSI color escape sequences
(require 'package)    ; ELPA packaging system

(package-initialize)

;; System-specific configuration

(setq system-specific-config (concat dotfiles-dir system-name ".el"))
(if (file-exists-p system-specific-config) (load system-specific-config))