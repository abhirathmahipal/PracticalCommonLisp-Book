; utility functions that use brute force to generate and check for prime numbers

(defun primep (number)
  (when (> number 1)
    (loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))

(defun next-prime (number)
  (loop for n from number when (primep n) return n))

; Defining the macro without parameter destruction
;(defmacro do-primes (var-and-range &rest body)
;  (let ((var (frist var-and-range))
;        (start (second var-and-range))
;        (end (third var-and-range)))
;    `(do ((,var (next-prime ,start) (next-prime (1+ ,var))))
;      ((> ,var ,end))
;      ,@body)))


; Defining Macro with parameter destruction
(defmacro do-primes ((var start end) &body body)
  `(do ((,var (next-prime ,start) (next-prime (1+ , var))))
       ((> ,var ,end))
       ,@body))








; macro call in the code
(do-primes (p 0 19)
    (format t "~d " p))


