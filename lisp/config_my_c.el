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


(provide 'config_my_c)
