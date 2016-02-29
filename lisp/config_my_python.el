(require 'python)
(require 'pymacs)
(require 'jedi)
(require 'sphinx-doc)

(require 'config_my_flycheck)
(require 'config_my_autocomplete)


;;; По умолчанию - отступ в 4 пробела
(add-hook 'python-mode-hook
		  '(lambda () (set-variable 'py-indent-offset 4)))
;;; Если в файле есть табы - переключить на табы вместо пробелов
(add-hook 'python-mode-hook
		  (lambda ()
			(when (string-match "^\t" (buffer-string))
			  (setq indent-tabs-mode t))))

(add-hook 'python-mode-hook
  (lambda()
    (add-hook 'write-contents-functions
      (lambda()
        (save-excursion
          (delete-trailing-whitespace))))))


;;; Интерпретатор
(add-to-list 'interpreter-mode-alist '("python" . python-mode))


;;; Pymacs
(pymacs-load "ropemacs" "rope-")
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(add-hook 'python-mode-hook 'ropemacs-mode)


;; DAFUK
(add-hook 'comint-output-filter-functions
		  'python-pdbtrack-comint-output-filter-function)


;;; Автокомплит с jedi
(add-hook 'python-mode-hook 'jedi:setup)


;;; Докстринги
;;; https://github.com/naiquevin/sphinx-doc.el
(add-hook 'python-mode-hook (lambda () (sphinx-doc-mode t)))


;;; Документация по C-h S
(info-lookup-add-help
 :mode 'python-mode
 :regexp "[[:alnum:]_]+"
 :doc-spec
 '(("(python)Index" nil "")))

;;; Преобразовать `a=1,\nb=2` в `"a": 1,\n"b": 2`
(add-hook 'python-mode
		  (lambda ()
			(fset 'kwargs-to-dict
				  [?\C-\M-% ?^ ?  backspace ?\\ ?\( ?  ?\\ ?\) ?* backspace backspace backspace ?* ?\\ ?\) ?\[ ?^ ?= left left left ?\\ ?\( end ?\\ ?\) left left ?+ end ?  ?* ?= ?  ?* ?\\ ?\( ?. ?* ?\\ ?\) left left ?? end ?\\ ?\( ?, ?? ?\\ ?\} backspace ?\) ?$ return ?\\ ?1 ?\" ?\\ ?2 end ?: ?\S-  ?\\ ?3 ?\\ ?4 return ?!])
			))


;;; Патч для того, чтобы pdb в shell умел работать с несколькими мониторами
;;; Также следует установить display-buffer-alist:
;;; (("" display-buffer-reuse-window
;;;  (reusable-frames . visible)))
(defun python-pdbtrack-comint-output-filter-function (output)
  "Move overlay arrow to current pdb line in tracked buffer.
Argument OUTPUT is a string with the output from the comint process."
  (when (and python-pdbtrack-activate (not (string= output "")))
    (let* ((full-output (ansi-color-filter-apply
                         (buffer-substring comint-last-input-end (point-max))))
           (line-number)
           (file-name
            (with-temp-buffer
              (insert full-output)
              ;; When the debugger encounters a pdb.set_trace()
              ;; command, it prints a single stack frame.  Sometimes
              ;; it prints a bit of extra information about the
              ;; arguments of the present function.  When ipdb
              ;; encounters an exception, it prints the _entire_ stack
              ;; trace.  To handle all of these cases, we want to find
              ;; the _last_ stack frame printed in the most recent
              ;; batch of output, then jump to the corresponding
              ;; file/line number.
              (goto-char (point-max))
              (when (re-search-backward python-pdbtrack-stacktrace-info-regexp nil t)
                (setq line-number (string-to-number
                                   (match-string-no-properties 2)))
                (match-string-no-properties 1)))))
      (if (and file-name line-number)
          (let* ((tracked-buffer
                  (python-pdbtrack-set-tracked-buffer file-name))
                 (shell-buffer (current-buffer))
                 (tracked-buffer-window (get-buffer-window tracked-buffer
                                                           ;;; патч
                                                           'visible
                                                           ))
                 (tracked-buffer-line-pos))
            (with-current-buffer tracked-buffer
              ;;; Ещё один патч. Ставит read-only-mode на буфер с
              ;;; python-исходником, в который переключились.
              (let ((initially-buffer-read-only buffer-read-only))
                (unwind-protect
                    (progn
                      (make-local-variable 'buffer-read-only)
                      (setq buffer-read-only)

              (set (make-local-variable 'overlay-arrow-string) "=>")
              (set (make-local-variable 'overlay-arrow-position) (make-marker))
              (setq tracked-buffer-line-pos (progn
                                              (goto-char (point-min))
                                              (forward-line (1- line-number))
                                              (point-marker)))
              (when tracked-buffer-window
                (set-window-point
                 tracked-buffer-window tracked-buffer-line-pos))
              (set-marker overlay-arrow-position tracked-buffer-line-pos))

                  (setq buffer-read-only initially-buffer-read-only)))

              )
            (pop-to-buffer tracked-buffer)
            (switch-to-buffer-other-window shell-buffer))
        (when python-pdbtrack-tracked-buffer
          (with-current-buffer python-pdbtrack-tracked-buffer
            (set-marker overlay-arrow-position nil))
          (mapc #'(lambda (buffer)
                    (ignore-errors (kill-buffer buffer)))
                python-pdbtrack-buffers-to-kill)
          (setq python-pdbtrack-tracked-buffer nil
                python-pdbtrack-buffers-to-kill nil)))))
  output)


(defun flycheck-pylint-ignore-messages ()
  (interactive)
  (let* ((point-at-start (point))
         (errors (flycheck-overlay-errors-at point-at-start))
         (error-ids (mapcar #'flycheck-error-id errors))
         (error-names
          (mapcar (lambda (str)
                    (when (= (string-to-char str) ?:)
                      (substring (car (split-string str " ")) 1)))
                  (process-lines "pylint" "--help-msg" (string-join error-ids ","))))
         (comment
          (concat
           "  # pylint: disable="
           (string-join
            (delete-dups (sort (-filter (lambda (x) (not (null x))) error-names) 'string<))
            ","))))
    (progn
      (goto-char point-at-start)
      (move-end-of-line 1)
      (insert comment)
      (goto-char point-at-start)
      )))

(add-hook 'python-mode-hook
		  (lambda ()
			(local-set-key (kbd "C-c ! -") #'flycheck-pylint-ignore-messages)))


;;; which-function-mode глючит в cython
(add-hook 'cython-mode-hook (lambda () (which-function-mode -1)))
(add-hook 'cython-mode-hook (lambda () (ggtags-mode 1)))

(provide 'config_my_python)
