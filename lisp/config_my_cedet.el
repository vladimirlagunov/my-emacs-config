(require 'use-package)
(require 'semantic/bovine/c)
(require 'semantic/bovine/gcc)
(require 'cedet)
(require 'cedet-files)
(use-package company)

(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)

(semantic-mode 1)

(defun my/cedet-hook ()
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cd" 'semantic-ia-show-doc))


;;; C-c j - перейти к описанию, M-, - вернуться обратно.
;;; См. /usr/share/emacs/25.0.50/lisp/cedet/semantic/ia.el.gz
;; (require 'etags)
;; (defun push-tag-mark () 
;;   (xref-push-marker-stack))
;; (defun pop-tag-mark () 
;;   (xref-pop-marker-stack))

(add-hook 'c-mode-hook 'my/cedet-hook)
(add-hook 'c++-mode-hook 'my/cedet-hook)


(provide 'config_my_cedet)
