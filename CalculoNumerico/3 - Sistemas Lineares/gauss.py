import numpy as np

# Definindo a matriz A e o vetor b
A = np.array([[4, 2, 3],
              [2, -4, -1],
              [-1, 1, 4]], dtype=float)

b = np.array([7, 1, -5], dtype=float)

# Cópias de A e b para cálculo posterior do resíduo
A_original = A.copy()
b_original = b.copy()

n = len(b)  # Tamanho do sistema

# Etapa de escalonamento (Eliminação de Gauss)
for k in range(n-1):  # Percorrendo as colunas
    for i in range(k+1, n):  # Percorrendo as linhas abaixo da diagonal principal
        # Calcula o multiplicador para zerar o elemento abaixo do pivô
        mult = A[i, k] / A[k, k]
        
        # Zera os elementos abaixo da diagonal na linha atual
        for j in range(k, n):
            A[i, j] = A[i, j] - mult * A[k, j]
        
        # Atualiza o vetor b para manter a consistência do sistema
        b[i] = b[i] - mult * b[k]

# Agora a matriz A foi transformada em uma matriz triangular superior
print("Matriz escalonada A:")
print(A)
print("Vetor b após escalonamento:")
print(b)

# Etapa de substituição retroativa (para resolver o sistema triangular superior)
x = np.zeros(n)  # Vetor solução

# Calcula o último valor de x diretamente (substituição retroativa começa do fim)
x[n-1] = b[n-1] / A[n-1, n-1]

# Calcula os outros valores de x, de trás para frente
for i in range(n-2, -1, -1):  # Indo de n-2 até 0
    soma = 0
    for j in range(i+1, n):
        soma += A[i, j] * x[j]
    
    x[i] = (b[i] - soma) / A[i, i]

print("Solução do sistema (vetor x):")
print(x)

# Cálculo do resíduo (para verificar a precisão da solução)
residuo = np.abs(b_original - np.dot(A_original, x))

print("Resíduo:")
print(residuo)
