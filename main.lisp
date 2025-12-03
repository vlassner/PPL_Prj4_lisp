; To run a script use:
; sbcl --script main.lisp


;; Problem 1:Ermiyas
;; Return T if item is a member of set.

;; Return NIL if item is not a member of set.

;; The type of set is list.

;; Examples:

;;  (set-member '(1 2) 1) => T

;;  (set-member '(1 2) 3) =>  NIL

(defun set-member (set item)  
  (cond
    ((equal set nil) nil) ; 
    ((equal (car set) item) t)
    (t (set-member (cdr set) item))))  
  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Problem 2:Jonathon

;; Return the union of set-1 and set-2.

;; The result should contain no duplicates.

;; Assume set-1 contains no duplicates and set-2 contains no duplicates.

;; Examples:

;;   (set-union '(1 2) '(2 4)) => '(1 2 4)

(defun set-union (set-1 set-2)
  (cond 
    ((equal set-1 nil) set-2)
    ((set-member set-2 (car set-1)) (set-union (cdr set-1) set-2))
    (t (set-union (cdr set-1) (cons (car set-1) set-2)))
    )
)

 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Problem 3:Victoria

;; Return the intersection of set-1 and set-2.

;; The result should contain no duplicates.

;; Assume set-1 contains no duplicates and set-2 contains no duplicates.

;; Examples:

;;   (set-intersection '(1 2) '(2 4)) => '(2)

(defun set-intersection (set-1 set-2)
 (cond
    ((null set-1) nil)  ;; base case
    ((inside_set (car set-1) set-2)  ;; check 1st element if equal
     (cons (car set-1) (set-intersection (cdr set-1) set-2)))  ;; add element to result
    (t (set-intersection (cdr set-1) set-2))))  ;; otw continue to next element

;; helper function to check for element in a list
(defun inside_set (element set)
  (cond
    ((null set) nil)  ;; if set is empty -> return nil
    ((equal element (car set)) t)  ;; if elements match -> return true
    (t (inside_set element (cdr set)))))  ;; otw continue



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Problem 4:Ermiyas

;; Return the difference of set-1 and set-2.

;; The result should contain no duplicates.

;; Assume set-1 contains no duplicates and set-2 contains no duplicates.

;;

;; Examples:

;;   (set-diff '(1 2) '(2 4)) => '(1)

(defun set-diff (set-1 set-2)
  (cond
    ((equal set-1 nil) nil)
    ((set-member set-2 (car set-1))
     (set-diff (cdr set-1) set-2))
    (t
     (cons (car set-1)
           (set-diff (cdr set-1) set-2))))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Problem 5:Jonathon

;; Return the exclusive or of a and b

;;

;; Examples:

;;  (boolean-xor t nil) => t

;;  (boolean-xor nil nil) => nil

(defun boolean-xor (a b)
  (cond
      ((equal a b) nil)
      (t t)
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Problem 6:Victoria

;; Return the implication of a and b

;;

;; Examples:

;;  (boolean-implies t nil) => nil

;;  (boolean-implies nil nil) => t

;; t => nil -> nil
;; nil => nil -> t
;; t => t -> t
;; nil => t -> t
;; a -> b = not(a) or b


(defun boolean-implies (a b)

  (or (not a) b)

)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Problem 7:Ermiyas

;; Return the bi-implication (if and only if) of a and b

;;

;; Examples:

;;  (boolean-iff t nil) => nil

;;  (boolean-iff nil nil) => t

(defun boolean-iff (a b)

;;<Your implementation go here >

)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Problem 8:Jonathon

;; Evaluate a boolean expression.

;; Handle NOT, AND, OR, XOR, IMPLIES, and IFF.

;;

;; Examples:

;;  (boolean-eval '(and t nil)) => nil

;;  (boolean-eval '(and t (or nil t)) => t

;; Helper function for boolean-eval
(defun is-op (exp)
  (cond
    ((equal exp t) nil)
    ((equal exp nil) nil)
    (t t)
  )
)

(defun boolean-eval (exp)
  (let ((op (car exp))
        (v1 (second exp))
        (v2 (third exp))
        )
    (cond
      ((is-op v1) (boolean-eval (list op (boolean-eval v1) v2)))
      ((is-op v2) (boolean-eval (list op v1 (boolean-eval v2))))
      ((equal op 'not) (not v1))
      ((equal op 'and) (and v1 v2))
      ((equal op 'or) (or v1 v2))
      ((equal op 'xor) (boolean-xor v1 v2))
      ((equal op 'implies) (boolean-implies v1 v2))
      ((equal op 'iff) (boolean-iff v1 v2))
    )
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Problem 9:Victoria

;; Perform merge sort on the lists.

;; Parameters:

;;   list: The list to sort

;;   predicate: A function to compare elements of the list

;;

;; Examples:

;;     (merge-sort '(2 1 5 0) #'<) => '(0 1 2 5)

;;     (merge-sort '(2 1 5 0) #'>) => '(5 2 1 0)

;; merge sort -> divide into two half / merge sorted halves

(defun merge-sort (list predicate)
  (cond
    ;; Base Case:
    ;; if the list is empty or length is ≤ 1,
    ;; gets returned
    ((or (equal list nil) (<= (length list) 1)) list)

    ;; Recursive Case
    ;; if the list is 2 or more elements
    (T (let* (

            ;; Midpoint:
            ;; calculated by dividing the list length by 2
            (mid (/ (length list) 2))

            ;; Left Side
            (left
             ;; labels create local scope for take function
             ;; takes the first N items from a list one by one using cons
             (labels ((take (lst n)
                        (cond
                          ;; base case:
                          ;; if list is nil or n ≤ 0, return nil
                          ((or (equal lst nil) (<= n 0)) NIL)

                          ;; otw, make a new list by:
                          ;; taking (car lst) → first element, recursively taking N-1 from (cdr lst), and CONS them together
                          (T (cons (car lst) (take (cdr lst) (- n 1)))))))
                
                ;; Run the function on the original list
                ;; to produce the left half
                (take list mid)))

            ;; Right Side
            (right
             ;; local recursive function drop
             ;; skips first N items and returns the remainder
             (labels ((drop (lst n)
                        (cond
                          ;; base case:
                          ;; if list is nil or n ≤ 0, stop dropping and return the list
                          ((or (equal lst nil) (<= n 0)) lst)

                          ;; otw, keep dropping N-1 from (cdr lst)
                          ;; until 0
                          (T
                           (drop (cdr lst) (- n 1))))))
                (drop list mid)))
            )

       ;; Merge Function
       ;; combines 2 already-sorted lists into 1 sorted list.
       (labels ((merge-lists (a b)
                  (cond
                    ;; if A is empty → B, return B
                    ((equal a NIL) b)

                    ;; if B is empty → A, return A
                    ((equal b NIL) a)

                    ;; checks for when predicate is #'< like (car a) < (car b)
                    ((funcall predicate (car a) (car b))

                     ;; if a is greater than A_head + merge( A_tail , B )
                     (cons (car a) (merge-lists (cdr a) b)))

                    ;; otw, B_head + merge( A , B_tail )
                    (T
                     (cons (car b) (merge-lists a (cdr b)))))))

         ;; recursively sort each half, then call merge-lists to merge them
         (merge-lists (merge-sort left predicate)
                      (merge-sort right predicate))
         )))))

 

 






