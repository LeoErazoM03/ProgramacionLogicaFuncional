(defparameter *nodes* '(
  (Samsung (
    (lineaA (A35 A45 A55))
    (lineaS (S23 S24 S25))
    (lineaZ (Zflip5 Zflip6))))
  
  (Apple (
    (lineaSE (SE2020 SE2022))
    (lineaPro (iPhone13Pro iPhone14Pro iPhone15Pro))
    (lineaBase (iPhone13 iPhone14 iPhone15))))
  
  (Motorola (
    (lineaG (G13 G23 G73))
    (lineaEdge (Edge30 Edge40 Edge50))
    (lineaRazr (Razr2022 Razr2023))))
  
  (Xiaomi (
    (lineaRedmi (RedmiNote11 RedmiNote12 RedmiNote13))
    (lineaMi (Mi10 Mi11 Mi12))
    (lineaPoco (PocoX3 PocoX4 PocoX5))))
))

(defun recorre (lista)
  (when lista
    (let ((elemento(car lista)))
      (format t "Tu marca de celular es ~a?~%" (car elemento))
      (setq a (read))
      (if (string-equal a "si")
      (progn
        (setq b (cadr(assoc (car elemento) lista)))
        (recorre b)
      )
      (recorre (cdr lista))
      )
  )
) 
)

