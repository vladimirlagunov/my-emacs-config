(require 'use-package)
(use-package multiple-cursors)
(use-package expand-region)
(use-package yafolding)
(use-package dtrt-indent)


;;; Multiline Mode
(global-set-key (kbd "C-x r C->") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-x C->") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-x C-<") 'mc/skip-to-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)


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


;;; https://www.bunkus.org/blog/2009/12/switching-identifier-naming-style-between-camel-case-and-c-style-in-emacs/
(defun toggle-camel-case-at-point ()
  "Toggles the symbol at point between C-style naming,
e.g. `hello_world_string', and camel case,
e.g. `HelloWorldString'."
  (interactive)
  (let* ((symbol-pos (bounds-of-thing-at-point 'symbol))
         case-fold-search symbol-at-point cstyle regexp func)
    (unless symbol-pos
      (error "No symbol at point"))
    (save-excursion
      (narrow-to-region (car symbol-pos) (cdr symbol-pos))
      (setq cstyle (string-match-p "^_*[^_]+_.*$" (buffer-string))
            regexp (if cstyle "\\(?:\\_<\\|_\\)\\(\\w\\)" "\\([A-Z]\\)")
            func (if cstyle
                     'capitalize
                   (lambda (s)
                     (concat (if (= (match-beginning 1)
                                    (car symbol-pos))
                                 ""
                               "_")
                             (downcase s)))))
      (goto-char (point-min))
      (while (re-search-forward regexp nil t)
        (replace-match (funcall func (match-string 1))
                       t nil))
      (widen))))
(global-set-key (kbd "C-x _") 'toggle-camel-case-at-point)


;;; Сворачивание кода https://github.com/zenozeng/yafolding.el
(add-hook 'prog-mode-hook (lambda () (yafolding-mode t)))
(add-hook 'yaml-mode-hook (lambda () (yafolding-mode t)))


;;; Для документации по C-h S. Нужно ставить конфиги для отдельных языков.
(require 'info-look)

(provide 'config_my_fundamental)
