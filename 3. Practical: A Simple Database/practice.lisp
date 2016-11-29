; creates a list. Returns the list when run on the REPL
(list 1 2 3)

; Property list or plist. A flaky hashtable or python dict
(list :a 1 :b 2 :c 3)

; returns a particular property of a plist
(getf (list :a 1 :b 2 :c 3):a)

; a small function that takes in details and returns a list

(defun make-cd (title artist rating ripped)
  (list :title title :artist artist :rating rating :ripped ripped))

; declaring variables
; LISP convention to declare global variables *variable*

(defvar *db* nil)


; pushing stuff to the variable
(defun add-record (cd) (push cd *db*))

; Typing in *db* displays the contents of *db*

; Creating a function to view the contents of the global CD Variable
; t is the shorthand of standard-output

(defun dump-db ()
  (dolist (cd *db*)
    (format t "~{~a:~10t~a~%~}~%" cd)))

; getting input
(defun prompt-read(prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

; combining existing make-cd function with prompt-read
(defun prompt-for-cd ()
  (make-cd
    (prompt-read "Title")
    (prompt-read "Artist")
    (prompt-read "Rating")
    (prompt-read "Ripped [y/n]")))
