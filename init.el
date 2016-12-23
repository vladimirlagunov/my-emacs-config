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
 '(ac-quick-help-prefer-pos-tip t)
 '(ac-use-menu-map t)
 '(ahs-modes
   (quote
    (actionscript-mode apache-mode arduino-mode bat-generic-mode c++-mode c-mode csharp-mode css-mode cython-mode dos-mode emacs-lisp-mode html-mode ini-generic-mode java-mode javascript-mode js-mode lisp-interaction-mode lua-mode latex-mode makefile-mode makefile-gmake-mode markdown-mode moccur-edit-mode nxml-mode nxhtml-mode outline-mode perl-mode cperl-mode php-mode python-mode rc-generic-mode reg-generic-mode ruby-mode sgml-mode sh-mode squirrel-mode text-mode tcl-mode visual-basic-mode)))
 '(ahs-plugin-bod-modes
   (quote
    (emacs-lisp-mode lisp-interaction-mode c++-mode c-mode python-mode)))
 '(airline-shortened-directory-length 20)
 '(airline-utf-glyph-branch 57504)
 '(airline-utf-glyph-linenumber 57505)
 '(airline-utf-glyph-readonly 57506)
 '(airline-utf-glyph-separator-left 57520)
 '(airline-utf-glyph-separator-right 57522)
 '(airline-utf-glyph-subseparator-left 57521)
 '(airline-utf-glyph-subseparator-right 57523)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(auto-save-default nil)
 '(auto-save-interval 60)
 '(aw-scope (quote visible))
 '(browse-url-browser-function (quote browse-url-default-browser))
 '(browse-url-generic-program "chromium-browser")
 '(bubbles-game-theme (quote difficult))
 '(bubbles-graphics-theme (quote emacs))
 '(c++-mode-hook (quote (my-c-common-hook er/add-cc-mode-expansions)))
 '(c-basic-offset 4)
 '(c-default-style
   (quote
    ((c-mode . "awk")
     (c++-mode . "awk")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(c-offsets-alist nil)
 '(clean-buffer-list-delay-general 2)
 '(column-number-mode t)
 '(comint-prompt-read-only nil)
 '(company-auto-complete nil)
 '(company-backends
   (quote
    (company-nxml company-css company-semantic company-cmake company-files
                  (company-c-headers company-irony company-jedi company-gtags company-etags company-keywords company-clang company-dabbrev-code)
                  company-dabbrev)))
 '(company-dabbrev-time-limit 0.3)
 '(company-idle-delay 0.25)
 '(company-irony-ignore-case t)
 '(company-minimum-prefix-length 2)
 '(company-quickhelp-max-lines 10)
 '(company-quickhelp-mode t)
 '(company-selection-wrap-around t)
 '(company-show-numbers t)
 '(company-tooltip-flip-when-above nil)
 '(company-tooltip-offset-display (quote lines))
 '(compilation-environment nil)
 '(compilation-skip-threshold 0)
 '(cperl-mode-hook
   (quote
    (er/add-cperl-mode-expansions
     (lambda nil
       (ggtags-mode t)))))
 '(custom-enabled-themes (quote (lagunov)))
 '(custom-safe-themes
   (quote
    ("4607b8a71ff8f794d1adf35636f85eb0ae4d4da291b2fbfc3f829b65bf295073" "6773871d8ac0f26c5e806a26b33fc707e839b2a6abe9e6453f223291d614195a" "a4fdc0d33a468ce84e9924d50dc3b21d51b146a28abc8435004ca7f1bcddc500" "02ecd97dc79929faee841ac675c0d76b688d55a7d976921aa940e49af8ade36e" "71c8efc7267bb8efcb164b19e51fab75f6b35fb53ec0bd94cbb6ee6e05c7ae65" "594cbbda994106be20c24610d4a9c42891ad2b4dd90b9a9a5aed6796090c3cf8" "5919994e53c5ff0a57386bef61959b6710a878354861ac7aa9ec759d47b2ec90" "aebe39cb30b405af1f405793057951f7671448bc0ba5e3e0fc5b9efedbf5947e" "786826e84c7ab3cda3e277d3f8c5cf046fd4d14b78fd20222019462ba6ab2ba4" "42ab811536f5ce97486d70934518866c0fe8eacfc3979fb23a09264cec8b170f" "b869a1353d39ab81b19eb79de40ff3e7bb6eaad705e61f7e4dbdcb183f08c5a6" "b5fe3893c8808466711c1b55bb7e66b9c6aa2a86811783375a43e1beabb1af33" "fbcdb6b7890d0ec1708fa21ab08eb0cc16a8b7611bb6517b722eba3891dfc9dd" "beeb5ac6b65fcccfe434071d4624ff0308b5968bf2f0c01b567d212bcaf66054" "e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" "26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d8460b6d700cbde6c5d2621790aee617f917fbe958f11a66a1bc885e3d706e40" "1177fe4645eb8db34ee151ce45518e47cc4595c3e72c55dc07df03ab353ad132" "e57e7b19da7b4cd0e5512d5e9bc20d31c9cf50112c462de15a76bce0ea3c5ef5" "7a2c92b6267b84ae28a396f24dd832e29a164c1942f1f8b3fe500f1c25f8e09d" "b2d24e5bdf57ccae593d73e44b7bb4e03aa2ba7be595694f64a66b8e8d233952" "246a51f19b632c27d7071877ea99805d4f8131b0ff7acb8a607d4fd1c101e163" "446c73cdfb49f1dab4c322e51ac00a536fb0e3cb7e6809b9f4616e0858012e92" "9b6130d4d7896da7ae73652ec541a648fac70353ad3808bde69a91d5db0fedd9" "fe0a47cc3952fede574527a1c28ddf3a1af381fc1fb5843ca60d22e4c841011a" "fa189fcf5074d4964f0a53f58d17c7e360bb8f879bd968ec4a56dc36b0013d29" default)))
 '(debian-changelog-full-name "Lagunov Vladimir")
 '(debian-changelog-mailing-address "lagunov@yandex-team.ru")
 '(desktop-save t)
 '(desktop-save-mode t)
 '(dired-dwim-target t)
 '(dired-recursive-copies (quote always))
 '(dired-recursive-deletes (quote always))
 '(display-buffer-alist
   (quote
    (("" display-buffer-reuse-window
      (reusable-frames . visible)))))
 '(doc-view-continuous t)
 '(dynamic-completion-mode t)
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
 '(enable-remote-dir-locals nil)
 '(engine-mode t)
 '(fill-nobreak-predicate
   (quote
    (fill-single-word-nobreak-p fill-single-char-nobreak-p)))
 '(flycheck-checker-error-threshold 2000)
 '(flycheck-checkers
   (quote
    (ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd emacs-lisp emacs-lisp-checkdoc erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert groovy haml handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy jade javascript-eslint javascript-jshint javascript-gjslint javascript-jscs javascript-standard json-jsonlint json-python-json less lua-luacheck lua perl-my perl-perlcritic php php-phpmd php-phpcs processing puppet-parser puppet-lint python-flake8 python-pylint python-pycompile r-lintr racket rpm-rpmlint markdown-mdl rst-sphinx rst ruby-rubocop ruby-rubylint ruby ruby-jruby rust-cargo rust sass scala scala-scalastyle scss-lint scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim sql-sqlint tex-chktex tex-lacheck texinfo typescript-tslint verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
 '(flycheck-clang-args (quote nil))
 '(flycheck-clang-pedantic t)
 '(flycheck-flake8-maximum-line-length 100)
 '(flycheck-gcc-language-standard "gnu++13")
 '(flycheck-highlighting-mode (quote lines))
 '(flycheck-idle-change-delay 1.0)
 '(flycheck-pylintrc nil)
 '(flycheck-python-pylint-executable nil)
 '(frame-brackground-mode (quote dark))
 '(fringe-mode 10 nil (fringe))
 '(ggtags-global-abbreviate-filename 60)
 '(ggtags-global-window-height 12)
 '(ggtags-process-environment nil)
 '(ggtags-sort-by-nearness t)
 '(gh-profile-alist
   (quote
    (("yandex-github" :url "https://api.github.yandex-team.ru" :remote-regexp "^\\(?:git@github\\.yandex\\-team\\.ru:\\|\\(?:git\\|https?\\|ssh\\)://.*@?github\\.yandex\\-team\\.ru/\\)\\([^/]+\\)/\\([^/]+\\)\\(?:\\.git\\)?")
     ("github" :url "https://api.github.com" :remote-regexp "^\\(?:git@github\\.com:\\|\\(?:git\\|https?\\|ssh\\)://.*@?github\\.com/\\)\\(.*\\)/\\(.*\\)\\(?:\\.git\\)?"))))
 '(gh-profile-default-profile "yandex-github")
 '(global-auto-highlight-symbol-mode t)
 '(global-company-mode nil)
 '(global-highlight-changes-mode nil)
 '(global-hl-line-mode t)
 '(global-hl-line-sticky-flag nil)
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
 '(grep-find-ignored-files
   (quote
    (".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "*.min.js" "*.min.css")))
 '(gud-tooltip-mode t)
 '(haml-indent-offset 4)
 '(helm-M-x-fuzzy-match t)
 '(helm-autoresize-min-height 5)
 '(helm-autoresize-mode t)
 '(helm-buffer-max-length 40)
 '(helm-buffers-end-truncated-string "…")
 '(helm-display-header-line t)
 '(helm-echo-input-in-header-line t)
 '(helm-external-programs-associations nil)
 '(helm-ff-file-compressed-list (quote ("gz" "bz2" "zip" "7z" "xz")))
 '(helm-ff-guess-ffap-filenames t)
 '(helm-full-frame nil)
 '(helm-gtags-auto-update t)
 '(helm-gtags-direct-helm-completing t)
 '(helm-gtags-prefix-key "nil")
 '(helm-mode t)
 '(helm-mode-fuzzy-match t)
 '(helm-raise-command "wmctrl -xa %s")
 '(highlight-symbol-colors
   (quote
    ("yellow" "DeepPink" "cyan" "MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" "RoyalBlue1" "OliveDrab" "lime green" "gold3" "MediumOrchid1" "OliveDrab1")))
 '(hl-line-sticky-flag nil)
 '(ido-default-buffer-method (quote selected-window))
 '(ido-default-file-method (quote selected-window))
 '(ido-enable-flex-matching t)
 '(indent-tabs-mode nil)
 '(irony-lighter "⚗")
 '(jedi:complete-on-dot t)
 '(jedi:tooltip-method (quote (popup)))
 '(line-move-visual t)
 '(linum-format " %6d ")
 '(ls-lisp-emulation nil)
 '(ls-lisp-format-time-list (quote ("%Y-%m-%d %H:%M:%S" "%Y-%m-%d %H:%M:%S")))
 '(ls-lisp-use-insert-directory-program nil)
 '(ls-lisp-use-localized-time-format t)
 '(ls-lisp-verbosity (quote (uid)))
 '(magit-blame-heading-format "%-20a %C   %s")
 '(magit-diff-arguments
   (quote
    ("--no-ext-diff" "--stat" "--diff-algorithm=histogram")))
 '(magit-diff-refine-hunk (quote all))
 '(magit-diff-section-arguments (quote ("--no-ext-diff")))
 '(magit-fetch-arguments (quote ("--prune")))
 '(magit-log-arguments (quote ("--graph" "--decorate" "-n256")))
 '(magit-repo-dirs-depth 6)
 '(main-line-color1 "#222912")
 '(main-line-color2 "#09150F")
 '(make-backup-files nil)
 '(makefile-backslash-column 48)
 '(makefile-mode-hook (quote (whitespace-mode)))
 '(menu-bar-mode nil)
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
    (list-unicode-display google-c-style arduino-mode company-arduino ace-window ace-mc ace-jump-buffer ggtags smart-mode-line-powerline-theme smart-mode-line sphinx-doc jedi spacemacs-theme sublimity ein browse-kill-ring+ cmake-mode ecb zencoding-mode yasnippet thrift rust-mode multiple-cursors markdown-mode magit indent-guide highlight-symbol graphviz-dot-mode go-mode flymake-rust flycheck f expand-region epc dockerfile-mode cython-mode clippy auto-highlight-symbol)))
 '(perl-indent-continued-arguments 4)
 '(perl-indent-parens-as-block t)
 '(powerline-color1 "#222912")
 '(powerline-color2 "#09150F")
 '(powerline-gui-use-vcs-glyph t)
 '(powerline-height nil)
 '(powerline-text-scale-factor nil)
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".ropeproject" ".stack-work")))
 '(projectile-keymap-prefix "")
 '(projectile-mode-line
   (quote
    (:eval
     (if
         (file-remote-p default-directory)
         " Projectile"
       (format " ⊆%s"
               (projectile-project-name))))))
 '(py-indent-offset 4 t)
 '(python-environment-default-root-name "python27")
 '(python-environment-virtualenv
   (quote
    ("virtualenv" "--system-site-packages" "--quiet" "--python" "python2.7")))
 '(python-fill-docstring-style (quote django))
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
 '(safe-local-variable-values
   (quote
    ((iasm-disasm-cmd . "xtensa-lx106-elf-objdump")
     (encoding . utf-8)
     (ggtags-libpath "/home/lagunov/src/my/esp8266/esp-open-sdk/ESP8266_RTOS_SDK/")
     (ggtags-libpath "/home/lagunov/src/opensource/esp-open-sdk")
     (ggtags-libpath "/home/lagunov/src/opensource/esp-open-sdk/ESP8266_NONOS_SDK_V2.0.0_16_08_10/" "/home/lagunov/src/my/esp8266/esp-open-sdk/ESP8266_RTOS_SDK/")
     (my-flycheck-perl-autoinclude t)
     (ggtags-libpath "/home/lagunov/src/my/esp8266/esp-open-sdk/ESP8266_RTOS_SDK/")
     (ggtags-libpath "/home/lagunov/src/opensource/esp-open-sdk")
     (ggtags-libpath "/home/lagunov/src/opensource/esp-open-sdk/ESP8266_NONOS_SDK_V2.0.0_16_08_10/" "/home/lagunov/src/my/esp8266/esp-open-sdk/ESP8266_RTOS_SDK/")
     (my-flycheck-perl-autoinclude t)
     (ggtags-libpath "/home/lagunov/src/my/esp8266/esp-open-sdk/ESP8266_RTOS_SDK/")
     (ggtags-libpath "/home/lagunov/src/opensource/esp-open-sdk")
     (ggtags-libpath "/home/lagunov/src/opensource/esp-open-sdk/ESP8266_NONOS_SDK_V2.0.0_16_08_10/" "/home/lagunov/src/my/esp8266/esp-open-sdk/ESP8266_RTOS_SDK/")
     (my-flycheck-perl-autoinclude t))))
 '(scroll-bar-mode nil)
 '(search-exit-option t)
 '(semantic-mode nil)
 '(sentence-end-double-space nil)
 '(server-host nil)
 '(server-mode t)
 '(server-use-tcp nil)
 '(show-paren-mode t)
 '(show-trailing-whitespace nil)
 '(sml/theme (quote powerline))
 '(sql-mysql-program "mysql")
 '(tab-width 4)
 '(tetris-buffer-width 30)
 '(tool-bar-mode nil)
 '(tramp-connection-properties nil)
 '(tramp-remote-path
   (quote
    (tramp-default-remote-path tramp-own-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin")))
 '(tramp-remote-process-environment
   (quote
    ("TMOUT=0" "LC_CTYPE=''" "TERM=dumb" "EMACS=t" "INSIDE_EMACS='24.5.1,tramp:2.2.11-24.5'" "CDPATH=" "HISTORY=" "MAIL=" "MAILCHECK=" "MAILPATH=" "PAGER=cat" "autocorrect=" "correct=")))
 '(tramp-ssh-controlmaster-options
   "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify))
 '(vc-annotate-background nil)
 '(warning-suppress-log-types (quote ((undo discard-info))))
 '(warning-suppress-types (quote ((\(undo\ discard-info\)))))
 '(wdired-allow-to-change-permissions t)
 '(wdired-keep-marker-rename t)
 '(wdired-use-dired-vertical-movement t)
 '(wdired-use-interactive-rename t)
 '(which-function-mode t)
 '(whitespace-line-column 9999)
 '(yas-snippet-dirs (quote ("~/.emacs.d/snippets" yas-installed-snippets-dir))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight semi-light :height 113 :width condensed :foundry "XFT" :family "Input Mono Narrow"))))
 '(Info-quoted ((t (:weight ultra-light))))
 '(ace-jump-face-foreground ((t (:background "black" :foreground "yellow" :underline nil))))
 '(aw-background-face ((t (:distant-foreground "gray90" :foreground "gray90"))))
 '(aw-leading-char-face ((t (:background "red" :foreground "white" :weight bold))))
 '(border ((t nil)))
 '(company-scrollbar-bg ((t (:background "lavender"))))
 '(company-scrollbar-fg ((t (:background "steel blue"))))
 '(company-template-field ((t (:background "lavender" :foreground "black"))))
 '(company-tooltip ((t (:background "lavender" :foreground "black"))))
 '(company-tooltip-annotation ((t (:foreground "steel blue"))))
 '(company-tooltip-common ((t (:foreground "steel blue"))))
 '(cperl-nonoverridable-face ((t (:foreground "chartreuse4"))))
 '(fancy-narrow-blocked-face ((t (:background "white smoke" :foreground "Grey70"))))
 '(gamegrid-face-*Tetris* ((t (:height 90 :family "Input Mono"))) t)
 '(hl-line ((t (:background "honeydew"))))
 '(indent-guide-face ((t (:foreground "MediumOrchid1"))))
 '(powerline-active1 ((t (:inherit sml/global))))
 '(powerline-active2 ((t (:inherit sml/global))))
 '(sml/client ((t (:inherit sml/prefix :background "grey"))))
 '(sml/col-number ((t (:inherit sml/global :background "grey"))))
 '(sml/discharging ((t (:inherit sml/global :background "grey" :foreground "black"))))
 '(sml/filename ((t (:inherit sml/global :background "grey" :foreground "black"))))
 '(sml/global ((t (:inherit ## :background "gray80" :foreground "black" :inverse-video nil :box (:line-width 1 :color "grey" :style released-button)))))
 '(sml/modes ((t (:inherit sml/filename :weight normal))))
 '(sml/prefix ((t (:inherit sml/global :background "grey" :foreground "black"))))
 '(term ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(vc-state-base-face ((t nil)))
 '(yas-field-highlight-face ((t (:background "gtk_selection_bg_color")))))


(require 'bind-key (expand-file-name "~/.emacs.d/use-package/bind-key.el"))
(require 'use-package (expand-file-name "~/.emacs.d/use-package/use-package.el"))
(setq use-package-always-ensure t)

(setq config-my-path (file-name-directory load-file-name))
(defun get-config-path (path) (concat config-my-path path))

(add-to-list 'load-path (get-config-path "lisp"))

(require 'config_my_elisp)
(require 'config_my_fundamental)
;; (require 'config_my_helm)
(require 'config_my_powerline)
(require 'config_my_usability)
(require 'config_my_projectile)
(require 'config_my_python)
(require 'config_my_c)
(require 'config_my_javascript)
(require 'config_my_xml)
(require 'config_my_shell)
(require 'config_my_debian)
(require 'config_my_sql)
(require 'config_my_go)
(require 'config_my_perl)
(require 'config_my_go)
;; (require 'config_my_cedet)
(require 'config_my_arduino)
(require 'config_my_modes)
(let ((local-file (expand-file-name "~/.emacs.d/local.el")))
  (when (file-exists-p local-file)
    (load-file local-file)))

(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'magit-clean 'disabled nil)
(put 'scroll-left 'disabled nil)
