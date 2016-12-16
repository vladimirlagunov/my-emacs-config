(use-package powerline)
(use-package airline-themes)
(use-package dim)

;; (powerline-center-theme)

;; (require 'airline-badwolf-theme)
;; (require 'airline-base16-gui-dark-theme)
;; (require 'airline-base16-shell-dark-theme)
;; (require 'airline-behelit-theme)
;; (require 'airline-dark-theme)
;; (require 'airline-distinguished-theme)
;; (require 'airline-durant-theme)
;; (require 'airline-hybridline-theme)
;; (require 'airline-kalisi-theme)
;; (require 'airline-kolor-theme)
;; (require 'airline-light-theme)
;; (require 'airline-luna-theme)
;; (require 'airline-molokai-theme)
;; (require 'airline-murmur-theme)
;; (require 'airline-papercolor-theme)
;; (require 'airline-powerlineish-theme)
;; (require 'airline-raven-theme)
;; (require 'airline-serene-theme)
;; (require 'airline-silver-theme)
;; (require 'airline-simple-theme)
;; (require 'airline-solarized-alternate-gui-theme)
;; (require 'airline-solarized-gui-theme)
;; (require 'airline-sol-theme)
;; (require 'airline-ubaryd-theme)
;; (require 'airline-understated-theme)
;; (require 'airline-wombat-theme)


;; Тормозной airline по умолчанию дёргает `git symbolic-ref --short
;; HEAD` на каждое изменение буфера.
(defvar -airline-get-vc--cache
  (make-hash-table :weakness 'key)
  "buffer -> (result . cached-until)")

(defcustom -airline-get-vc--timeout 3.0 "foobar" :type 'float)

(defun -airline-get-vc--around (old-fn &rest args)
  (let* ((time (current-time))
         (unixtime (+ (lsh (car time) 16) (cadr time)))
         (cache-key (current-buffer))
         (cache-cell (gethash cache-key -airline-get-vc--cache))
         (result (car cache-cell))
         (cached-until (cdr cache-cell)))
    (when (or (null cached-until) (< cached-until unixtime))
      (setq result (apply old-fn args))
      (puthash cache-key (cons result (+ unixtime -airline-get-vc--timeout))
               -airline-get-vc--cache))
    result))
(advice-add 'airline-get-vc :around '-airline-get-vc--around)


(require 'airline-lagunov-theme)

(defun my-flycheck-mode-line-status-text (&optional status)
  (let ((param-tuple
         (pcase (or status flycheck-last-status-change)
           (`not-checked '("" . nil))
           (`no-checker '("-" . nil))
           (`running '("⌛" . nil))
           (`errored '("!" . 'compilation-error-face))
           (`finished
            (let-alist (flycheck-count-errors flycheck-current-errors)
              (cond
               ((not (null .error)) '("☹" . 'compilation-mode-line-fail))
               ((not (null .warning)) '("☹" . 'warning))
               (t '("☺" . 'compilation-mode-line-exit))))))))
    (let ((text (car param-tuple)) (face (cdr param-tuple)))
      (when (not (null face))
        (put-text-property 0 (length text)'face face text))
      text)))

(dim-minor-names
 '((projectile-mode (:eval
                     (if (file-remote-p default-directory)
                         ""
                       (format " ⊆%s" (projectile-project-name)))))
   (auto-revert-mode "")
   (flycheck-mode (:eval (my-flycheck-mode-line-status-text)))
   (helm-mode " ♚")
   (company-mode " C")
   (ggtags-mode " G")
   (helm-gtags-mode "")
   (abbrev-mode " D")
   (ropemacs-mode "➿")
   (sphinx-doc-mode "")
   (smerge-mode "⟗")
   (auto-highlight-symbol-mode "")))


(provide 'config_my_powerline)
