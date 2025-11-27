;; loads file in for testing
(load "main.lisp")

;; Problem: 1

(defun test-set-member ()
  (assert (eq (set-member '(1 2 3) 2) t)
          nil "Test 1 Failed")

  (assert (eq (set-member '(1 2 3) 99) nil)
          nil "Test 2 Failed")

  (assert (eq (set-member nil 5) nil)
          nil "Test 3 Failed")

  (assert (eq (set-member '(a b c) 'b) t)
          nil "Test 4 Failed")

  (assert (eq (set-member '(a b c) 'z) nil)
          nil "Test 5 Failed")

  (format t "SET-MEMBER tests passed.~%"))

(test-set-member)

;; Problem: 2



;; Problem: 3
(defun test-set-intersection ()
  (assert (equal (set-intersection '(1 2 3) '(2 3 4)) '(2 3))
          nil "Test 1 Failed")

  (assert (equal (set-intersection '(1 2 3) '(4 5 6)) nil)
          nil "Test 2 Failed")

  (assert (equal (set-intersection nil '(1 2 3)) nil)
          nil "Test 3 Failed")

  (assert (equal (set-intersection '(1 2 3) nil) nil)
          nil "Test 4 Failed")

  (assert (equal (set-intersection '(1 2 3) '(1 2)) '(1 2))
          nil "Test 5 Failed")

  (assert (equal (set-intersection '(1 2 3) '(1 2 3)) '(1 2 3))
          nil "Test 6 Failed")

  (assert (equal (set-intersection '(1 2 3) '(3)) '(3))
          nil "Test 7 Failed")

  (assert (equal (set-intersection nil nil) nil)
          nil "Test 8 Failed")

  (format t "SET-INTERSECTION tests passed.~%"))

(test-set-intersection)


;; Problem: 4

(defun test-set-diff ()
  (assert (equal (set-diff '(1 2) '(2 4)) '(1))
          nil "Test 1 Failed")

  (assert (equal (set-diff '(1 2 3) '(3 1)) '(2))
          nil "Test 2 Failed")

  (assert (equal (set-diff '(a b c) '(b)) '(a c))
          nil "Test 3 Failed")

  (assert (equal (set-diff '(1 2 3) nil) '(1 2 3))
          nil "Test 4 Failed")

  (assert (equal (set-diff nil '(1 2 3)) nil)
          nil "Test 5 Failed")

  (format t "SET-DIFF tests passed.~%"))

(test-set-diff)


;; Problem: 5



;; Problem: 6
(defun test-boolean-implies ()
  (assert (eq (boolean-implies t nil) nil)
          nil "Test 1 Failed")

  (assert (eq (boolean-implies nil nil) t)
          nil "Test 2 Failed")

  (assert (eq (boolean-implies t t) t)
          nil "Test 3 Failed")

  (assert (eq (boolean-implies nil t) t)
          nil "Test 4 Failed")

  (format t "BOOLEAN-IMPLIES tests passed.~%"))

(test-boolean-implies)

;; Problem: 7



;; Problem: 8


;; Problem: 9
