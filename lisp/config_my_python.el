(require 'python)
(require 'pymacs)

(require 'config_my_flycheck)
(require 'config_my_autocomplete)
(require 'indent-guide)


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
(add-hook 'python-mode-hook 'ropemacs-mode)


;; DAFUK
(add-hook 'comint-output-filter-functions
		  'python-pdbtrack-comint-output-filter-function)


;;; Линия для текущего блока
(add-hook 'python-mode 'indent-guide-mode)


;;; Преобразовать `a=1,\nb=2` в `"a": 1,\n"b": 2`
(add-hook 'python-mode
		  (lambda ()
			(fset 'kwargs-to-dict
				  [?\C-\M-% ?^ ?  backspace ?\\ ?\( ?  ?\\ ?\) ?* backspace backspace backspace ?* ?\\ ?\) ?\[ ?^ ?= left left left ?\\ ?\( end ?\\ ?\) left left ?+ end ?  ?* ?= ?  ?* ?\\ ?\( ?. ?* ?\\ ?\) left left ?? end ?\\ ?\( ?, ?? ?\\ ?\} backspace ?\) ?$ return ?\\ ?1 ?\" ?\\ ?2 end ?: ?\S-  ?\\ ?3 ?\\ ?4 return ?!])
			))


(provide 'config_my_python)
