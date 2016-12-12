(require 'use-package)
(require 'config_my_ido)

(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") ctl-z-map)

(require 'midnight)  ;;; Автоматически закрывает старые буферы
(use-package transpose-frame)
(use-package framemove)
(require 'uniquify)  ;;; Меняет имена для буферов, если названия файлов совпадают

(use-package magit)
;; (use-package magit-gh-pulls)

(use-package goto-last-change)

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
(use-package auto-highlight-symbol)
(global-auto-highlight-symbol-mode)

(use-package highlight-symbol)
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


(use-package browse-kill-ring)
(global-set-key (kbd "C-z k") 'browse-kill-ring)
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)


;; Transpose frame (как в нормальном оконном менеджере)
(global-set-key (kbd "C-x SPC") 'transpose-frame)
(global-set-key (kbd "C-x <up>") 'flip-frame)
(global-set-key (kbd "C-x <down>") 'flip-frame)
(global-set-key (kbd "C-x <left>") 'flop-frame)
(global-set-key (kbd "C-x <right>") 'flop-frame)

;;; Переход на окно справа/слева
(global-set-key (kbd "C-x <C-up>") 'windmove-up)
(global-set-key (kbd "C-; C-p") 'windmove-up)
(global-set-key (kbd "C-x <C-down>") 'windmove-down)
(global-set-key (kbd "C-; C-n") 'windmove-down)
(global-set-key (kbd "C-x <C-left>") 'windmove-left)
(global-set-key (kbd "C-; C-b") 'windmove-left)
(global-set-key (kbd "C-x <C-right>") 'windmove-right)
(global-set-key (kbd "C-; C-f") 'windmove-right)


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
       (let ((return-code
              (apply 'call-process (append '("git" nil t nil) args))))
         (if (not (eq 0 return-code))
             (error (string-join (list "Command git" (string-join args " ")
                                       "exited with code" (int-to-string return-code)
                                       ":" (buffer-string))
                                 " "))))))))

(defun github-url-prefix ()
  (let ((remote-url (git "config" "remote.origin.url")))
    (string-match "^[^:]+://\\(?:[^@]+@\\)\\([^/]+\\)\\(.*\\)$" remote-url)
    (let ((remote-domain (match-string 1 remote-url))
          (remote-path (match-string 2 remote-url)))
      (cond ((string-prefix-p "github." remote-domain)
             (concat "https://" remote-domain remote-path))
            (t (error (concat "Not under github repo: origin is '" remote-domain "'")))))))

(defun get-github-link ()
  (interactive)
  (let* ((github-url-start (github-url-prefix))
         (ref-name (condition-case ex
                       (git "symbolic-ref" "--short" "HEAD")
                     ('error (git "rev-parse" "HEAD"))))
         (toplevel (git "rev-parse" "--show-toplevel"))
         (github-url
          (concat github-url-start
                  "/blob/" ref-name
                  (substring (buffer-file-name) (length toplevel))
                  "#L" (int-to-string (line-number-at-pos)))))
    (message github-url)
    (with-temp-buffer
      (insert github-url)
      (kill-ring-save (point-min) (point-max)))))

(global-set-key (kbd "C-z g") 'get-github-link)

(defun get-github-commit-link ()
  (interactive)
  (let* ((github-url-start (github-url-prefix))
         (line-str (int-to-string (line-number-at-pos)))
         (commit-hash (substring
                       (git "blame" "-b"
                            (concat "-L" line-str "," line-str)
                            "-l" "-s" (buffer-file-name))
                       0 40))
         (github-url
          (concat github-url-start
                  "/commit/" commit-hash
                  "#diff-" "-UNKNOWNHASH-" "R" line-str)))
    (message github-url)
    (with-temp-buffer
      (insert github-url)
      (kill-ring-save (point-min) (point-max)))))

(global-set-key (kbd "C-z G") 'get-github-commit-link)


(global-set-key (kbd "s-g") 'magit-status)

(global-set-key (kbd "C-x C-\\") 'goto-last-change)


(use-package with-editor)
(define-key (current-global-map)
  [remap async-shell-command] 'with-editor-async-shell-command)
(define-key (current-global-map)
  [remap shell-command] 'with-editor-shell-command)
(add-hook 'shell-mode-hook  'with-editor-export-editor)
(add-hook 'term-mode-hook   'with-editor-export-editor)
(add-hook 'eshell-mode-hook 'with-editor-export-editor)




;; (setq
;;  mode-line-format
;;  '(
;;   "%e"

;;   (:propertize
;;    (""
;;     mode-line-front-space
;;     mode-line-mule-info
;;     mode-line-client
;;     mode-line-modified
;;     mode-line-remote
;;     mode-line-frame-identification)
;;    face ((t (:background "grey60"))))

;;   (:propertize
;;    "▶►"
;;    face (:foreground "grey60"))
  
;;   mode-line-buffer-identification
;;   "   "
;;   mode-line-position
;;   (vc-mode vc-mode)
;;   "  "
;;   mode-line-modes
;;   mode-line-misc-info
;;   mode-line-end-spaces
;;   ))


(use-package engine-mode)
(defengine yandex "https://yandex.ru/search/?text=%s" :keybinding "y")


(use-package ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-.") 'ace-jump-mode)
;; Почему-то переменные из ace-jump-mode не настраиваются через customize-variable
(setq ace-jump-mode-submode-list
      '(ace-jump-char-mode    ;; C-. 
        ace-jump-word-mode  ;; C-u C-.
        ace-jump-line-mode))  ;; C-u C-u C-.
(setq ace-jump-mode-scope 'visible)
(setq ace-jump-mode-enable-mark-sync t)
;; Только маленькие ascii
(setq ace-jump-mode-move-keys
      (loop for i from ?a to ?z collect i))


(use-package ace-window)
(define-key global-map (kbd "C-x C-.") 'ace-window)


(use-package expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


(defun raise-all-frames ()
  (interactive)
  (let ((init-frame (window-frame)))
    (loop for f in-ref (frames-on-display-list) do (raise-frame f))
    (select-frame init-frame)
    (raise-frame init-frame)))
(define-key global-map (kbd "C-z r") 'raise-all-frames)


; Костыль для vc-annotate и svn+ssh
(setenv "SVN_SSH" (expand-file-name "../../emacs-svn-ssh-kludge" (expand-file-name load-file-name)))

; Костыль для глючного find-dired, которая пытается что-то сделать
; с процессом find уже после того, как он завершился.
(setq find-program "sleep 0.2 && find")

; Часто grep'аются минифицированные js-файлы. В grep-mode не нужен line-move-visual
(add-hook 'grep-mode-hook
          (lambda ()
            (make-local-variable 'line-move-visual)
            (setq line-move-visual nil)))


(provide 'config_my_usability)
