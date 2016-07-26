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

(load-file "airline-theme.el")

(when (require 'dim)
  (dim-minor-names
   '((auto-revert-mode "")
     (flycheck-mode "")
     (helm-mode " ♚")
     (company-mode " C")
     (ggtags-mode " G")
     (helm-gtags-mode "")
     (abbrev-mode " D")
     (ropemacs-mode "➿")
     (sphinx-doc-mode "")
     (auto-highlight-symbol-mode "⛭"))))