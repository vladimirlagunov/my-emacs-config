;;; emacs -Q -batch -l ert -l python-cycle-quotes.el -l test-python-cycle-quotes.el -f ert-run-tests-batch-and-exit

(require 'python-cycle-quotes)

(defun cycle-it (py-string)
  (with-temp-buffer
    (setq python-indent-guess-indent-offset nil)
    (python-mode)
    (insert py-string)
    (goto-char (/ (buffer-end 1) 2))
    (python-cycle-quotes)
    (buffer-string)))

(defun python-approves (py-string py-string1)
  (let* ((source (concat
                 "a = " py-string "\n"
                 "b = " py-string1 "\n"
                 "print('01'[a == b])\n"))
         (result (with-temp-buffer
                   (call-process
                    "python"
                    nil  ; input file
                    t  ; output into current buffer
                    nil  ; no redisplay
                    "-c" source)
                   (buffer-string))))
    (eq (string-to-char result) ?1)))


(defmacro test-one-fixture (fixture reversible)
  (remove
   nil
   `(let ((py-string) (py-string1) (py-string2))
      (setq py-string ,fixture)
      (setq py-string1 (cycle-it py-string))
      (should (python-approves py-string py-string1))
      (setq py-string2 (cycle-it py-string1))
      (should (python-approves py-string1 py-string2))
      ,(when reversible
         `(should (equal py-string py-string2))))))


(defmacro test-one-fixture (fixture reversible)
  (remove
   nil
   `(let ((py-string) (py-string1) (py-string2))
      (setq py-string ,fixture)
      (setq py-string1 (cycle-it py-string))
      (should (python-approves py-string py-string1))
      (setq py-string2 (cycle-it py-string1))
      (should (python-approves py-string1 py-string2))
      ,(when reversible
         `(should (equal py-string py-string2))))))


(ert-deftest test-in-python ()
  ;;; simple strings
  (test-one-fixture "'hello world'" t)
  (test-one-fixture "\"hello world\"" t)  

  (test-one-fixture "'\\'hello world'" t)
  (test-one-fixture "'hello world\\''" t)
  (test-one-fixture "'hello \" world'" t)
  (test-one-fixture "'he\\'llo \\'\\'\\' world'" t)
  (test-one-fixture "\"he'llo ''' world\"" t)

  ;;; docstrings
  (test-one-fixture "'''hello world'''" t)
  (test-one-fixture "\"\"\"hello world\"\"\"" t)

  (test-one-fixture "'''hello 'quoted' world'''" t)
  (test-one-fixture "'''hello \"quoted\" world'''" t)

  (test-one-fixture "'''hello world\"'''" t)
  (test-one-fixture "\"\"\"hello world'\"\"\"" t)

  (test-one-fixture "'''\\'''hello \\''' world\\'\\'\\''''" t)
  (test-one-fixture "\"\"\"\\\"\"\"hello \\\"\"\" world\\\"\\\"\\\"\"\"\"" t)

  ;;; simple raw strings
  (test-one-fixture "r'hello world'" t)
  (test-one-fixture "r\"hello world\"" t)

  (test-one-fixture "r'\\'hello world'" t)
  (test-one-fixture "r'hello world\\''" t)
  (test-one-fixture "r'hello \" world'" t)
  (test-one-fixture "r'he\\'llo \\'\\'\\' world'" t)
  (test-one-fixture "r\"he'llo ''' world\"" t)
  )
