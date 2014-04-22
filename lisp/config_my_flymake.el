(let ((another-flymake-el
       (concat (file-name-directory load-file-name)
               "forked-flymake/flymake.el")))
  (load-file another-flymake-el))
(require 'flymake)

(defun my-flymake-err-at (pos)
  (let ((overlays (overlays-at pos)))
    (remove nil
            (mapcar (lambda (overlay)
                      (and (overlay-get overlay 'flymake-overlay)
                           (overlay-get overlay 'help-echo)))
                    overlays))))

(defun my-flymake-err-echo ()
  (interactive)
  (message "%s" (mapconcat 'identity (my-flymake-err-at (point)) "\n")))

(global-set-key (kbd "C-x ?") 'my-flymake-err-echo)

(provide 'config_my_flymake)
