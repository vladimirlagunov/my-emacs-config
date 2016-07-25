
;;; Code:

(deftheme airline-lagunov
  "based on hybridline theme")

(let ((normal-outer-foreground  "#ffffff") (normal-outer-background  "#282a2e")
      (normal-inner-foreground  "#c5c8c6") (normal-inner-background  "#373b41")
      (normal-center-foreground "#282a2e") (normal-center-background "#c5c8c6")

      (insert-outer-foreground  "#ffffff") (insert-outer-background  "#005f87")
      (insert-inner-foreground  "#c5c8c6") (insert-inner-background  "#0087af")
      (insert-center-foreground "#005f5f") (insert-center-background "#8abeb7")

      (visual-outer-foreground  "#ffffff") (visual-outer-background  "#282a2e")
      (visual-inner-foreground  "#c5c8c6") (visual-inner-background  "#373b41")
      (visual-center-foreground "#000000") (visual-center-background "#de935f")

      (replace-outer-foreground "#000000") (replace-outer-background "#cc6666")
      (emacs-outer-foreground   "#d7d7ff") (emacs-outer-background   "#5f00af")

      (inactive1-foreground "#1c1c1c") (inactive1-background "#d8d8d8")
      (inactive2-foreground "#262626") (inactive2-background "#d0d0d0"))

  (airline-themes-set-deftheme 'airline-lagunov)

  (when airline-cursor-colors
    (progn
     (setq evil-emacs-state-cursor   emacs-outer-background)
     (setq evil-normal-state-cursor  normal-outer-background)
     (setq evil-insert-state-cursor  `(bar ,insert-outer-background))
     (setq evil-replace-state-cursor replace-outer-background)
     (setq evil-visual-state-cursor  visual-outer-background)))
)

(airline-themes-set-modeline)

(defun -my-airline-themes-set-eshell-prompt ()
  "Set the eshell prompt"

  (setq eshell-highlight-prompt t
        eshell-prompt-regexp "^ [^#$]* [#$] "
        eshell-prompt-function
        (lambda ()
          (concat
           (propertize (concat " " (eshell/whoami) " ") 'face
                       `(:foreground ,(face-foreground 'airline-insert-outer) :background ,(face-background 'airline-insert-outer)))

           (propertize (concat (char-to-string airline-utf-glyph-separator-left) " ") 'face
                       `(:foreground ,(face-background 'airline-insert-outer) :background ,(face-background 'airline-insert-inner)))


           (if (eq airline-display-directory 'airline-directory-shortened)
             (propertize (concat (airline-shorten-directory (eshell/pwd) airline-shortened-directory-length) " ") 'face
                         `(:foreground ,(face-foreground 'airline-insert-inner) :background ,(face-background 'airline-insert-inner)))
             (propertize (concat (abbreviate-file-name (eshell/pwd)) " ") 'face
                         `(:foreground ,(face-foreground 'airline-insert-inner) :background ,(face-background 'airline-insert-inner)))
           )

           (propertize (concat (char-to-string airline-utf-glyph-separator-left)) 'face
                       `(:foreground ,(face-background 'airline-insert-inner)))

           (propertize " $ " 'face `())
           ))))


(defun -my-airline-themes-set-modeline ()
  "Set the airline mode-line-format"
  (interactive)
  (setq-default
   mode-line-format
   '("%e"
     (:eval
      (let* ((active (powerline-selected-window-active))
             (separator-left (intern (format "powerline-%s-%s"
                                             (powerline-current-separator)
                                             (car powerline-default-separator-dir))))
             (separator-right (intern (format "powerline-%s-%s"
                                              (powerline-current-separator)
                                              (cdr powerline-default-separator-dir))))
             (mode-line-face (if active 'mode-line 'mode-line-inactive))
             (visual-block (if (featurep 'evil)
                               (and (evil-visual-state-p)
                                    (eq evil-visual-selection 'block))
                             nil))
             (visual-line (if (featurep 'evil)
                              (and (evil-visual-state-p)
                                   (eq evil-visual-selection 'line))
                            nil))
             (current-evil-state-string (if (featurep 'evil)
                                            (upcase (concat (symbol-name evil-state)
                                                            (cond (visual-block "-BLOCK")
                                                                  (visual-line "-LINE"))))
                                          nil))

             (outer-face
              (if (powerline-selected-window-active)
                  (if (featurep 'evil)
                      (cond ((eq evil-state (intern "normal"))  'airline-normal-outer)
                            ((eq evil-state (intern "insert"))  'airline-insert-outer)
                            ((eq evil-state (intern "visual"))  'airline-visual-outer)
                            ((eq evil-state (intern "replace")) 'airline-replace-outer)
                            ((eq evil-state (intern "emacs"))   'airline-emacs-outer)
                            (t                                  'airline-normal-outer))
                    'airline-normal-outer)
                'powerline-inactive1))

             (inner-face
              (if (powerline-selected-window-active)
                  (if (featurep 'evil)
                      (cond ((eq evil-state (intern "normal")) 'airline-normal-inner)
                            ((eq evil-state (intern "insert")) 'airline-insert-inner)
                            ((eq evil-state (intern "visual")) 'airline-visual-inner)
                            (t                                 'airline-normal-inner))
                    'airline-normal-inner)
                'powerline-inactive2))

             (center-face
              (if (powerline-selected-window-active)
                  (if (featurep 'evil)
                      (cond ((eq evil-state (intern "normal")) 'airline-normal-center)
                            ((eq evil-state (intern "insert")) 'airline-insert-center)
                            ((eq evil-state (intern "visual")) 'airline-visual-center)
                            (t                                 'airline-normal-center))
                    'airline-normal-center)
                'powerline-inactive2))

             ;; Left Hand Side
             (lhs-mode (if (featurep 'evil)
                           (list
                            ;; Evil Mode Name
                            (powerline-raw (concat " " current-evil-state-string " ") outer-face)
                            (funcall separator-left outer-face inner-face)

                            ;; Modified string
                            (powerline-raw "%*" inner-face 'l)
                            )
                         (list
                          ;; Mule Info
                          (when powerline-display-mule-info
                            (powerline-raw mode-line-mule-info outer-face 'l))

                          ;; Modified string
                          (powerline-raw "%*" outer-face 'l)
                          ;; Separator >
                          (powerline-raw " " outer-face)
                          (funcall separator-left outer-face inner-face))))

             (lhs-rest (list
                        ;; ;; Separator >
                        ;; (powerline-raw (char-to-string #x2b81) inner-face 'l)

                        ;; Eyebrowse current tab/window config
                        (if (featurep 'eyebrowse)
                            (powerline-raw (concat " " (eyebrowse-mode-line-indicator)) inner-face))

                        ;; LN character, Current Line and % location in file
                        (powerline-raw
                         (concat
                          (char-to-string airline-utf-glyph-linenumber)
                          "%l:%c")
                         inner-face 'l)

                        ;; % location in file
                        (powerline-raw " %p" inner-face 'r)

                        ;; Buffer Size
                        (when powerline-display-buffer-size
                          (powerline-buffer-size inner-face 'l))

                        ;; Separator >
                        (powerline-raw " " inner-face)
                        (funcall separator-left inner-face center-face)

                        ;; Directory
                        (when (eq airline-display-directory 'airline-directory-shortened)
                          (powerline-raw (airline-shorten-directory default-directory airline-shortened-directory-length) center-face 'l))
                        (when (eq airline-display-directory 'airline-directory-full)
                          (powerline-raw default-directory center-face 'l))
                        (when (eq airline-display-directory nil)
                          (powerline-raw " " center-face))

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
             (rhs (list (powerline-raw global-mode-string center-face 'r)

                        ;; Separator <
                        (powerline-raw " " center-face)
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

                        ;; Git Branch
                        (powerline-raw (airline-get-vc) outer-face)

                        (powerline-raw " " outer-face)
                        )
                  ))

        ;; Combine Left and Right Hand Sides
        (concat (powerline-render lhs)
                (powerline-fill center-face (powerline-width rhs))
                (powerline-render rhs))))))
  (powerline-reset)
  (kill-local-variable 'mode-line-format))

(when airline-eshell-colors
  (-my-airline-themes-set-eshell-prompt))
(-my-airline-themes-set-modeline)

(provide-theme 'airline-lagunov)
;;; airline-lagunov-theme.el ends here
