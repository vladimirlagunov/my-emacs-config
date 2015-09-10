;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-use-menu-map t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(auto-save-default nil)
 '(auto-save-interval 60)
 '(browse-url-browser-function (quote browse-url-default-browser))
 '(browse-url-generic-program "chromium-browser")
 '(bubbles-game-theme (quote difficult))
 '(bubbles-graphics-theme (quote emacs))
 '(c-default-style
   (quote
    ((c-mode . "java")
     (c++-mode . "java")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(clean-buffer-list-delay-general 2)
 '(column-number-mode t)
 '(comint-prompt-read-only nil)
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d8460b6d700cbde6c5d2621790aee617f917fbe958f11a66a1bc885e3d706e40" "1177fe4645eb8db34ee151ce45518e47cc4595c3e72c55dc07df03ab353ad132" "e57e7b19da7b4cd0e5512d5e9bc20d31c9cf50112c462de15a76bce0ea3c5ef5" "7a2c92b6267b84ae28a396f24dd832e29a164c1942f1f8b3fe500f1c25f8e09d" "b2d24e5bdf57ccae593d73e44b7bb4e03aa2ba7be595694f64a66b8e8d233952" "246a51f19b632c27d7071877ea99805d4f8131b0ff7acb8a607d4fd1c101e163" "446c73cdfb49f1dab4c322e51ac00a536fb0e3cb7e6809b9f4616e0858012e92" "9b6130d4d7896da7ae73652ec541a648fac70353ad3808bde69a91d5db0fedd9" "fe0a47cc3952fede574527a1c28ddf3a1af381fc1fb5843ca60d22e4c841011a" "fa189fcf5074d4964f0a53f58d17c7e360bb8f879bd968ec4a56dc36b0013d29" default)))
 '(debian-changelog-full-name "Lagunov Vladimir")
 '(debian-changelog-mailing-address "lagunov@yandex-team.ru")
 '(desktop-save t)
 '(desktop-save-mode t)
 '(dired-dwim-target t)
 '(display-buffer-alist
   (quote
    (("" display-buffer-reuse-window
      (reusable-frames . visible)))))
 '(ediff-autostore-merges t)
 '(ediff-keep-variants nil)
 '(ediff-make-buffers-readonly-at-startup nil)
 '(ediff-no-emacs-help-in-control-buffer t)
 '(ediff-show-clashes-only nil)
 '(ediff-split-window-function (quote split-window-vertically))
 '(ediff-use-long-help-message nil)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(electric-indent-mode nil)
 '(electric-pair-mode t)
 '(electric-pair-open-newline-between-pairs nil)
 '(flycheck-checker-error-threshold 2000)
 '(flycheck-flake8-maximum-line-length 100)
 '(flycheck-gcc-language-standard "gnu++13")
 '(flycheck-highlighting-mode (quote lines))
 '(flycheck-pylintrc nil)
 '(flycheck-python-pylint-executable nil)
 '(frame-brackground-mode (quote dark))
 '(fringe-mode 10 nil (fringe))
 '(global-auto-complete-mode t)
 '(global-auto-highlight-symbol-mode t)
 '(global-highlight-changes-mode nil)
 '(global-hl-line-mode t)
 '(global-hl-line-sticky-flag t)
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
 '(jedi:complete-on-dot nil)
 '(linum-format " %6d ")
 '(ls-lisp-format-time-list (quote ("%F %X " "%F %X ")))
 '(ls-lisp-use-insert-directory-program nil)
 '(ls-lisp-use-localized-time-format t)
 '(ls-lisp-verbosity (quote (links)))
 '(magit-repo-dirs-depth 6)
 '(main-line-color1 "#222912")
 '(main-line-color2 "#09150F")
 '(make-backup-files nil)
 '(makefile-backslash-column 48)
 '(makefile-mode-hook (quote (whitespace-mode)))
 '(midnight-mode t nil (midnight))
 '(minimap-dedicated-window t)
 '(minimap-mode t)
 '(minimap-recreate-window nil)
 '(minimap-window-location (quote right))
 '(mode-line-format
   (quote
    ("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position
     (vc-mode vc-mode)
     "  " mode-line-modes mode-line-misc-info mode-line-end-spaces)))
 '(nxml-slash-auto-complete-flag t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(package-selected-packages
   (quote
    (ggtags smart-mode-line-powerline-theme smart-mode-line sphinx-doc jedi auto-complete spacemacs-theme sublimity ein browse-kill-ring+ cmake-mode ecb zencoding-mode yasnippet thrift rust-mode multiple-cursors markdown-mode magit jabber indent-guide highlight-symbol graphviz-dot-mode go-mode flymake-rust flycheck f expand-region epc dockerfile-mode cython-mode clippy auto-highlight-symbol)))
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
 '(rcirc-server-alist
   (quote
    (("bowie.yandex.ru" :nick "lagunov" :port 6667 :channels
      ("#security")))))
 '(reb-re-syntax (quote string))
 '(rng-nxml-auto-validate-flag nil)
 '(ropemacs-guess-project t)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(scroll-bar-mode nil)
 '(semantic-mode nil)
 '(server-host nil)
 '(server-mode t)
 '(server-use-tcp nil)
 '(show-paren-mode t)
 '(show-trailing-whitespace nil)
 '(size-indication-mode nil)
 '(sml/theme (quote powerline))
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify))
 '(vc-annotate-background nil)
 '(which-function-mode t)
 '(whitespace-line-column 9999)
 '(yas-snippet-dirs (quote ("~/.emacs.d/snippets")) nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "Input Mono"))))
 '(Info-quoted ((t (:weight ultra-light))))
 '(border ((t nil)))
 '(indent-guide-face ((t (:foreground "MediumOrchid1"))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(powerline-active1 ((t (:inherit sml/global))))
 '(powerline-active2 ((t (:inherit sml/global))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive))))
 '(powerline-inactive2 ((t (:inherit mode-line-inactive))))
 '(sml/client ((t (:inherit sml/prefix :background "grey"))))
 '(sml/col-number ((t (:inherit sml/global :background "grey"))))
 '(sml/discharging ((t (:inherit sml/global :background "grey" :foreground "black"))))
 '(sml/filename ((t (:inherit sml/global :background "grey" :foreground "black"))))
 '(sml/global ((t (:inherit ## :background "gray80" :foreground "black" :inverse-video nil :box (:line-width 1 :color "grey" :style released-button)))))
 '(sml/modes ((t (:inherit sml/filename :weight normal))))
 '(sml/prefix ((t (:inherit sml/global :background "grey" :foreground "black"))))
 '(term ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(vc-state-base-face ((t nil))))

(setq config-my-path (file-name-directory load-file-name))
(defun get-config-path (path) (concat config-my-path path))

(add-to-list 'load-path (get-config-path "lisp"))
(add-to-list 'load-path (get-config-path "3rdparty"))

(require 'config_my_fundamental)
(require 'config_my_python)
(require 'config_my_c)
(require 'config_my_javascript)
(require 'config_my_xml)
;; (require 'config_my_html)  ;; lost :(
(require 'config_my_shell)
(require 'config_my_debian)
(require 'config_my_usability)
;; (require 'config_my_cedet)

(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
