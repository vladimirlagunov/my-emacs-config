(require 'use-package)
(use-package projectile)


(projectile-global-mode t)
(setq projectile-keymap-prefix (kbd "C-c p"))
(defun --projectile-set-keymap ()
  (local-set-key projectile-keymap-prefix 'projectile-command-map))
(add-hook 'projectile-mode-hook #'--projectile-set-keymap)


(provide 'config_my_projectile)
