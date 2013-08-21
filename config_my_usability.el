(require 'transpose-frame)
(require 'framemove)
(require 'uniquify)  ;;; Меняет имена для буферов, если названия файлов совпадают

;;; Переключение между окнами с клавиатуры
(windmove-default-keybindings)
(setq framemove-hook-into-windmove t)

(show-paren-mode 1)   ;;; Подсветка скобок


(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") ctl-z-map)

(global-set-key (kbd "C-z c") 'compile)


(global-set-key (kbd "C-x g") 'goto-line)

;;; Quick bookmarks
(global-set-key
 (kbd "<f5>")
 '(lambda ()
	"Quicksave bookmark"
	(interactive)
	(bookmark-set "tmp")
	(message (concat "Set bookmark 'tmp' at " (what-line)))))
(global-set-key
 (kbd "<f6>")
 '(lambda ()
	"Quickload bookmark"
	(interactive)
	(bookmark-jump "tmp")
	(message ("Jumped to bookmark 'tmp'"))))


(global-set-key (kbd "M-C-SPC") 'just-one-space)


(global-set-key (kbd "C-z k") 'browse-kill-ring)


;; Transpose frame (как в нормальном оконном менеджере)
(global-set-key (kbd "C-x SPC") 'transpose-frame)
(global-set-key (kbd "C-x <up>") 'flip-frame)
(global-set-key (kbd "C-x <down>") 'flip-frame)
(global-set-key (kbd "C-x <left>") 'flop-frame)
(global-set-key (kbd "C-x <right>") 'flop-frame)

;;; Переход на окно справа/слева
(global-set-key (kbd "C-x <C-up>") 'windmove-up)
(global-set-key (kbd "C-x <C-down>") 'windmove-down)
(global-set-key (kbd "C-x <C-left>") 'windmove-left)
(global-set-key (kbd "C-x <C-right>") 'windmove-right)


(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
	(with-current-buffer buf
	  (when (and (buffer-file-name) (not (buffer-modified-p)))
		(revert-buffer t t t))))
  (message "Refreshed open files."))


;;; Разворачивать <теги></теги>, {}, (), [] и т.п. на три стркои с отступом
(defun newline-and-indent-expanded ()
  (interactive)
  (newline-and-indent)
  (previous-line)
  (move-end-of-line nil)
  (newline-and-indent))
(global-set-key (kbd "C-x C-j") 'newline-and-indent-expanded)



(provide 'config_my_usability)
