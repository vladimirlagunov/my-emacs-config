(require 'powerline)

(defun render-adaptive--filter-and-format (mode-line-params priority-threshold)
  (let ((filtered-string "") (filtered-pairs '()) (next-threshold nil) (spacers 0))
    (dolist (param mode-line-params)
      (when param
        (if (and (listp param) (listp (car param)) (listp (car (car param))))
            (let-alist (render-adaptive--filter-and-format param priority-threshold)
              (setq filtered-string (concat filtered-string .filtered-string)
                    filtered-pairs (append filtered-pairs .filtered-pairs)
                    next-threshold (if next-threshold
                                       (min next-threshold .next-threshold)
                                     .next-threshold)))
          (let-alist param
            (when (and .value
                       (not (and priority-threshold .priority (<= .priority priority-threshold))))
              (when (not (stringp .value))
                (error (format "%S is not a string or list" .value)))

              (let ((formatted (format-mode-line .value)))
                (setq filtered-string (concat filtered-string formatted)
                      filtered-pairs (append filtered-pairs (list param))
                      next-threshold (cond ((not next-threshold) .priority)
                                           ((not .priority) next-threshold)
                                           (t (min next-threshold .priority))))))))))

    `((filtered-string . ,filtered-string)
      (filtered-pairs . ,filtered-pairs)
      (next-threshold . ,next-threshold))))


(defun render-adaptive--priority (mode-line-params width priority-threshold)
  (let-alist (render-adaptive--filter-and-format mode-line-params priority-threshold)))

(defun render-adaptive (mode-line-params)
  (render-adaptive--priority mode-line-params (window-total-width) nil))

(provide 'powerline-adaptive)
