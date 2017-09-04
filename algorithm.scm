; All definitions implemented here were taken from [1].
(define tolerance 0.00000001)    ; arbitrary difference between x_k+1 and x_k to determine root

(define (fixed-point f first-guess)
  (define (close-enough? x0 x1)
    (< (abs (- x0 x1)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      ;(display guess)              ; watch convergence
      ;(newline)
      (cond ((close-enough? guess next) next
	     ;(display next)        ; display roots
	     ;(newline)
	     )
	    (else (try next)))))
  (try first-guess))

(define dx 0.00000001)             ; 'infinitesimal' dx

(define (deriv g)                  ; simple derivative implementation using limit definition
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)        
  (lambda (x)                       ; return a function that takes in x_k and outputs x_k+1
    (- x (/ (g x) ((deriv g) x))))) ; newton's algorthim

(define (newtons-method g guess)    
  (fixed-point (newton-transform g) guess)) ; apply newton's algorithm until the error is within the set tolerance

; Something to experiment with and prove:
; "For finding square roots, Newton's method converges rapidly to the correct solution from any starting point."
; - Structure and Interpretation of Computer Programs, Abelson, Sussman p. 75

; The following definitions are original work for the project

(define (nth-root x n guess)
  (newtons-method (lambda (y) (- (expt y n) x)) guess))   ; apply newtons method to f(y) = y^n - x
					; notice that x is a bound constant
                                        ;it is a formal parameter of nth-root

(define (nth-root-iter x begin end guess)
  (define (iter n)
    (display (expt (nth-root x n guess) n))
    (newline)
    (if (< n end)
	(iter (+ n 1))
	0))
  (iter begin))
