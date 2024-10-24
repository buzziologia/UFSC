''' 
Bierge Vieta:
    O esquema de Horner é uma técnica eficiente para avaliar 
polinômios e suas derivadas. Ele reescreve o polinômio de forma
que possamos calcular seu valor em um ponto x{0} de maneira 
iterativa e evitar a multiplicação repetida de termos.

Usa a fórmula de newton modificada:
                x{0} = x{0} - b(n)/c(n-1)
Onde b(n) é o valor do polinômio no ponto x{0} e c(n−1) é a 
derivada do polinômio no ponto x{0}.

'''
import numpy as np

def newton_horner():
    # Coeficientes do polinômio x^3 + 2x - 1
    a = [1, 0, 2, -1]
    n = len(a)  # n é o grau da função + 1
    x0 = 1  # Chute inicial
    erro = 1e-10  
    k = 0  # Contador de iterações
    b = [0] * n  # Inicializa o array b
    c = [0] * n  # Inicializa o array c
    b[0] = a[0]  # Inicializa b(1)
    c[0] = b[0]  # Inicializa c(1)
    b[-1] = 1  # Qualquer valor maior que o erro para entrar no laço

    while abs(b[-1]) > erro:  # Enquanto o valor absoluto de b(n) for maior que o erro
        k += 1  # Incrementa o contador de iterações

        # Esquema de Horner para calcular b(i) e c(i)
        for i in range(1, n-1):
            b[i] = b[i-1] * x0 + a[i]
            c[i] = c[i-1] * x0 + b[i]
        
        b[-1] = b[-2] * x0 + a[-1]

        # Atualiza o valor de x0 usando o método de Newton
        x0 = x0 - (b[-1] / c[-2])

    print(f'Iterações: {k-1}')  
    print(f'Raiz aproximada: {x0}')  # Raiz aproximada encontrada
    print(f'Valor do polinômio em x0 (b(n)): {b[-1]}')  # Valor de b(n), deve ser próximo de 0

# Executa a função principal
newton_horner()
