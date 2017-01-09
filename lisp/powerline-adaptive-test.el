(require 'powerline-adaptive)


(ert-deftest test-render-adaptive--flatten-params ()
  (should (equal (render-adaptive--flatten-params '(((value . "hello"))
                                                    (((value . "[nested11]"))
                                                     (((value . "[nested21]")))
                                                     ((value . "[nested12]")))
                                                    ((value . "world"))))
                 '(((value . "hello"))
                   ((value . "[nested11]"))
                   ((value . "[nested21]"))
                   ((value . "[nested12]"))
                   ((value . "world"))))))

(ert-deftest test-render-adaptive--flatten-params--exclude-nil ()
  (should (equal (render-adaptive--flatten-params '(((value . "hello"))
                                                    (((value . "[nested11]"))
                                                     nil
                                                     (((value . "[nested21]"))
                                                      nil)
                                                     ((value . "[nested12]")))
                                                    nil
                                                    ((value . "world"))))
                 '(((value . "hello"))
                   ((value . "[nested11]"))
                   ((value . "[nested21]"))
                   ((value . "[nested12]"))
                   ((value . "world"))))))


(ert-deftest test-render-adaptive--filter--one-string ()
  (should (equal (render-adaptive--filter '(((value . "hello"))) nil)
                 '((filtered-params . (((value . "hello"))))
                   (next-threshold . nil)
                   (tabs . 0)))))


(ert-deftest test-render-adaptive--filter--two-strings ()
  (should (equal (render-adaptive--filter '(((value . "hello "))
                                                       ((value . "world")))
                                                     nil)
                 '((filtered-params . (((value . "hello "))
                                      ((value . "world"))))
                   (next-threshold . nil)
                   (tabs . 0)))))


(ert-deftest test-render-adaptive--filter--priority-nil ()
  (should (equal (render-adaptive--filter '(((value . "hello") (priority . 5))
                                                       ((value . " "))
                                                       ((value . "world") (priority . 8)))
                                                     nil)
                 '((filtered-params . (((value . "hello") (priority . 5))
                                      ((value . " "))
                                      ((value . "world") (priority . 8))))
                   (next-threshold . 5)
                   (tabs . 0)))))


(ert-deftest test-render-adaptive--filter--priority-half ()
  (should (equal (render-adaptive--filter '(((value . "hello") (priority . 5))
                                                       ((value . " "))
                                                       ((value . "world") (priority . 8)))
                                                     5)
                 '((filtered-params . (((value . " "))
                                      ((value . "world") (priority . 8))))
                   (next-threshold . 8)
                   (tabs . 0)))))


(ert-deftest test-render-adaptive--filter--priority-all-with-priority ()
  (should (equal (render-adaptive--filter '(((value . "hello") (priority . 5))
                                                       ((value . " "))
                                                       ((value . "world") (priority . 8)))
                                                     8)
                 '((filtered-params . (((value . " "))))
                   (next-threshold . nil)
                   (tabs . 0)))))


(ert-deftest test-render-adaptive--filter--priority-all ()
  (should (equal (render-adaptive--filter '(((value . "hello") (priority . 5))
                                                       ((value . "world") (priority . 8)))
                                                     8)
                 '((filtered-params . ())
                   (next-threshold . nil)
                   (tabs . 0)))))



(ert-deftest test-render-adaptive--filter--tab ()
  (should (equal (render-adaptive--filter '(((value . "hello") (priority . 5))
                                            ((value . "\t"))
                                            ((value . "world") (priority . 8)))
                                          nil)
                 '((filtered-params . (((value . "hello") (priority . 5))
                                       ((value . "\t"))
                                       ((value . "world") (priority . 8))))
                   (next-threshold . 5)
                   (tabs . 1)))))


(ert-deftest test-render-adaptive--filter--two-tabs ()
  (should (equal (render-adaptive--filter '(((value . "hello") (priority . 5))
                                                       ((value . "\t"))
                                                       ((value . "center"))
                                                       ((value . "\t"))
                                                       ((value . "world") (priority . 8)))
                                                     nil)
                 '((filtered-params . (((value . "hello") (priority . 5))
                                      ((value . "\t"))
                                      ((value . "center"))
                                      ((value . "\t"))
                                      ((value . "world") (priority . 8))))
                   (next-threshold . 5)
                   (tabs . 2)))))


(ert-deftest test-render-adaptive--priority--simple ()
  (should (equal (render-adaptive--priority '(((value . "hello world"))) 50 nil)
                 "hello world")))


(ert-deftest test-render-adaptive--priority--simple2 ()
  (should (equal (render-adaptive--priority '(((value . "hello"))
                                              ((value . " world")))
                                            50 nil)
                 "hello world")))


(ert-deftest test-render-adaptive--priority--truncate1 ()
  (should (equal (render-adaptive--priority '(((value . "aaa") (priority . 1))
                                              ((value . "bbb") (priority . 2))
                                              ((value . "ccc") (priority . 3)))
                                            7 nil)
                 "bbbccc")))


(ert-deftest test-render-adaptive--priority--truncate2 ()
  (should (equal (render-adaptive--priority '(((value . "aaa") (priority . 1))
                                              ((value . "bbb") (priority . 2))
                                              ((value . "ccc") (priority . 3)))
                                            5 nil)
                 "ccc")))


(ert-deftest test-render-adaptive--priority--truncate3 ()
  (should (equal (render-adaptive--priority '(((value . "aaa") (priority . 1))
                                              ((value . "bbb") (priority . 2))
                                              ((value . "ccc") (priority . 3)))
                                            2 nil)
                 "")))


(ert-deftest test-render-adaptive--priority--truncate-no-priority ()
  (should (equal (render-adaptive--priority '(((value . "aaa"))
                                              ((value . "bbb") (priority . 1))
                                              ((value . "ccc")))
                                            2 nil)
                 "aaaccc")))


(ert-deftest test-render-adaptive--priority--buffer-name ()
  (should (equal (render-adaptive--priority '(((value . "aaa") (priority . 1))
                                              ((value . "%b") (priority . 2))
                                              ((value . "ccc") (priority . 3)))
                                            (+ 3 (length (buffer-name))) nil)
                 "%bccc"))
  (should (equal (render-adaptive--priority '(((value . "aaa") (priority . 1))
                                              ((value . "%b") (priority . 2))
                                              ((value . "ccc") (priority . 3)))
                                            (+ 2 (length (buffer-name))) nil)
                 "ccc")))

