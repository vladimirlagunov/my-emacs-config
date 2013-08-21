(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-interval 60)
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-generic-program "chromium-browser")
 '(bubbles-game-theme (quote difficult))
 '(bubbles-graphics-theme (quote emacs))
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(electric-pair-mode t)
 '(flymake-log-level 1)
 '(global-linum-mode f)
 '(global-semantic-decoration-mode t)
 '(global-semantic-highlight-func-mode t)
 '(global-semantic-idle-breadcrumbs-mode t nil (semantic/idle))
 '(global-semantic-idle-local-symbol-highlight-mode t nil (semantic/idle))
 '(global-semantic-stickyfunc-mode t)
 '(gud-tooltip-mode t)
 '(haml-indent-offset 4)
 '(jabber-account-list (quote (("werehuman@jabber.ru" (:connection-type . ssl)))))
 '(jabber-alert-info-message-hooks (quote (jabber-info-echo jabber-info-display jabber-info-notify-send)))
 '(jabber-chat-fill-long-lines nil)
 '(jabber-history-enabled t)
 '(ls-lisp-format-time-list (quote ("%F %X " "%F %X ")))
 '(ls-lisp-use-insert-directory-program nil)
 '(ls-lisp-use-localized-time-format t)
 '(ls-lisp-verbosity (quote (links)))
 '(make-backup-files nil)
 '(nxml-slash-auto-complete-flag t)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(py-indent-offset 4 t)
 '(rng-nxml-auto-validate-flag nil)
 '(ropemacs-guess-project t)
 '(scroll-bar-mode nil)
 '(semantic-mode t)
 '(server-host nil)
 '(server-mode t)
 '(server-use-tcp nil)
 '(show-paren-mode t)
 '(show-trailing-whitespace nil)
 '(size-indication-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify))
 '(which-function-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal))))
 '(highlight-indentation-current-column-face ((t (:inherit fringe :background "DarkOliveGreen1"))))
 '(highlight-indentation-face ((t (:inherit fringe :background "gray96"))))
 '(term ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(setq config-my-path (file-name-directory load-file-name))
(defun get-config-path (path) (concat config-my-path path))

(add-to-list 'load-path config-my-path)
(add-to-list 'load-path (get-config-path "3rdparty"))

(require 'config_my_python)
(require 'config_my_javascript)
(require 'config_my_xml)
(require 'config_my_shell)
(require 'config_my_jabber)
(require 'config_my_usability)

(message "\n\nDONE")
