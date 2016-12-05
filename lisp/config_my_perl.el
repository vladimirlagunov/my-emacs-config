(require 'perl-mode)
(require 'config_my_ggtags)


(defconst my-flycheck-perl-autoinclude-fname "my-flycheck-perl-autoinclude.txt")

;; (defun do-my-flycheck-perl-autoinclude ()
;;   (let ((filename (buffer-file-name (current-buffer))))
;;     (when filename
;;       (let* ((root-dir
;;               (locate-dominating-file
;;                filename
;;                my-flycheck-perl-autoinclude-fname))
;;              (branch-dir
;;               (let ((dir-re "^.*\\(?:/trunk/\\|/branches/[^/]+/\\)"))
;;                 (if (string-match dir-re filename) (match-string 0 filename) root-dir)))
;;              (patterns
;;               (if root-dir
;;                   (with-temp-buffer
;;                     (insert-file-contents (concat root-dir my-flycheck-perl-autoinclude-fname))
;;                     (goto-char (point-min))
;;                     (while (re-search-forward "#.*" nil t)
;;                       (replace-match "" nil nil))
;;                     (goto-char (point-min))
;;                     (while (re-search-forward "^ROOT/" nil t)
;;                       (replace-match root-dir t t))
;;                     (goto-char (point-min))
;;                     (while (re-search-forward "^BRANCH/" nil t)
;;                       (replace-match branch-dir t t))
;;                     (split-string (buffer-string) "[\r\n]" t))
;;                 ()))
;;              (include-path-list
;;               (mapcar #'file-truename
;;                       (apply 'append
;;                              (mapcar
;;                               (lambda (glob) (ignore-errors (file-expand-wildcards glob)))
;;                               patterns)))))
;;         (make-local-variable 'flycheck-perl-include-path)
;;         (setq flycheck-perl-include-path include-path-list)))))
;; (add-hook 'perl-mode-hook #'do-my-flycheck-perl-autoinclude)


(defun flycheck-perl-dominating ()
  (let* ((perl "flycheck-perl")
         (dirname (locate-dominating-file
                    (buffer-file-name (current-buffer))
                    perl)))
    (when dirname
      (progn
        (make-local-variable 'flycheck-perl-my-executable)
        (setq flycheck-perl-my-executable (concat dirname perl))))))
(add-hook 'perl-mode-hook #'flycheck-perl-dominating)

(add-hook 'perl-mode-hook (lambda () (ggtags-mode 1)))


(flycheck-define-checker perl-my
  "PATCHED BY ME: read file as is, not from stdin

A Perl syntax checker using the Perl interpreter.

See URL `https://www.perl.org'."
  :command ("perl" "-w" "-c"
            (option-list "-I" flycheck-perl-include-path)
            source-inplace)
  :standard-input nil
  :error-patterns
  (
   ;; (error line-start
   ;;        (or
   ;;         (and (message (minimal-match (one-or-more anything)))
   ;;              " at " (one-or-more anything) " line " (one-or-more anything))
   ;;         (message))
   ;;        (or "." (and ", " (zero-or-more not-newline))) line-end)
   (error line-start (minimal-match (message))
          " at " (file-name) " line " line
          (or "." (and ", " (zero-or-more not-newline))) line-end))
  :modes (perl-mode cperl-mode)
  :next-checkers (perl-perlcritic))

;; (defalias 'perl-mode 'cperl-mode)  ;; cperl-mode жутко тормозной


(add-to-list 'auto-mode-alist '("\\.psgi\\'" . perl-mode))


(provide 'config_my_perl)
