(require 'yasnippet)


(yas/initialize)
(yas/load-directory (get-config-path "snippets"))
(global-set-key (kbd "C-<tab>") 'yas/expand)


(provide 'config_my_yasnippet)
