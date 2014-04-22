(require 'yasnippet)


(yas--initialize)
(setq yas/root-directory (get-config-path "snippets"))
(yas/load-directory (get-config-path "snippets"))
(global-set-key (kbd "C-<tab>") 'yas/expand)


(provide 'config_my_yasnippet)
