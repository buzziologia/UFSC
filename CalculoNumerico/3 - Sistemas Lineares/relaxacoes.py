import numpy as np

a = [[3, -1, -1], 
     [1, 3, 1], 
     [2, -2, 4]]

b = [1, 5, 4]

n = len(b)

erro = 10**-8  
k = 0
x0 = [0, 0, 0]  # Inicializando o chute inicial
x_old = x0.copy()

# Definindo a matriz
a = np.array([[3, -1, -1], 
              [1,  3,  1], 
              [2, -2,  4]])
# Calculando o determinante
determinante = np.linalg.det(a)

d = 1  # d deve ser maior que erro
w = 1.05 # deve ser maior que d

while d > erro:
    k += 1
    for i in range(n): 
        soma = 0 
        for j in range(n): 
            if j != i:
                soma += a[i][j] * x0[j]
        x0[i] =(1-w)*x0[i] + w*(b[i] - soma) / a[i][i]
    
    # Calcular a diferença absoluta entre x e x0
    d = sum(abs(x_old[i] - x0[i]) for i in range(n))
    
    # Atualizar x
    x_old = x0.copy()
    
print(k)
print(x0)
print(d)
