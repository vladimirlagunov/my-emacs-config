(require 'use-package)

(require 'python)
(use-package pymacs)
(use-package sphinx-doc)
(use-package cython-mode)

(require 'config_my_flycheck)
(require 'config_my_company)


;;; По умолчанию - отступ в 4 пробела
(add-hook 'python-mode-hook
		  '(lambda () (set-variable 'py-indent-offset 4)))
;;; Если в файле есть табы - переключить на табы вместо пробелов
(add-hook 'python-mode-hook
		  (lambda ()
			(when (string-match "^\t" (buffer-string))
			  (setq indent-tabs-mode t))))

(add-hook 'python-mode-hook
  (lambda()
    (add-hook 'write-contents-functions
      (lambda()
        (save-excursion
          (delete-trailing-whitespace))))))

(add-hook 'python-mode-hook (lambda () (ggtags-mode 1)))


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


;;; Докстринги
;;; https://github.com/naiquevin/sphinx-doc.el
(add-hook 'python-mode-hook (lambda () (sphinx-doc-mode t)))


;;; Документация по C-h S
(info-lookup-add-help
 :mode 'python-mode
 :regexp "[[:alnum:]_]+"
 :doc-spec
 '(("(python)Index" nil "")))

;;; Преобразовать `a=1,\nb=2` в `"a": 1,\n"b": 2`
(add-hook 'python-mode
		  (lambda ()
			(fset 'kwargs-to-dict
				  [?\C-\M-% ?^ ?  backspace ?\\ ?\( ?  ?\\ ?\) ?* backspace backspace backspace ?* ?\\ ?\) ?\[ ?^ ?= left left left ?\\ ?\( end ?\\ ?\) left left ?+ end ?  ?* ?= ?  ?* ?\\ ?\( ?. ?* ?\\ ?\) left left ?? end ?\\ ?\( ?, ?? ?\\ ?\} backspace ?\) ?$ return ?\\ ?1 ?\" ?\\ ?2 end ?: ?\S-  ?\\ ?3 ?\\ ?4 return ?!])
			))


(defun flycheck-pylint-ignore-messages ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (let* ((current-line (1+ (count-lines 1 (point))))
           (error-messages (mapcar (lambda (err) (when (eq current-line (flycheck-error-line err))
                                                (flycheck-error-id err)))
                                   flycheck-current-errors)))
      (end-of-line)
      (insert "  # pylint: disable="
              (string-join (remove nil (remove-duplicates (sort error-messages 'string<)))
                           ",")))))

(add-hook 'python-mode-hook
		  (lambda ()
			(local-set-key (kbd "C-c ! -") #'flycheck-pylint-ignore-messages)))


;;; which-function-mode глючит в cython
(add-hook 'cython-mode-hook (lambda () (which-function-mode -1)))
(add-hook 'cython-mode-hook (lambda () (ggtags-mode 1)))


;;; В .dir-locals.el устанавливается переменная вида
;;; (my-python-version . "2.7")
(defun python-version-hook-fn ()
  (when (eq major-mode 'python-mode)
    (let* ((python-version (if (boundp 'my-python-version) my-python-version "2.7"))
           (python-command (concat "python" python-version)))
      (progn
        (make-local-variable 'jedi:environment-root)
        (setq jedi:environment-root python-command)
        (make-local-variable 'python-environment-virtualenv)
        (setq python-environment-virtualenv
              (list "virtualenv" "--no-site-packages" "--quiet"
                    "--python" python-command)))))) 

(add-hook 'hack-local-variables-hook 'python-version-hook-fn)


(use-package company-jedi)

(use-package python-switch-quotes)
(define-key python-mode-map (kbd "C-c '") 'python-switch-quotes)

(provide 'config_my_python)
