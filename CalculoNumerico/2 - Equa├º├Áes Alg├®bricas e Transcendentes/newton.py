''' 
Método de Newton:
    O método é rápido quando a função tem boas propriedades, 
mas pode falhar ou convergir lentamente se a derivada for 
muito pequena ou inexistente em algum ponto.

Usa a fórmula:
            x{n+1} = n{n} - (f(x{n})/f'(x{n}))
'''

import numpy as np

# Função para a qual queremos encontrar a raiz
def f(x):
    return np.exp(x) - (4 * x ** 2)

# Derivada da função
def derivada(x):
    return np.exp(x) -8*x

def newton():
    x0 = 1  # Ponto inicial para a aproximação
    erro = 10**(-5)
    fx = f(x0) 
    k = 0  # Contador de iterações

    while abs(fx) > erro:  
        k += 1  # Incrementa o contador de iterações
        dx = derivada(x0)  
        x0 = x0 - (fx / dx)  
        fx = f(x0) 

    # Exibe os resultados finais
    print("=== Newton ===")
    print(f'Número de Iterações: {k}')
    print(f'Valor da raiz é: {x0}')
    print(f'Precisão Encontrada é: {fx}')  # Valor da função em x0, deve ser próximo de 0

newton()