'''
    A principal diferença é o cálculo da Jacobiana. Aqui, usamos a técnica
numérica de diferenças finitas, o que pode ser útil quando a derivada 
analítica é difícil de calcular ou não está disponível.
    A aproximação por diferenças finitas é menos precisa do que o cálculo 
analítico das derivadas e pode ser mais lenta, pois requer a avaliação das 
funções em pontos ligeiramente deslocados. Isso aumenta o número de 
chamadas às funções a cada iteração.
'''

import numpy as np

# Funções não lineares
def f1(x):
    return np.exp(x[0]) + x[1] - 1

def f2(x):
    return x[0]**2 + x[1]**2 - 4

# Aproximação da Jacobiana usando diferenças finitas
def jacobiana_diferencas_finitas(x, h=1e-2):
    J = np.zeros((2, 2))  # Inicializando a Jacobiana

    # Funções F(x)
    F1 = f1(x)
    F2 = f2(x)
    
    # Aproximação da Jacobiana
    J[0, 0] = (f1([x[0] + h, x[1]]) - F1) / h  # Derivada de f1 em relação a x1
    J[0, 1] = (f1([x[0], x[1] + h]) - F1) / h  # Derivada de f1 em relação a x2
    J[1, 0] = (f2([x[0] + h, x[1]]) - F2) / h  # Derivada de f2 em relação a x1
    J[1, 1] = (f2([x[0], x[1] + h]) - F2) / h  # Derivada de f2 em relação a x2

    return J

# Método de Newton para sistemas não lineares com Jacobiana numérica
def nao_linear2():
    x = np.array([1.0, -1.0])  # Vetor inicial
    erro = 1e-10
    k = 0  # Contador de iterações
    d = np.ones(2)  # Vetor de diferença inicial (arbitrário para iniciar o laço)

    while np.sum(np.abs(d)) > erro:
        k += 1
        
        # Calcula F(x) (as funções)
        F = np.array([f1(x), f2(x)])
        
        # Calcula a Jacobiana aproximada usando diferenças finitas
        J = jacobiana_diferencas_finitas(x)

        # Resolução do sistema Jd = -F para obter d
        d = np.linalg.solve(J, -F)

        # Atualiza o vetor x
        x = x + d

    # Exibe o número de iterações, a solução e o último vetor de correção d
    print(f'Número de iterações: {k}')
    print(f'Solução: x = {x}')
    print(f'Último vetor de correção: d = {d}')


nao_linear2()
