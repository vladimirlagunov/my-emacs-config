(require 'config_my_company)
(require 'config_my_flycheck)


;;; Проверка через jshint была во flymake, нужно сделать во flycheck
;; (defun flymake-jslint-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;; 					 'flymake-create-temp-inplace))
;; 		 (local-file (file-relative-name
;; 					  temp-file
;; 					  (file-name-directory buffer-file-name))))
;; 	(list (get-config-path "bin/jshint") (list local-file))))

;; (add-to-list
;;  'flymake-err-line-patterns 
;;  '("^\\(.*?\\): line \\([0-9]+\\), col \\([0-9]+\\), \\(.*\\)$" ; regexp
;;    1 ; file-idx
;;    2 ; line-idx
;;    3 ; col-idx
;;    4 ; err-text-idx
;;    ))

;; (add-to-list 'flymake-allowed-file-name-masks
;; 			 '("\\.js\\'" flymake-jslint-init))


;; (add-hook
;;  'js-mode-hook
;;  (lambda ()
;;    (flymake-mode)
;;    (yas/minor-mode)))


(provide 'config_my_javascript)
