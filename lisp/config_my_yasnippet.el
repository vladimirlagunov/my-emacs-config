(require 'yasnippet)


(yas-global-mode 1)
(setq yas/root-directory (get-config-path "snippets"))
(yas/load-directory (get-config-path "snippets"))
(global-set-key (kbd "C-<tab>") 'yas/expand)


(mapc
 (lambda (mode-hook)
   (add-hook mode-hook (lambda () (yas-activate-extra-mode 'fundamental-mode))))
 (list 'debian-control-mode-hook))


(provide 'config_my_yasnippet)
