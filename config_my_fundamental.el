(require 'multiple-cursors)
(require 'expand-region)


;;; Multiline Mode
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;;; Семантическое выделение
(global-set-key (kbd "C-=") 'er/expand-region)


(provide 'config_my_fundamental)
