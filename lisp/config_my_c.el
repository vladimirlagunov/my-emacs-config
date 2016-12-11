(require 'config_my_ggtags)
(use-package ggtags)

(defun my-c-c++-common-hook ()
  (ggtags-mode 1)
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (make-local-variable 'flycheck-clang-args)
  (setq
   flycheck-clang-args
   (append flycheck-clang-args
           (if (eq major-mode 'c++-mode)
               '("-x" "c++" "-std=c++14")
             '("-std=c99"))))
  (add-hook 'write-contents-functions
      (lambda()
        (save-excursion
          (delete-trailing-whitespace)))))
(add-hook 'c-mode-hook 'my-c-c++-common-hook)
(add-hook 'c++-mode-hook 'my-c-c++-common-hook)


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


(require 'config_my_company)
(use-package company-c-headers)
(add-to-list 'company-backends 'company-c-headers)


(use-package irony)
(add-hook 'c++-mode-hook 'irony-mode)



(provide 'config_my_c)
