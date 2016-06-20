(require 'ggtags)


(defun my-c-common-hook ()
  (ggtags-mode 1)
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (add-hook 'write-contents-functions
      (lambda()
        (save-excursion
          (delete-trailing-whitespace)))))
(add-hook 'c-mode-hook 'my-c-common-hook)
(add-hook 'c++-mode-hook 'my-c-common-hook)


;;; http://dehun.bitbucket.org/articles/28_jun_2014-cppman+emacs.%20Offline%20c++%20STL%20and%20boost%20documentation.html
;; boost documentation
(require 'anything)
(require 'anything-config)
(require 'w3m)

(defvar boost-documentation-directory
  "/usr/share/doc/libboost1.58-doc/"
  "defines boost directory location")


(defun recursive-file-list (dir)
  (let ((files-list '())
        (current-entries (directory-files dir t)))
    (dolist (entry current-entries)
      (cond ((and (file-regular-p entry)
                  (string-match "html?$" entry))
             (setq files-list
                   (cons entry files-list)))
            ((and (file-directory-p entry)
                  (not (string-equal ".." (substring entry -2)))
                  (not (string-equal "." (substring entry -1))))
             (setq files-list (append files-list (recursive-file-list entry))))))
      files-list))


(defvar anything-c-source-boost-html
  '((name . "boost html documentation")
    (requires-pattern . 3)
    (candidates . (lambda ()
                    (recursive-file-list boost-documentation-directory)))
    (delayed)
    (action . (lambda (entry)
                (w3m-browse-url entry)))))

(defun anything-c++ ()
  (interactive)
  (anything
   :prompt "Info about: "
   :candidate-number-limit 100
   :sources
      '(anything-c-source-man-pages
        anything-c-source-boost-html)))

;;; Код std содержит жуткое месиво табов и пробелов. Один таб - 8 пробелов.
(dir-locals-set-class-variables
 'c++-std-directory
 '((tab-width . 8)))
(dir-locals-set-directory-class
 "/usr/include/c++/" 'c++-std-directory)


;;; Патчинг ggtags для того, чтобы он всегда искал в /usr/include
(defun -ggtags-through (original-fn cmd &rest args)
  (let* ((original-result (apply original-fn cmd args))
         (splitted-result (split-string original-result " "))
         (patched-result
          (cons (car splitted-result) (cons "--through" (cdr splitted-result)))))
    (mapconcat #'identity patched-result " ")))
(advice-add 'ggtags-global-build-command :around #'-ggtags-through)

(provide 'config_my_c)
