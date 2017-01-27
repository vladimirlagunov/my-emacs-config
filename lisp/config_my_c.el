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
(use-package company-irony-c-headers)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-backends 'company-irony-c-headers)


(use-package irony)
(add-hook 'c++-mode-hook 'irony-mode)

(defun irony-modern-cpp-hook ()
  (add-to-list (make-local-variable 'irony-additional-clang-options)
               "-std=c++1z"))
(add-hook 'c++-mode-hook 'irony-modern-cpp-hook)

(use-package flycheck-irony)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(use-package modern-cpp-font-lock)


(use-package cmake-project)
(defun my-conf--maybe-cmake-project-mode ()
  (when (file-exists-p "CMakeLists.txt")
    (cmake-project-mode t)))
(add-hook 'c-mode-hook 'my-conf--maybe-cmake-project-mode)
(add-hook 'c++-mode-hook 'my-conf--maybe-cmake-project-mode)

;; (require 'c-mode)
;; (use-package clang-format)
;; (define-key c-mode-map [C-M-tab] 'clang-format-region)
;; (define-key c++-mode-map [C-M-tab] 'clang-format-region)

(provide 'config_my_c)
