(require 'powerline)


(defun render-adaptive--flatten-params (mode-line-params)
  (let ((result))
    (dolist (param mode-line-params)
      (when param
        (setq result
              (append result
                      (if (and (listp param) (listp (car param)) (listp (car (car param))))
                          (render-adaptive--flatten-params param)
                        (list param))))))
    result))


(defun render-adaptive--filter (mode-line-params priority-threshold)
  (let ((filtered-params '()) (next-threshold nil) (tabs 0))
    (dolist (param mode-line-params)
      (let-alist param
        (when (not (and priority-threshold .priority (<= .priority priority-threshold)))
          (when (not .value)
            (error (format "%S: should contain (value . something)" param)))

          (if (equal "\t" .value)
              (setq tabs (1+ tabs))
            (when (not (stringp .value))
              (error (format "%S: value is not a string" param))))

          (setq filtered-params (append filtered-params (list param))
                next-threshold (cond ((not next-threshold) .priority)
                                     ((not .priority) next-threshold)
                                     (t (min next-threshold .priority)))))))

    `((filtered-params . ,filtered-params)
      (next-threshold . ,next-threshold)
      (tabs . ,tabs))))


(defun render-adaptive--priority (mode-line-params width priority-threshold)
  (let ((filtered-params)
        (tabs nil)
        (free-width 0))
    (let ((filter-further t))
      (while filter-further
        (let-alist (render-adaptive--filter mode-line-params priority-threshold)
          (let ((required-width
                 (apply '+ (mapcar (lambda (param)
                                     (let ((value (cdr (assq 'value param))))
                                       (if (stringp value) (length (format-mode-line value)) 0)))
                                   .filtered-params))))
            (setq filtered-params .filtered-params
                  priority-threshold .next-threshold
                  tabs .tabs
                  free-width (max 0 (- width required-width))
                  filter-further (and .next-threshold (< width required-width)))))))
    (let ((result "")
          (tab-width (if (eq 0 tabs) 0 (/ free-width tabs)))
          (large-tabs-count (if (eq 0 tabs) 0 (mod free-width tabs))))
      (dolist (param filtered-params)
        (setq result (concat result
                             (let ((value (cdr (assq 'value param))))
                               (if (equal "\t" value)
                                   (let ((large-tab (< 0 large-tabs-count)))
                                     (if large-tab (setq large-tabs-count (1- large-tabs-count)))
                                     (apply 'propertize
                                            (make-string (if large-tab (1+ tab-width) tab-width) #x20)
                                            (text-properties-at 0 value)))
                                 value)))))
      result)))


(defun render-adaptive (mode-line-params)
  (render-adaptive--priority (render-adaptive--flatten-params mode-line-params)
                             (window-body-width)
                             nil))

(provide 'powerline-adaptive)
