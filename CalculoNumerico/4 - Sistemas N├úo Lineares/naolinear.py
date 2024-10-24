'''
O método de Newton é utilizado para resolver sistemas não lineares 
através de aproximações sucessivas. Ele usa a Jacobiana, que é a 
matriz das derivadas parciais das funções em relação às variáveis.
'''
import numpy as np

# Funções não lineares
def f1(x):
    return np.exp(x[0]) + x[1] - 1

def f2(x):
    return x[0]**2 + x[1]**2 - 4

# Método de Newton para sistemas não lineares
def nao_linear():
    x = [1.0, -1.0]  # Vetor inicial
    erro = 10**-8
    k = 0  # Contador de iterações
    d = [np.ones(2)]  # Vetor de diferença inicial (arbitrário para iniciar o laço)

    while sum(abs(d)) > erro:  
        k += 1
        # Jacobiana
        J = np.array([[np.exp(x[0]), 1],
                      [2*x[0], 2*x[1]]])
        
        # Funções F(x)
        F = np.array([f1(x), f2(x)])
        
        # Calcula a diferença d (resolução de Jd = -F)
        d = np.linalg.solve(J, -F)  # Método direto para resolver o sistema
        
        # Atualiza o vetor x
        x = x + d
    
    print(f'Número de iterações: {k}')
    print(f'Solução: x = {x}')
    print(f'Último vetor de correção: d = {d}')

nao_linear()
