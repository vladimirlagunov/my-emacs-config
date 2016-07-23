(require 'use-package)
(use-package company)
(require 'config_my_yasnippet)


;;; https://www.emacswiki.org/emacs/CompanyMode#toc10
(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))


(defun tab-indent-or-complete-autoload ()
  (when (and (not (null (assoc 'company-mode minor-mode-alist)))
             (not (null (assoc 'company-mode minor-mode-alist))))
    (local-set-key [tab] 'tab-indent-or-complete)))

;; (add-hook 'company-mode-hook 'tab-indent-or-complete-autoload)
;; (add-hook 'yas-minor-mode-hook 'tab-indent-or-complete-autoload)


(add-hook 'prog-mode-hook (lambda () (company-mode t)))


(provide 'config_my_company)
