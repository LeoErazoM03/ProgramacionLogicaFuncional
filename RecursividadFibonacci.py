def fibonacci(n):
    if n <= 0:
        return 0
    elif n == 1:
        return 1
    return fibonacci(n - 1) + fibonacci(n - 2)  # Recursión de Fibonacci

def generar_triangulo_fibonacci(n, fila=1):
    if fila > n:  # Caso base: cuando la fila supera n, terminamos
        return
    # Generamos y mostramos la fila actual
    print(" ".join(str(fibonacci(i)) for i in range(1, fila + 1)))
    generar_triangulo_fibonacci(n, fila + 1)  # Llamada recursiva para la siguiente fila

# Llamada para generar el triángulo con n filas
n = 5
generar_triangulo_fibonacci(n)
