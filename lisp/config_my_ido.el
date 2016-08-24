(require 'ido)
(require 'find-dired)
(ido-mode t)

(defun ido-find-file-dired (&rest ignored)
  (interactive)
  (let ((args
         (let ((enable-recursive-minibuffers t))
           (condition-case nil (read-string "Run find (with args): " nil '(find-args-history . 1)) (quit "")))))
    (find-dired ido-current-directory args)))

(define-key ido-file-completion-map (kbd "C-x M-f") 'ido-find-file-dired)

(provide 'config_my_ido)

