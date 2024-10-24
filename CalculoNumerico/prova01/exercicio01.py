import numpy as np

# Definindo a matriz A e o vetor b
A = np.array([[2, 3, -4, -5],
              [4, -6, 1, 1],
              [2, 1, 1, 1],
              [4, -2, -2, 2]], dtype=np.float64)
b = np.array([14, 12, 5, 1], dtype=np.float64)
n = len(b)

# Vetor de ordenamento das trocas de linhas
ordem = np.arange(n)

# Eliminação Gaussiana com pivotamento parcial sem troca física das linhas
for k in range(n - 1):
    # Pivotamento parcial
    max_index = np.argmax(np.abs(A[k:, k])) + k
    if max_index != k:
        # Troca virtual das linhas
        ordem[[k, max_index]] = ordem[[max_index, k]]

    for i in range(k + 1, n):
        fator = A[i, k] / A[k, k]
        A[i, k:] = A[i, k:] - fator * A[k, k:]
        b[i] = b[i] - fator * b[k]

# Substituição para trás
x = np.zeros(n)
for i in range(n - 1, -1, -1):
    x[i] = (b[i] - np.dot(A[i, i + 1:], x[i + 1:])) / A[i, i]

# Matriz escalonada e vetor b final
A_escalonada = A
b_final = b

print("Matriz escalonada A:\n", np.round(A_escalonada, 5))
print("Vetor b final:\n", np.round(b_final, 5))
print("Solução x:\n", np.round(x, 5))
print("Vetor de ordenamento das trocas de linhas:\n", ordem)
