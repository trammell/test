; invoke as e.g. guile

; original value
(define-macro (disp exp)
   (display exp) (newline) `(display ,exp)
;  (newline)  (newline)
   )

(disp (+ 3 4))

(define-macro (disp2 exp)
   (display exp)   (newline)
      `(begin (display ,exp)
         (newline)  (newline)))

(disp2 (+ 3 4))
