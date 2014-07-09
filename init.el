(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-use-menu-map t)
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(auto-save-interval 60)
 '(browse-url-browser-function (quote browse-url-firefox))
 '(browse-url-generic-program "chromium-browser")
 '(bubbles-game-theme (quote difficult))
 '(bubbles-graphics-theme (quote emacs))
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d8460b6d700cbde6c5d2621790aee617f917fbe958f11a66a1bc885e3d706e40" "1177fe4645eb8db34ee151ce45518e47cc4595c3e72c55dc07df03ab353ad132" "e57e7b19da7b4cd0e5512d5e9bc20d31c9cf50112c462de15a76bce0ea3c5ef5" "7a2c92b6267b84ae28a396f24dd832e29a164c1942f1f8b3fe500f1c25f8e09d" "b2d24e5bdf57ccae593d73e44b7bb4e03aa2ba7be595694f64a66b8e8d233952" "246a51f19b632c27d7071877ea99805d4f8131b0ff7acb8a607d4fd1c101e163" "446c73cdfb49f1dab4c322e51ac00a536fb0e3cb7e6809b9f4616e0858012e92" "9b6130d4d7896da7ae73652ec541a648fac70353ad3808bde69a91d5db0fedd9" "fe0a47cc3952fede574527a1c28ddf3a1af381fc1fb5843ca60d22e4c841011a" "fa189fcf5074d4964f0a53f58d17c7e360bb8f879bd968ec4a56dc36b0013d29" default)))
 '(desktop-save t)
 '(desktop-save-mode t)
 '(electric-indent-mode nil)
 '(electric-pair-mode t)
 '(electric-pair-open-newline-between-pairs nil)
 '(frame-brackground-mode (quote dark))
 '(fringe-mode 10 nil (fringe))
 '(global-auto-complete-mode t)
 '(global-auto-highlight-symbol-mode t)
 '(global-highlight-changes-mode nil)
 '(global-hl-line-mode t)
 '(global-hl-line-sticky-flag t)
 '(global-linum-mode f)
 '(global-rainbow-delimiters-mode t)
 '(global-semantic-decoration-mode nil)
 '(global-semantic-highlight-func-mode nil)
 '(global-semantic-idle-breadcrumbs-mode nil nil (semantic/idle))
 '(global-semantic-idle-local-symbol-highlight-mode nil nil (semantic/idle))
 '(global-semantic-idle-scheduler-mode nil)
 '(global-semantic-stickyfunc-mode nil)
 '(global-semanticdb-minor-mode nil)
 '(grep-command "zgrep -nH -e ")
 '(grep-find-command (quote ("find . -type f -exec zgrep -nH -e  {} +" . 34)))
 '(gud-tooltip-mode t)
 '(haml-indent-offset 4)
 '(highlight-symbol-colors
   (quote
    ("yellow" "DeepPink" "cyan" "MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" "RoyalBlue1" "OliveDrab" "lime green" "gold3" "MediumOrchid1" "OliveDrab1")))
 '(indent-tabs-mode nil)
 '(jabber-account-list (quote (("werehuman@jabber.ru" (:connection-type . ssl)))))
 '(jabber-alert-info-message-hooks
   (quote
    (jabber-info-echo jabber-info-display jabber-info-notify-send)))
 '(jabber-auto-reconnect t)
 '(jabber-autoaway-method (quote jabber-xprintidle-get-idle-time))
 '(jabber-autoaway-priority 0)
 '(jabber-autoaway-verbose nil)
 '(jabber-chat-fill-long-lines nil)
 '(jabber-history-enabled t)
 '(jabber-muc-autojoin nil)
 '(jabber-muc-completion-delimiter ", ")
 '(jabber-post-connect-hooks
   (quote
    (jabber-send-current-presence jabber-muc-autojoin jabber-whitespace-ping-start jabber-vcard-avatars-find-current jabber-autoaway-start)))
 '(jabber-xprintidle-program nil)
 '(linum-format " %6d ")
 '(ls-lisp-format-time-list (quote ("%F %X " "%F %X ")))
 '(ls-lisp-use-insert-directory-program nil)
 '(ls-lisp-use-localized-time-format t)
 '(ls-lisp-verbosity (quote (links)))
 '(main-line-color1 "#222912")
 '(main-line-color2 "#09150F")
 '(make-backup-files nil)
 '(makefile-backslash-column 48)
 '(makefile-mode-hook (quote (whitespace-mode)))
 '(midnight-mode t nil (midnight))
 '(nxml-slash-auto-complete-flag t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(powerline-color1 "#222912")
 '(powerline-color2 "#09150F")
 '(py-indent-offset 4 t)
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#800000"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#00801f"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#3f0080"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#806300"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#007e80"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#800063"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#3e8000"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#001d80"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#808080"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "black"))))
 '(reb-re-syntax (quote string))
 '(rng-nxml-auto-validate-flag nil)
 '(ropemacs-guess-project t)
 '(scroll-bar-mode nil)
 '(semantic-mode nil)
 '(server-host nil)
 '(server-mode t)
 '(server-use-tcp nil)
 '(show-paren-mode t)
 '(show-trailing-whitespace nil)
 '(size-indication-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify))
 '(which-function-mode t)
 '(whitespace-line-column 9999))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-guide-face ((t (:foreground "MediumOrchid1"))) t)
 '(term ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))) t))

(setq config-my-path (file-name-directory load-file-name))
(defun get-config-path (path) (concat config-my-path path))

(add-to-list 'load-path (get-config-path "lisp"))
(add-to-list 'load-path (get-config-path "3rdparty"))

(require 'package)
(package-initialize)

(require 'config_my_fundamental)
(require 'config_my_python)
(require 'config_my_javascript)
(require 'config_my_xml)
;; (require 'config_my_html)  ;; lost :(
(require 'config_my_shell)
(require 'config_my_jabber)
(require 'config_my_usability)

(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)
