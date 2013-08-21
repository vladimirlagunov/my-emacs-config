(require 'python)
(require 'pymacs)
(require 'highlight-indentation)

(require 'config_my_flymake)
(require 'config_my_autocomplete)


;;; включить flymake в python
(add-hook 'python-mode-hook (lambda () (flymake-mode)))


;;; pyflakes через flymake
(defun flymake-pylint-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
					 'flymake-create-temp-inplace))
		 (local-file (file-relative-name
					  temp-file
					  (file-name-directory buffer-file-name))))
	(list (get-config-path "bin/pyflymake.py") (list local-file))))
(add-to-list 'flymake-allowed-file-name-masks
			 '("\\.py\\'" flymake-pylint-init))


;;; По умолчанию - отступ в 4 пробела
(add-hook 'python-mode-hook
		  '(lambda () (set-variable 'py-indent-offset 4)))
;;; Если в файле есть табы - переключить на табы вместо пробелов
(add-hook 'python-mode-hook
		  (lambda ()
			(when (string-match "^\t" (buffer-string)) 
			  (setq indent-tabs-mode t))))



;;; Интерпретатор
(add-to-list 'interpreter-mode-alist '("python" . python-mode))


;;; Pymacs
(pymacs-load "ropemacs" "rope-")
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)


;;; Подсветка блоков
(add-hook 'python-mode-hook
		  (lambda ()
			(highlight-indentation-mode)
			(highlight-indentation-current-column-mode)))


;; DAFUK
(add-hook 'comint-output-filter-functions
		  'python-pdbtrack-comint-output-filter-function)



(provide 'config_my_python)
