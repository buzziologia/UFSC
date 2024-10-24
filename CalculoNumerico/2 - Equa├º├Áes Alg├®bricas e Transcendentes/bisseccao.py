import math
import numpy as np


# Método da Bisseção

# Definir um intervalo [a,b] e um erro e
a = 0.5
b = 1
e = 1e-5

# Definir uma função
def f(x):
    return np.exp(x) - (4*x**2)

# Teorema de Bolzano
#   Testamos se a raiz existe dentro do intervalo
if f(a)*f(b) < 0:
    interações = 0
    while (math.fabs(b-a)/2 > e):  # |b-a| > erro
        interações += 1
        xi = (a+b)/2
        if f(xi) == 0:
            print("A raíz é:" ,xi)
            break
        else:
            if f(a)*f(xi) < 0:
                b = xi
            else:
                a = xi
    print("=== Método da Bisseção ===")
    print("Número de interações é: ", interações)
    print("Valor da raíz é: ", xi)
    print("")
else:
    print("Não há raízes neste intervalo!")