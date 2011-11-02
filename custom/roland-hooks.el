;; General coding hooks

(defvar coding-hook nil
  "Hook that gets run on activation of any programming mode.")

(defun run-coding-hook ()
  "Enable things that are convenient across all coding buffers."
  (run-hooks 'coding-hook))

(defun local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(defun add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\|NOTE\\):"
          1 font-lock-warning-face t))))

(add-hook 'coding-hook 'local-column-number-mode)
(add-hook 'coding-hook 'local-comment-auto-fill)
(add-hook 'coding-hook 'pretty-lambdas)
(add-hook 'coding-hook 'add-watchwords)

;; Espresso mode hooks

(autoload 'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))
(add-hook 'espresso-mode-hook 'moz-minor-mode)
(add-hook 'espresso-mode-hook 'run-coding-hook)
(setq espresso-indent-level 2)

;; TODO figure out why this does odd things
(eval-after-load 'espresso
  '(progn ;; fixes problem with pretty function font-lock
          (define-key espresso-mode-map (kbd ",") 'self-insert-command)
          (font-lock-add-keywords
           'espresso-mode `(("\\(function *\\)("
                             (0 (progn (compose-region (match-beginning 1)
                                                       (match-end 1) "ƒ")
                                       nil)))))))


;; Ruby/Feature mode hooks

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . html-mode))

(add-hook 'ruby-mode-hook 'run-coding-hook)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

;; Diffs/Magit coloring

(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

;; Haskell mode

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; Other

(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))

(require 'mustache-mode)
(add-to-list 'auto-mode-alist '("\\.mustache$" . mustache-mode))

(provide 'roland-hooks)
