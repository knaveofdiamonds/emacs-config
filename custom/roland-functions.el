(defun toggle-fullscreen ()
  (interactive)
  (if (eq system-type 'darwin)
      (ns-toggle-fullscreen)
    (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
					     nil
                                           'fullboth))))

(defun setup-roland-workspace ()
  "Sets up a standard workspace"
  (interactive)
  (if (one-window-p)
      (progn
	(split-window-horizontally (/ (* 2 (window-width)) 3))
	(split-window-horizontally)
	(other-window 2)
	(split-window-vertically)
	(other-window 2))
    ()))

(defun search-and-replace (from to str)
  (if (string-match from str)
      (replace-match to nil nil str)
    str))

(defun ruby-class-name-from-spec-file-name ()
  "Returns a properly modularized class name from a file name in a spec directory"
  (search-and-replace
   "_" ""
   (capitalize
    (search-and-replace 
     "_spec$" ""
     (search-and-replace "/" "::"
			 (search-and-replace (concat (rspec-spec-directory (buffer-file-name)) "/") "" (file-name-sans-extension (or (buffer-file-name) 
																     (buffer-name (current-buffer))))))))))
  

(defun other-window-backward (&optional n)
  "Select Nth previous window."
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))

;; Scrolling undo, from Writing Gnu Emacs Extensions
(defvar unscroll-point nil
  "Text position for next call to unscroll.")
(defvar unscroll-window-start nil)

(put 'scroll-up 'unscrollable t)
(put 'scroll-down 'unscrollable t)

(defadvice scroll-up (before remember-for-unscroll activate compile)
  (unscroll-maybe-remember))

(defadvice scroll-down (before remember-for-unscroll activate compile)
  (unscroll-maybe-remember))

(defun unscroll-maybe-remember ()
  (if (not (get last-command 'unscrollable))
      (progn
	(setq unscroll-point (point))
	(setq unscroll-window-start (window-start)))))

(defun unscroll ()
  "Jump to the location specified by 'unscroll-to'"
  (interactive)
  (goto-char unscroll-point)
  (set-window-start nil unscroll-window-start))
    



(provide 'roland-functions)