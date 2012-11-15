;; Custom keybindings go here

(global-set-key (kbd "C-x C-g") 'magit-status)
(global-set-key (kbd "C-x p")   'other-window-backward)
(global-set-key [(meta return)] 'toggle-fullscreen)
(global-set-key (kbd "C-x x x") 'setup-roland-workspace)
(global-set-key (kbd "C-,") 'yas-expand)

(provide 'roland-keybindings)

