import matplotlib.pyplot as plt

# Dados de exemplo
x = [1, 2, 3, 4, 5]
y = [2, 4, 6, 8, 10]

# Criar o gráfico de linha
plt.plot(x, y, marker='o')

# Adicionar título e rótulos aos eixos
plt.title('TITULO')
plt.xlabel('Eixo X')
plt.ylabel('Eixo Y')

# Exibir o gráfico
plt.show()
