;;;; Configuration tweaks ;;;;

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
      ido-use-filename-at-point 'guess
      ido-max-prospects 10)

;; Transparently open compressed files
(auto-compression-mode t)

;; Save a list of recent files visited and places in files
(recentf-mode 1)
(setq save-place-file (concat dotfiles-dir "places"))

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; Browser
(setq browse-url-browser-function 'browse-default-macosx-browser)
; (setq browse-url-browser-function 'browse-url-firefox)

;; Mac-specific configuration

(when (string= system-type "darwin")
  (turn-on-follow-mouse))
