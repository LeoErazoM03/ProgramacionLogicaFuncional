;; Programa en Common Lisp para resolver el problema del cruce del puente

(defun cruzar-puente ()
  (let ((tiempo-total 0)
        (posicion-inicial '(A B C D))
        (posicion-final '())
        (tiempos '((A . 1) (B . 2) (C . 5) (D . 10))))

    ;; Primer cruce: A y B cruzan juntos (2 min)
    (setq tiempo-total (+ tiempo-total 2))
    (setq posicion-inicial '(C D A))
    (setq posicion-final '(B))
    (format t "A y B cruzan (2 min). Tiempo acumulado: ~d min~%" tiempo-total)

    ;; Regresa A con la linterna (1 min)
    (setq tiempo-total (+ tiempo-total 1))
    (setq posicion-inicial '(C D B A))
    (setq posicion-final '())
    (format t "A regresa (1 min). Tiempo acumulado: ~d min~%" tiempo-total)

    ;; Segundo cruce: C y D cruzan juntos (10 min)
    (setq tiempo-total (+ tiempo-total 10))
    (setq posicion-inicial '(A B))
    (setq posicion-final '(C D))
    (format t "C y D cruzan (10 min). Tiempo acumulado: ~d min~%" tiempo-total)

    ;; Regresa B con la linterna (2 min)
    (setq tiempo-total (+ tiempo-total 2))
    (setq posicion-inicial '(A B C D))
    (setq posicion-final '())
    (format t "B regresa (2 min). Tiempo acumulado: ~d min~%" tiempo-total)

    ;; Último cruce: A y B cruzan juntos nuevamente (2 min)
    (setq tiempo-total (+ tiempo-total 2))
    (setq posicion-inicial '())
    (setq posicion-final '(A B C D))
    (format t "A y B cruzan nuevamente (2 min). Tiempo total: ~d min~%" tiempo-total)

    (if (<= tiempo-total 17)
        (format t "¡Todos cruzaron el puente en menos de 17 minutos!")
        (format t "No se pudo completar en menos de 17 minutos."))))

(cruzar-puente)
