(require 'powerline)

(defun render-adaptive--filter-and-format (mode-line-params priority-threshold)
  (let ((filtered-pairs '()) (next-threshold nil) (spacers 0))
    (dolist (param mode-line-params)
      (when param
        (if (and (listp param) (listp (car param)) (listp (car (car param))))
            (let-alist (render-adaptive--filter-and-format param priority-threshold)
              (setq filtered-pairs (append filtered-pairs .filtered-pairs)
                    next-threshold (if next-threshold
                                       (min next-threshold .next-threshold)
                                     .next-threshold)))
          (let-alist param
            (when (not (and priority-threshold .priority (<= .priority priority-threshold)))
              (when (not .value)
                (error (format "%S: should contain (value . something)" param)))

              (when (not (or (equal 'spacer .value) (stringp .value)))
                (error (format "%S: value is not a string or 'spacer" param)))

              (let ((formatted (if (stringp .value) (format-mode-line .value) .value)))
                (setq filtered-pairs (append filtered-pairs (list param))
                      next-threshold (cond ((not next-threshold) .priority)
                                           ((not .priority) next-threshold)
                                           (t (min next-threshold .priority))))))))))

    `((filtered-pairs . ,filtered-pairs)
      (next-threshold . ,next-threshold))))


(defun render-adaptive--priority (mode-line-params width priority-threshold)
  (let-alist (render-adaptive--filter-and-format mode-line-params priority-threshold)))

(defun render-adaptive (mode-line-params)
  (render-adaptive--priority mode-line-params (window-total-width) nil))

(provide 'powerline-adaptive)
