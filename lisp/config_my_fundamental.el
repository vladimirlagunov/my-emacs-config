(require 'multiple-cursors)
(require 'expand-region)


;;; Multiline Mode
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;;; Семантическое выделение
(global-set-key (kbd "C-=") 'er/expand-region)


;;; Увеличить число под курсором на 1
(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(global-set-key (kbd "C-c +") 'increment-number-at-point)


;;; Для документации по C-h S. Нужно ставить конфиги для отдельных языков.
(require 'info-look)

(provide 'config_my_fundamental)


(defalias 'perl-mode 'cperl-mode)
