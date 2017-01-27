;;; -*- eval: (rainbow-mode t) -*-
;;; https://emacsfodder.github.io/emacs-theme-editor/ + напильник

(require 'use-package)
;;; (use-package kurecolor)  ;; https://github.com/emacsfodder/kurecolor



(deftheme mytheme2017 "DOCSTRING for mytheme2017")
(custom-theme-set-faces
 'mytheme2017
 '(default ((t (:foreground "#000000" :background "#ffffff" ))))
 '(cursor ((t (:background "#000000" ))))
 '(fringe ((t (:background "#f4f4f4" ))))
 '(region ((t (:background "#a3d1fd" ))))
 '(secondary-selection ((t (:background "#e3e3e3" ))))
 '(font-lock-builtin-face ((t (:foreground "#a31bd3" ))))
 '(font-lock-comment-face ((t (:foreground "#0b8000" ))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-function-name-face ((t (:foreground "#674b22" ))))
 '(font-lock-keyword-face ((t (:foreground "#0e25ff" ))))
 '(font-lock-string-face ((t (:foreground "#941517" ))))
 '(font-lock-type-face ((t (:foreground "#267f99" ))))
 '(font-lock-constant-face ((t (:foreground "#a31bd3" ))))
 '(font-lock-variable-name-face ((t (:foreground "#464D18" ))))
 '(minibuffer-prompt ((t (:foreground "#000000" :bold t ))))
 '(dired-directory ((t (:inherit font-lock-keyword-face))))
 '(minibuffer-prompt ((t (:foreground "#ffffff" :background "#0097ff"))))
 )
;; (custom-theme-set-faces
;;  'mytheme2017
;;  '(default ((t (:foreground "#000000" :background "#ffffff" ))))
;;  '(cursor ((t (:background "#000000" ))))
;;  '(fringe ((t (:background "#f4f4f4" ))))
;;  '(mode-line ((t (:foreground "#000000" :background "#d0d0d0" ))))
;;  '(region ((t (:background "#ffdcb5" ))))
;;  '(secondary-selection ((t (:background "#e3e3e3" ))))
;;  '(font-lock-builtin-face ((t (:foreground "#300098" ))))
;;  '(font-lock-comment-face ((t (:foreground "#71788e" ))))
;;  '(font-lock-function-name-face ((t (:foreground "#d46700" ))))
;;  '(font-lock-keyword-face ((t (:foreground "#009DAD" ))))
;;  '(font-lock-string-face ((t (:foreground "#7A7400" ))))
;;  '(font-lock-type-face ((t (:foreground "#71009d" ))))
;;  '(font-lock-constant-face ((t (:foreground "#65009f" ))))
;;  '(font-lock-variable-name-face ((t (:foreground "#AD6900" ))))
;;  '(minibuffer-prompt ((t (:foreground "#000000" :bold t )))))


(use-package airline-themes)
(let ((normal-outer-foreground  "#ffffff") (normal-outer-background  "#0D61B5")
      (normal-inner-foreground  "#ffffff") (normal-inner-background  "#007acc")
      (normal-center-foreground "#ffffff") (normal-center-background "#0097FF")

      (inactive1-foreground  "#d0d0d0") (inactive1-background  "#0B539B")
      (inactive2-foreground  "#d0d0d0") (inactive2-background  "#0B539B")
      (inactive3-foreground "#d0d0d0") (inactive3-background "#0B539B")

      ;; wtf? похоже, используется только в eshell и evil
      (insert-outer-foreground  "#ffffff") (insert-outer-background  "#225dab")
      (insert-inner-foreground  "#ffffff") (insert-inner-background  "#008894")
      (insert-center-foreground "#000000") (insert-center-background "#d3f7a3")

      ;; используется только в evil, но нельзя не указать
      (visual-outer-foreground  "#ffffff") (visual-outer-background  "#484a4e")
      (visual-inner-foreground  "#c5c8c6") (visual-inner-background  "#373b41")
      (visual-center-foreground "#000000") (visual-center-background "#de935f")
      (replace-outer-foreground "#000000") (replace-outer-background "#cc6666")
      (replace-inner-foreground "#00ff00") (replace-inner-background "#0000ff")
      (replace-center-foreground "#aaff00") (replace-center-background "#cc00ff")
      (emacs-outer-foreground   "#d7d7ff") (emacs-outer-background   "#5f00af")
      (emacs-inner-foreground "#00ffaa") (emacs-inner-background "#00aaff")
      (emacs-center-foreground "#aaffaa") (emacs-center-background "#ccaaff"))

  (airline-themes-set-deftheme 'mytheme2017)

  (custom-theme-set-faces
   'mytheme2017
   `(mode-line ((t (:foreground ,normal-outer-foreground :background ,normal-outer-background :box nil :underline nil :overline nil))))
   `(minibuffer-prompt ((t (:font-weight bold :inherit default))))))


;;;###autoload
;; (and load-file-name
;;     (boundp 'custom-theme-load-path)
;;     (add-to-list 'custom-theme-load-path
;;                  (file-name-as-directory
;;                   (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'mytheme2017)
(provide 'mytheme2017) ;; TODO: неправильно
