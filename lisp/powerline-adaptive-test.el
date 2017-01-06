(require 'powerline-adaptive)

(ert-deftest test-render-adaptive--filter-and-format ()
  (should (eq (* 2 2) 4)))


(ert-deftest test-render-adaptive--filter-and-format--one-string ()
  (should (equal (render-adaptive--filter-and-format '(((value . "hello"))) nil)
                 '((filtered-pairs . (((value . "hello"))))
                   (next-threshold . nil)))))


(ert-deftest test-render-adaptive--filter-and-format--two-strings ()
  (should (equal (render-adaptive--filter-and-format '(((value . "hello "))
                                                       ((value . "world")))
                                                     nil)
                 '((filtered-pairs . (((value . "hello "))
                                      ((value . "world"))))
                   (next-threshold . nil)))))


(ert-deftest test-render-adaptive--filter-and-format--priority-nil ()
  (should (equal (render-adaptive--filter-and-format '(((value . "hello") (priority . 5))
                                                       ((value . " "))
                                                       ((value . "world") (priority . 8)))
                                                     nil)
                 '((filtered-pairs . (((value . "hello") (priority . 5))
                                      ((value . " "))
                                      ((value . "world") (priority . 8))))
                   (next-threshold . 5)))))


(ert-deftest test-render-adaptive--filter-and-format--priority-half ()
  (should (equal (render-adaptive--filter-and-format '(((value . "hello") (priority . 5))
                                                       ((value . " "))
                                                       ((value . "world") (priority . 8)))
                                                     5)
                 '((filtered-pairs . (((value . " "))
                                      ((value . "world") (priority . 8))))
                   (next-threshold . 8)))))


(ert-deftest test-render-adaptive--filter-and-format--priority-all-with-priority ()
  (should (equal (render-adaptive--filter-and-format '(((value . "hello") (priority . 5))
                                                       ((value . " "))
                                                       ((value . "world") (priority . 8)))
                                                     8)
                 '((filtered-pairs . (((value . " "))))
                   (next-threshold . nil)))))


(ert-deftest test-render-adaptive--filter-and-format--priority-all ()
  (should (equal (render-adaptive--filter-and-format '(((value . "hello") (priority . 5))
                                                       ((value . "world") (priority . 8)))
                                                     8)
                 '((filtered-pairs . ())
                   (next-threshold . nil)))))


(ert-deftest test-render-adaptive--filter-and-format--nested ()
  (should (equal (render-adaptive--filter-and-format '(((value . "hello") (priority . 5))
                                                       (((value . "[nested1]") (priority . 6))
                                                        ((value . "[nested2]") (priority . 7)))
                                                       ((value . "world") (priority . 8)))
                                                     6)
                 '((filtered-pairs . (((value . "[nested2]") (priority . 7))
                                      ((value . "world") (priority . 8))))
                   (next-threshold . 7))))


(ert-deftest test-render-adaptive--filter-and-format--skip-nil ()
  (should (equal (render-adaptive--filter-and-format '(((value . "hello") (priority . 5))
                                                       ()
                                                       nil
                                                       ((value . "world") (priority . 8))
                                                       nil)
                                                     6)
                 '((filtered-pairs . (((value . "world") (priority . 8))))
                   (next-threshold . 8)))))


(ert-deftest test-render-adaptive--filter-and-format--spacer ()
  (should (equal (render-adaptive--filter-and-format '(((value . "hello") (priority . 5))
                                                       ((value . spacer))
                                                       ((value . "world") (priority . 8)))
                                                     nil)
                 '((filtered-pairs . (((value . "hello") (priority . 5))
                                      ((value . spacer))
                                      ((value . "world") (priority . 8))))
                   (next-threshold . 5)))))
