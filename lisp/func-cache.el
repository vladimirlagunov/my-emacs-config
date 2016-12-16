

(defun func-cache--unix-time ()
  (let ((x (current-time)))
    (+ (lsh (car x) 16)
       (cadr x))))


;;; (fn arg1 arg2 ... argN) -> (valid-due-timestamp . result)
(defvar func-cache--root-hash
  (make-hash-table :test 'equal))


(defun func-cache--advice-around (fn-timeout real-fn &rest args)
  (cl-check-type args list)
  (let* ((cache-key (cons real-fn args))
         (cached-result-lst (gethash cache-key func-cache--root-hash))
         (now (func-cache--unix-time)))
    (if (eq fn-timeout -1)
        (error (format "Timeout for %S not defined" real-fn)))
    (cond
     ((< (or (car cached-result-lst) -1) now)
      (let ((new-result (apply real-fn args))
            (new-result-valid-due (if (null fn-timeout) nil
                                    (+ now fn-timeout))))
        (puthash cache-key
                 (cons new-result-valid-due new-result)
                 func-cache--root-hash)
        new-result))
     (t (cdr cached-result-lst)))))


(defun func-cache (fn timeout)
  (if (not (functionp fn))
      (error (format "%S is not a function" fn)))
  (if (not (or (and (numberp timeout) (< 0 timeout)) (null timeout)))
      (error (format "%S is not a positive number or nil")))
  (advice-add fn :around
              (lambda (fn &rest args)
                (apply 'func-cache--advice-around timeout fn args))))


(defvar func-cache--test-fn1-calls '())
(defun func-cache--test-fn1 (arg)
  (setq func-cache--test-fn1-calls
        (cons arg func-cache--test-fn1-calls))
  (+ arg 1))
(func-cache 'func-cache--test-fn1 nil)

(ert-deftest test-func-cache1 ()
  (clrhash func-cache--root-hash)
  (setq func-cache--test-fn1-calls '())
  (should (equal (func-cache--test-fn1 123) 124))
  (should (equal func-cache--test-fn1-calls '(123)))
  (should (equal (func-cache--test-fn1 456) 457))
  (should (equal func-cache--test-fn1-calls '(456 123)))
  (should (equal (func-cache--test-fn1 123) 124))
  (should (equal func-cache--test-fn1-calls '(456 123)))
  (should (equal (func-cache--test-fn1 789) 790))
  (should (equal func-cache--test-fn1-calls '(789 456 123)))
  (should (equal (func-cache--test-fn1 123) 124))
  (should (equal func-cache--test-fn1-calls '(789 456 123))))

;; (ert-deftest test-example ()
;;   (should (equal (* 2 2) 5)))

;; (provide 'func-cache)

