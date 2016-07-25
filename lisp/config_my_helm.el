(require 'use-package)
(use-package helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))


(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)


(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(global-set-key (kbd "C-x M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c C-x C-f") 'helm-projectile)


(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(when (require 'ggtags nil t)
  (eval-and-compile
    (use-package helm-gtags)
    (add-hook 'python-mode-hook 'helm-gtags-mode)
    (add-hook 'c-mode-hook 'helm-gtags-mode)
    (add-hook 'c++-mode-hook 'helm-gtags-mode)
    (add-hook 'perl-mode-hook 'helm-gtags-mode)
    (add-hook 'cython-mode-hook 'helm-gtags-mode)

    (progn
      (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
      (define-key helm-gtags-mode-map (kbd "M-]") 'helm-gtags-find-rtag)
      (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
      (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
      (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
      (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
      (define-key helm-gtags-mode-map (kbd "M-*") 'helm-gtags-pop-stack))))

(use-package projectile)
(use-package helm-projectile)

(helm-mode 1)

(provide 'config_my_helm)
