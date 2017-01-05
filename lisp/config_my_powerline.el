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


(setq-default
 mode-line-format
 '("%e"
   (:eval
    (let* ((active (powerline-selected-window-active))
           (width (window-total-width))
           (expance (< 100 width))
           (tight (> 70 width))
           (separator-left (intern (format "powerline-%s-%s"
                                           (powerline-current-separator)
                                           (car powerline-default-separator-dir))))
           (separator-right (intern (format "powerline-%s-%s"
                                            (powerline-current-separator)
                                            (cdr powerline-default-separator-dir))))
           (mode-line-face (if active 'mode-line 'mode-line-inactive))

           (outer-face
            (if (powerline-selected-window-active) 'airline-normal-outer 'powerline-inactive1))

           (inner-face
            (if (powerline-selected-window-active) 'airline-normal-inner 'powerline-inactive2))

           (center-face
            (if (powerline-selected-window-active) 'airline-normal-center 'powerline-inactive2))

           ;; Left Hand Side
           (lhs-mode
            (list
             ;; Mule Info
             (when powerline-display-mule-info
               (powerline-raw mode-line-mule-info outer-face 'l))

             ;; Modified string
             (powerline-raw "%*" outer-face 'l)
             ;; Separator >
             (when expance (powerline-raw " " outer-face))
             (funcall separator-left outer-face inner-face)))

           (lhs-rest (list
                      ;; ;; Separator >
                      ;; (powerline-raw (char-to-string #x2b81) inner-face 'l)

                      ;; Eyebrowse current tab/window config
                      (if (featurep 'eyebrowse)
                          (powerline-raw (concat " " (eyebrowse-mode-line-indicator)) inner-face))

                      ;; LN character, Current Line and % location in file
                      (powerline-raw
                       (concat
                        (if expance (char-to-string airline-utf-glyph-linenumber) "")
                        "%l:%c")
                       inner-face 'l)

                      ;; % location in file
                      (when expance (powerline-raw "(%p)" inner-face 'r))

                      ;; Buffer Size
                      (when (and expance powerline-display-buffer-size)
                        (powerline-buffer-size inner-face 'l))

                      ;; Separator >
                      (when expance (powerline-raw " " inner-face))
                      (funcall separator-left inner-face center-face)
                      (when expance (powerline-raw " " center-face))

                      ;; Directory
                      ;; (when (eq airline-display-directory 'airline-directory-shortened)
                      ;;   (powerline-raw (airline-shorten-directory default-directory airline-shortened-directory-length) center-face 'l))
                      ;; (when (eq airline-display-directory 'airline-directory-full)
                      ;;   (powerline-raw default-directory center-face 'l))
                      ;; (when (eq airline-display-directory nil)
                      ;;   (powerline-raw " " center-face))

                      ;; Buffer ID
                      ;; (powerline-buffer-id center-face)
                      (powerline-raw "%b" center-face)

                      ;; Narrow if appropriate
                      (powerline-raw "%n" center-face)

                      ;; ;; Separator >
                      ;; (powerline-raw " " center-face)
                      ;; (funcall separator-left mode-line face1)

                      (when (boundp 'erc-modified-channels-object)
                        (powerline-raw erc-modified-channels-object center-face 'l))

                      ;; ;; Separator <
                      ;; (powerline-raw " " face1)
                      ;; (funcall separator-right face1 face2)
                      ))

           (lhs (append lhs-mode lhs-rest))

           ;; Right Hand Side
           (rhs (if tight
                    ;; Separator <
                    (list (powerline-raw "✂" center-face)
                          (funcall separator-right center-face outer-face))

                  (list (powerline-raw global-mode-string center-face 'r)

                        ;; Separator <
                        (when expance (powerline-raw " " center-face))
                        (funcall separator-right center-face inner-face)

                        ;; Major Mode
                        (powerline-major-mode inner-face 'l)
                        (powerline-process inner-face)

                        ;; Subseparator <
                        (powerline-raw (char-to-string airline-utf-glyph-subseparator-right) inner-face 'l)

                        ;; Minor Modes
                        (powerline-minor-modes inner-face 'l)
                        ;; (powerline-narrow center-face 'l)

                        (powerline-raw " " inner-face)

                        ;; Separator <
                        (funcall separator-right inner-face outer-face)

                        ;; Projectile
                        (when (not (file-remote-p default-directory))
                          (powerline-raw (concat "⊆" (projectile-project-name)) outer-face))

                        ;; Git Branch
                        (when expance (powerline-raw (airline-get-vc) outer-face))

                        (powerline-raw " " outer-face)
                        ))
                ))

      ;; Combine Left and Right Hand Sides
      (concat (powerline-render lhs)
              (powerline-fill center-face (powerline-width rhs))
              (powerline-render rhs))))))


(require 'mytheme2017)
;; (load-theme 'mytheme2017)
(powerline-reset)


(dim-minor-names
 '((projectile-mode "")
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
