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
(defun test-set-union ()
  (assert (equal (set-union (list 0 1 2 3) (list 4 5 6 7)) (list 3 2 1 0 4 5 6 7))
    nil "Test 1 Failed")
  (assert (equal (set-union (list 0 1 2 3) (list 4 1 6 3)) (list 2 0 4 1 6 3))
    nil "Test 2 Failed")
  (assert (equal (set-union (list 0 1 2 3 4 5 6 7) (list 9 4 10 6 11)) (list 7 5 3 2 1 0 9 4 10 6 11))
    nil "Test 3 Failed")
  (assert (equal (set-union (list 0 1 2 3 4) (list 0 1 2 3 4)) (list 0 1 2 3 4))
    nil "Test 4 Failed")
  (assert (equal (set-union (list 0 1 2 3) (list 100 218 2 27)) (list 3 1 0 100 218 2 27))
    nil "Test 5 Failed")

  (format t "SET-UNION tests passed.~%"))

(test-set-union)


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
(defun test-boolean-xor ()
  (assert (equal (boolean-xor t t) nil)
    nil "Test 1 Failed")
  (assert (equal (boolean-xor t nil) t)
    nil "Test 2 Failed")
  (assert (equal (boolean-xor nil t) t)
    nil "Test 3 Failed")
  (assert (equal (boolean-xor nil nil) nil)
    nil "Test 4 Failed")

  (format t "BOOLEAN-XOR tests passed.~%"))

(test-boolean-xor)


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
(defun test-boolean-eval()
  (assert (equal (boolean-eval '(and t nil)) nil)
    nil "Test 1 Failed")
  (assert (equal (boolean-eval '(and t t)) t)
    nil "Test 2 Failed")
  (assert (equal (boolean-eval '(or t nil)) t)
    nil "Test 3 Failed")
  (assert (equal (boolean-eval '(or nil nil)) nil)
    nil "Test 4 Failed")
  (assert (equal (boolean-eval '(not t)) nil)
    nil "Test 5 Failed")
    (assert (equal (boolean-eval '(not nil)) t)
    nil "Test 6 Failed")
  (assert (equal (boolean-eval '(xor t nil)) t)
    nil "Test 7 Failed")
    (assert (equal (boolean-eval '(xor t t)) nil)
    nil "Test 8 Failed")
  (assert (equal (boolean-eval '(implies t nil)) nil)
    nil "Test 9 Failed")
  (assert (equal (boolean-eval '(implies nil nil)) t)
    nil "Test 10 Failed")
  (assert (equal (boolean-eval '(iff t nil)) nil)
    nil "Test 11 Failed")
  (assert (equal (boolean-eval '(iff t t)) t)
    nil "Test 12 Failed")
  (assert (equal (boolean-eval '(and t (or t nil))) t)
    nil "Test 13 Failed")
  (assert (equal (boolean-eval '(xor (and t nil) (not nil))) t)
    nil "Test 14 Failed")
  (assert (equal (boolean-eval '(and (iff t nil) (or t nil))) nil)
    nil "Test 15 Failed")
  (assert (equal (boolean-eval '(or (implies t nil) (and t (or t nil)))) t)
    nil "Test 16 Failed")

  (format t "BOOLEAN-EVAL tests passed.~%"))

(test-boolean-eval)

;; Problem: 9
(defun test-merge-sort ()
  ;; Base cases
  (assert (equal (merge-sort '() #'<) '()))
  (assert (equal (merge-sort '(42) #'<) '(42)))

  ;; ascending/descending
  (assert (equal (merge-sort '(2 1 5 0) #'<) '(0 1 2 5)))
  (assert (equal (merge-sort '(2 1 5 0) #'>) '(5 2 1 0)))

  ;; duplicates
  (assert (equal (merge-sort '(3 1 2 1 3) #'<) '(1 1 2 3 3)))
  (assert (equal (merge-sort '(5 5 5 5) #'<) '(5 5 5 5)))

  ;; mixed values with negs
  (assert (equal (merge-sort '(-5 -1 -3 0 2) #'<) '(-5 -3 -1 0 2)))
  (assert (equal (merge-sort '(10 -2 3 7 0 -8) #'<) '(-8 -2 0 3 7 10)))

  ;; message for success
  (format t "Merge-Sort passed the tests~%"))


(test-merge-sort)

