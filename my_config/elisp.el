(require 'edebug)

(defvar edebug-history '())

;; (defun edebug-add-to-history (oldfn &rest args)
;;   (let ((result (apply oldfn args)))
;;     (add-to-list 'edebug-history (edebug-read-top-level-form))
;;     result))
;; (advice-add #'edebug-eval-top-level-form :around #'edebug-add-to-history)

(defun edebug-forget-all ()
  (interactive)
  (while (/= 0 (length edebug-history))
    (eval-expression
     (let ((edebug-all-forms nil)
           (edebug-all-defs nil))
       (eval-sexp-add-defvars
        (car edebug-history))))
    (setq edebug-history (cdr edebug-history))
    (message "Done")))
