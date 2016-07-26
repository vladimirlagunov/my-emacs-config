(require 'use-package)
(use-package yasnippet)

(setq yas/root-directory (get-config-path "snippets"))
(yas/load-directory (get-config-path "snippets"))
(global-set-key (kbd "C-<tab>") 'yas/expand)


(mapc
 (lambda (mode-hook)
   (add-hook mode-hook (lambda () (yas-activate-extra-mode 'fundamental-mode))))
 (list 'debian-control-mode-hook))

(mapc
 (lambda (mode-hook)
   (add-hook mode-hook (lambda () (yas/minor-mode t))))
 '(prog-mode-hook debian-control-mode-hook))
