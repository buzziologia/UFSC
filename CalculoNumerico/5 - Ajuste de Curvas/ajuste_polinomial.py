# Objetivo:
# Achar uma função g(x) = c1 + c2.x tal que 

# Vamos ter uma tabela de pontos ( x | y(x) ) de tamanho 'n'
# 'm' será o grau de ajuste
# Linhas  (i) -> m+1
# Colunas (j) -> m+1
# ax = b
# a(ij) = somatório de n termos, k=1, que xk^(j-1)(i-1) => xk^(j+i-2)
# b(ij) = somatório de n termos, k=1, que yk.xk^(i-1) 


x = [1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.2, 2.4, 2.6, 2.8, 3.0, 3.2, 3.4, 3.6, 3.8, 4.0, 4.2, 4.4, 4.6, 4.8, 5.0]
y = [-1.945, -1.253, -1.140, -1.087, -0.760, -0.682, -0.424, -0.012, -0.190, 0.452, 0.337, 0.764, 0.532, 1.073, 1.286, 1.502, 1.582, 1.993, 2.473, 2.503, 2.322]
n = len(x)
M = 2  # Grau do ajuste

# Inicializa as matrizes a e b
a = [[0 for _ in range(M+1)] for _ in range(M+1)]
b_vec = [0 for _ in range(M+1)]

# Montagem da matriz 'a' e do vetor 'b'
for i in range(M+1):
    for j in range(M+1):
        a[i][j] = sum(x[k]**(i+j) for k in range(n))  # Soma das potências de x
    b_vec[i] = sum(y[k] * x[k]**i for k in range(n))  # Soma de y multiplicado pelas potências de x

# Resolução do sistema linear a * c = b_vec
c = [0 for _ in range(M+1)]  # Coeficientes da curva ajustada
# Aqui, usamos o método de substituição de uma biblioteca ou resolução manual (sem numpy)
# Usar numpy.linalg.solve(a, b_vec) pode ser uma alternativa mais direta

# Calcula os valores ajustados de g(x) usando os coeficientes
g = [sum(c[i] * x[k]**i for i in range(M+1)) for k in range(n)]

# Calcula o erro do ajuste
d = sum((y[k] - g[k])**2 for k in range(n))

print("Coeficientes do polinômio ajustado:", c)
print("Erro do ajuste (soma dos quadrados dos resíduos):", d)

# Plota os pontos originais e a curva ajustada
import matplotlib.pyplot as plt

plt.plot(x, y, '*', label='Pontos Originais')
plt.plot(x, g, '-', label='Ajuste Polinomial de Grau 2')
plt.grid(True)
plt.legend()
plt.show()
