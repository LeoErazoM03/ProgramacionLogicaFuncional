 (defun fibo (n)
    (if (< n 2)
        1
        (+ (fibo (- n 1)) (fibo (- n 2)))))