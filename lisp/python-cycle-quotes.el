(defun python-cycle-quotes--simple (string-start string-end old-quote new-quote)
  ;;; "hello world" => 'hello world'
  (goto-char (1- string-end))
  (save-excursion
    (delete-char 1)
    (insert new-quote))
  (while (re-search-backward "[\"']" string-start t)
    (let ((return-back (point)) (found-char (char-after (point))))
      (delete-char 1)
      (cond ((eq found-char new-quote)
             ;; "hello >>'<<world" => 'hello \'world'
             (insert ?\\ new-quote))
            ((eq (char-before return-back) ?\\)
             ;; "hello >>\"<<world" => 'hello "world'
             (delete-char -1)
             (insert old-quote)
             (setq return-back (1- return-back)))
            (t
             ;; >>"<<hello world" => 'hello world
             (insert new-quote)))
      (goto-char return-back))))


(defun python-cycle-quotes--docstring (string-start string-end old-quote new-quote)
  ;;; """hello world""" => '''hello world'''
  (goto-char string-start)
  (delete-char 3)
  (insert new-quote new-quote new-quote)
  (goto-char string-end)
  (delete-char -3)
  (cond
   ((eq (char-before (point)) new-quote)
    ;;; """hello world'""" => '''hello world\''''
    (delete-char -1)
    (insert ?\\ new-quote new-quote new-quote new-quote)
    (goto-char (- (point) 2)))
   ((and (eq (char-before (point)) old-quote)
         (eq (char-before (1- (point))) ?\\))
    ;;; """hello world\"""" => '''hello world"'''
    (delete-char -2)
    (insert old-quote new-quote new-quote new-quote)
    (goto-char (1- (point))))
   (t
    ;;; """hello world""" => '''hello world'''
    (insert new-quote new-quote new-quote)))
  (goto-char (- (point) 3))
  (let ((re (regexp-opt '("'''" "\"\"\"")))
        (bound (+ 3 string-start)))
    (while (re-search-backward re bound t)
      (when (and (eq new-quote (char-after (point)))
                 (not (eq ?\\ (char-before (point)))))
        (save-excursion (insert ?\\))))))


(defun python-cycle-quotes (&optional pos)
  (interactive)
  (save-excursion
    (goto-char (or pos (point)))
    (let ((string-start (python-syntax-context 'string)))
      (when string-start
        (let* ((string-end (scan-sexps string-start 1))
               (old-quote (char-after string-start))
               (new-quote (if (equal old-quote ?\") ?' ?\"))
               (is-raw (eq ?r (char-before string-start)))
               (is-docstring (equal (buffer-substring string-start (+ 3 string-start))
                                    (string old-quote old-quote old-quote))))
          (cond
            ((and is-raw is-docstring)
             (error "not implemented yet"))
            (is-docstring
             (python-cycle-quotes--docstring string-start string-end old-quote new-quote))
            (is-raw
             (error "not implemented yet"))
            (t
             (python-cycle-quotes--simple string-start string-end old-quote new-quote))))))))
        

(provide 'python-cycle-quotes)
