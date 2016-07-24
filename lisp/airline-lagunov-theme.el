
;;; Code:

(deftheme airline-lagunov
  "based on hybridline theme")

(let ((normal-outer-foreground  "#282a2e") (normal-outer-background  "#c5c8c6")
      (normal-inner-foreground  "#c5c8c6") (normal-inner-background  "#373b41")
      (normal-center-foreground "#ffffff") (normal-center-background "#282a2e")

      (insert-outer-foreground  "#005f5f") (insert-outer-background  "#8abeb7")
      (insert-inner-foreground  "#c5c8c6") (insert-inner-background  "#0087af")
      (insert-center-foreground "#ffffff") (insert-center-background "#005f87")

      (visual-outer-foreground  "#000000") (visual-outer-background  "#de935f")
      (visual-inner-foreground  "#c5c8c6") (visual-inner-background  "#373b41")
      (visual-center-foreground "#ffffff") (visual-center-background "#282a2e")

      (replace-outer-foreground "#000000") (replace-outer-background "#cc6666")
      (emacs-outer-foreground   "#d7d7ff") (emacs-outer-background   "#5f00af")

      (inactive1-foreground "#d8d8d8") (inactive1-background "#1c1c1c")
      (inactive2-foreground "#d0d0d0") (inactive2-background "#262626"))

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

(provide-theme 'airline-lagunov)
;;; airline-lagunov-theme.el ends here
