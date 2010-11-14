;;;; Configuration tweaks ;;;;

(setq font-lock-maximum-decoration t
      inhibit-startup-message t
      save-place-file (concat dotfiles-dir "places"))

;; Turn off frame decorations
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Colours
(set-background-color "black")
(set-foreground-color "#eeeeee")

;; Character encoding stuff
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; IDO
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 10
      ido-auto-merge-work-directories-length -1
      ido-case-fold t)

;; CSS Mode
(setq cssm-indent-level 2)

;; Transparently open compressed files
(auto-compression-mode t)

;; Save a list of recent files visited
(recentf-mode 1)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; Browser
(setq browse-url-browser-function 'browse-default-macosx-browser)
; (setq browse-url-browser-function 'browse-url-firefox)

;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

;; Mac-specific configuration

(when (eq system-type 'darwin)
  ;; Work around a bug on OS X where system-name is FQDN
  (setq system-name (car (split-string system-name "\\.")))

  ;; We're using emacs instead of a window manager
  (turn-on-follow-mouse)

  ;; Work around a bug where environment variables aren't set correctly
  (require 'osx-plist)
  (when (file-exists-p "~/.MacOSX/environment.plist")
    (osx-plist-update-environment))
  )


(provide 'roland-configuration)