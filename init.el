(set-background-color "black")
(set-foreground-color "#eeeeee")

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(require 'cl)         ; Common Lisp Extensions? Provides mapc for example
(require 'uniquify)   ; Makes duplicate buffer names use filepaths instead of <1>,<2> etc.
(require 'saveplace)  ; Remember where you were in a file
(require 'ansi-color) ; translates ANSI color escape sequences
