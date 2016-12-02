(require 'use-package)
(use-package company)
(use-package company-quickhelp)
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

(custom-set-variables
 '(company-backends
   '(company-nxml
     company-css
     company-semantic
     company-cmake
     company-capf
     company-files
     (company-c-headers
      company-irony
      company-jedi
      company-gtags
      company-etags
      company-keywords
      company-clang
      company-dabbrev-code)
     company-dabbrev))
 '(company-auto-complete nil)
 '(company-dabbrev-time-limit 0.3)
 '(company-idle-delay 0.25)
 '(company-irony-ignore-case t)
 '(company-minimum-prefix-length 2)
 '(company-quickhelp-max-lines 10)
 '(company-quickhelp-mode t)
 '(company-selection-wrap-around t)
 '(company-show-numbers t)
 '(company-tooltip-flip-when-above nil)
 '(company-tooltip-offset-display (quote lines)))


(add-hook 'prog-mode-hook (lambda () (company-mode t)))


(provide 'config_my_company)
