;; My Emacs config. Much of this is stolen from http://github.com/technomancy/emacs-starter-kit
;; but I wanted to build up my own version to understand everything.

;; Load Paths

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(add-to-list 'load-path (concat dotfiles-dir "/custom"))

;; Library requires

(require 'cl)           ; Common Lisp Extensions? Provides mapc for example
(require 'uniquify)     ; Makes duplicate buffer names use filepaths instead of <1>,<2> etc.
(require 'saveplace)    ; Remember where you were in a file
(require 'ansi-color)   ; translates ANSI color escape sequences
(require 'package)      ; ELPA packaging system
(require 'follow-mouse) ; Allows mouse-to-focus on windows
(package-initialize)

;; Config

(require 'roland-hooks)
(require 'roland-configuration)
(require 'roland-keybindings)

;; System-specific configuration

(setq system-specific-config (concat dotfiles-dir system-name ".el"))
(if (file-exists-p system-specific-config) (load system-specific-config))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(espresso-indent-level 2)
 '(magit-git-executable "/opt/local/bin/git"))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
