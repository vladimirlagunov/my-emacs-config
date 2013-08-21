(require 'multi-web-mode)
(require 'config_my_fundamental)


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

(defun xml-create-new-tag ()
  (interactive)
  (let ((word (get-and-delete-current-word))
		(snippet "<word$2>\n\t$0\n</word>"))
	(yas/expand-snippet (replace-regexp-in-string "word" word snippet))))

(add-hook
 'nxml-mode-hook
 (lambda ()
   (local-set-key (kbd "C-c C-n") 'nxml-create-new-tag)
   (local-set-key (kbd "C-c e") 'mc/mark-sgml-tag-pair)))


(provide 'config_my_xml)
