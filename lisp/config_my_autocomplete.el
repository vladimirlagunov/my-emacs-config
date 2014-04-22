(require 'auto-complete)
(require 'auto-complete-yasnippet)

(require 'config_my_yasnippet)

(global-auto-complete-mode t)

;;; Показывать меню начиная с третьего символа
(setq ac-auto-start 3)

;;; Do what i mean
(setq ac-dwim t)

(set-default
 'ac-sources
 '(ac-source-abbrev
   ac-source-words-in-buffer
   ac-source-symbols))



(provide 'config_my_autocomplete)
