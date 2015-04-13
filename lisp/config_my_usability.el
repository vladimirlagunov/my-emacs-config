(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") ctl-z-map)

(require 'midnight)  ;;; Автоматически закрывает старые буферы
(require 'transpose-frame)
(require 'framemove)
(require 'uniquify)  ;;; Меняет имена для буферов, если названия файлов совпадают

;; Ставит комбинации клавиш, которые конфликтуют со стандартными
;; (set-variable 'auto-highlight-symbol-mode-map
;; 	  (let ((map (make-sparse-keymap)))
;; 		(define-key map (kbd "C-z b") 'ahs-backward)
;; 		(define-key map (kbd "C-z f") 'ahs-forward)
;; 		(define-key map (kbd "C-z p") 'ahs-backward-definition)
;; 		(define-key map (kbd "C-z n") 'ahs-forward-definition)
;; 		(define-key map (kbd "C-z -") 'ahs-back-to-start)
;; 		(define-key map (kbd "C-z C-'") 'ahs-change-range)
;; 		(define-key map (kbd "C-z e") 'ahs-edit-mode)
;; 		map))
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode)

(require 'highlight-symbol)
(global-set-key (kbd "M-s h .") 'highlight-symbol-at-point)

;;; Переключение между окнами с клавиатуры
(windmove-default-keybindings)
(setq framemove-hook-into-windmove t)

(show-paren-mode 1)   ;;; Подсветка скобок


(global-set-key (kbd "C-z c") 'compile)


(global-set-key (kbd "C-x g") 'goto-line)
(global-set-key (kbd "<f12>") 'repeat)

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
(global-set-key (kbd "C-M-S-<backspace>") 'erase-buffer)


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
		(condition-case nil (revert-buffer t t t) (error nil)))))
  (message "Refreshed open files."))


;;; Разворачивать <теги></теги>, {}, (), [] и т.п. на три стркои с отступом
(defun newline-and-indent-expanded ()
  (interactive)
  (newline-and-indent)
  (previous-line)
  (move-end-of-line nil)
  (newline-and-indent))
(global-set-key (kbd "C-x C-j") 'newline-and-indent-expanded)


;;; TODO: config_my_git.el
(defun git (&rest args)
  (string-trim
   (with-output-to-string
     (with-current-buffer standard-output
       (apply 'call-process (append '("git" nil t nil) args))))))

(defun get-github-link ()
  (interactive)
  (let ((remote-url (git "config" "remote.origin.url"))
        (branch-name (git "symbolic-ref" "--short" "HEAD"))
        (toplevel (git "rev-parse" "--show-toplevel")))
    (string-match "^[^:]+://\\(?:[^@]+@\\)\\([^/]+\\)\\(.*\\)$" remote-url)
    (let ((remote-domain (match-string 1 remote-url))
          (remote-path (match-string 2 remote-url)))
      (if (string-prefix-p "github." remote-domain)
          (let ((github-url
                 (concat "https://" remote-domain remote-path
                         "/blob/" branch-name
                         (substring (buffer-file-name) (length toplevel))
                         "#L" (int-to-string (line-number-at-pos)))))
            (message github-url)
            (with-temp-buffer
              (insert github-url)
              (kill-ring-save (point-min) (point-max))))
        (message (concat "Not under github repo: origin is " remote-domain))))))

(global-set-key (kbd "C-z g") 'get-github-link)


(provide 'config_my_usability)
