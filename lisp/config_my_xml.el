(require 'use-package)

(require 'config_my_fundamental)
(use-package multi-web-mode)

(setq zencoding-mode-keymap (make-sparse-keymap))
(define-key zencoding-mode-keymap (kbd "<C-return>") 'zencoding-expand-line)
(use-package zencoding-mode)


;; Multi-web-mode
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags
	  '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
		(js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
		(css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)


;;; Создать тег и сделать отступы
(defun get-and-delete-current-word ()
  (left-word 1)
  (let ((beg (point)))
	(right-word 1)
	(let ((word (buffer-substring beg (point))))
	  (backward-kill-word 1)
	  word)))

(add-hook
 'sgml-mode-hook
 (lambda ()
   (local-set-key (kbd "C-c e") 'mc/mark-sgml-tag-pair)))


;;; Zen coding
(add-hook 'sgml-mode-hook 'zencoding-mode)


(provide 'config_my_xml)
