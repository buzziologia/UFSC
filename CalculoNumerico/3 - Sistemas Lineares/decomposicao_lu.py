'''
Decomposição LU:
    O código constrói as matrizes L (triangular inferior) a partir
da matriz A. Ele usa uma abordagem de eliminação de Gauss para 
preencher as entradas de L e U.
    Imagine um sistema de equações A.x = b
    Vamos decompor a matriz A em L.U
    Ou seja: L.U.x = b, trocando Ux = y
    Logo,
    { L.y = b
    { U.x = y
'''
import numpy as np

# Matriz A e vetor b
A = np.array([[2, 1, 1],
              [-1, -1, -1],
              [6, -2, 4]], dtype=float)
b = np.array([3, -1, 14], dtype=float)
n = len(b)

# Inicializa as matrizes L e U
L = np.zeros((n, n))
U = np.zeros((n, n))

# Decomposição LU
for k in range(n):
    for i in range(k, n):
        soma = sum(L[i][t] * U[t][k] for t in range(k))
        L[i][k] = A[i][k] - soma
    
    U[k][k] = 1
    for j in range(k + 1, n):
        soma = sum(L[k][t] * U[t][j] for t in range(k))
        U[k][j] = (A[k][j] - soma) / L[k][k]

# Substituição para frente (Ly = b)
y = np.zeros(n)
y[0] = b[0] / L[0][0]
for i in range(1, n):
    soma = sum(L[i][j] * y[j] for j in range(i))
    y[i] = (b[i] - soma) / L[i][i]

# Substituição para trás (Ux = y)
x = np.zeros(n)
x[-1] = y[-1] / U[-1][-1]
for i in range(n - 2, -1, -1):
    soma = sum(U[i][j] * x[j] for j in range(i + 1, n))
    x[i] = (y[i] - soma) / U[i][i]

# Resultado
print("Matriz L:\n", L)
print("Matriz U:\n", U)
print("Solução y:\n", y)
print("Solução x:\n", x)

# Calcula o resíduo
r = np.abs(b - np.dot(A, x))
print("Resíduo:\n", r)
