import math
import matplotlib.pyplot as plt

# Passo 1: Definimos os dados de x e y (eles devem ser positivos para o ajuste exponencial)
x = [1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.2, 2.4, 2.6, 2.8, 3.0, 3.2, 3.4, 3.6, 3.8, 4.0, 4.2, 4.4, 4.6, 4.8, 5.0]
y = [1.945, 1.253, 1.140, 1.087, 0.760, 0.682, 0.424, 0.012, 0.190, -0.452, -0.337, -0.764, -0.532, -1.073, -1.286, -1.502, -1.582, -1.993, -2.473, -2.503, -2.322]

# Verificar se todos os valores de y são positivos (pois não podemos calcular logaritmo de valores negativos)
for yi in y:
    if yi <= 0:
        print("Erro: todos os valores de y precisam ser positivos para o ajuste exponencial.")
        exit()

# Passo 2: Aplicar o logaritmo natural em y para transformar em um problema linear
log_y = [math.log(yi) for yi in y]

# Passo 3: Função para calcular a soma necessária para o ajuste linear
def somas(x, y):
    n = len(x)
    sum_x = sum(x)         # Soma de todos os valores de x
    sum_y = sum(y)         # Soma de todos os valores de y (na verdade log(y))
    sum_x2 = sum([xi**2 for xi in x])  # Soma de x ao quadrado
    sum_xy = sum([xi * yi for xi, yi in zip(x, y)])  # Soma de x * y (na verdade x * log(y))
    return sum_x, sum_y, sum_x2, sum_xy

# Passo 4: Ajuste linear para encontrar os coeficientes b e ln(a)
n = len(x)
sum_x, sum_y, sum_x2, sum_xy = somas(x, log_y)

# Cálculo dos coeficientes da linha ajustada (b e log_a)
b = (n * sum_xy - sum_x * sum_y) / (n * sum_x2 - sum_x ** 2)
log_a = (sum_y - b * sum_x) / n

# Passo 5: Convertemos log_a para a
a = math.exp(log_a)

# Exibir os resultados
print(f"Coeficientes encontrados: a = {a}, b = {b}")

# Passo 6: Gerar a curva ajustada
y_ajustado = [a * math.exp(b * xi) for xi in x]

# Passo 7: Plotar os dados originais e o ajuste
plt.plot(x, y, 'o', label='Dados originais')  # Dados reais
plt.plot(x, y_ajustado, '-', label='Ajuste exponencial')  # Curva ajustada
plt.xlabel('x')
plt.ylabel('y')
plt.title('Ajuste Exponencial')
plt.grid(True)
plt.legend()
plt.show()
