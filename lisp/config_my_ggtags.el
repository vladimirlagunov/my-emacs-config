(require 'use-package)
(use-package ggtags)


;;; Патчинг ggtags для того, чтобы он всегда искал в /usr/include
(defun -ggtags-through (original-fn cmd &rest args)
  (let* ((original-result (apply original-fn cmd args))
         (splitted-result (split-string original-result " "))
         (patched-result
          (cons (car splitted-result) (cons "--through" (cdr splitted-result)))))
    (mapconcat #'identity patched-result " ")))
(advice-add 'ggtags-global-build-command :around #'-ggtags-through)


(defun custom-ggtags-get-libpath (initial-path)
  (if (boundp 'ggtags-libpath)
      (if (listp ggtags-libpath)
          (append ggtags-libpath initial-path)
        (cons ggtags-libpath initial-path))
    initial-path))
(advice-add 'ggtags-get-libpath :filter-return 'custom-ggtags-get-libpath)

(provide 'config_my_ggtags)
