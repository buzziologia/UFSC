'''
Gauss-Jacobi 
    É um método iterativo: ele começa com uma estimativa inicial para x e refina essa
estimativa a cada iteração até que a solução seja suficientemente precisa.

Condições para o método:
    * A matriz deve ser diagonal dominante 
        - garante a convergencia
        - pode-se trocar as linhas da matriz para que ela se torne diagonal dominante
    (Uma matriz diagonal dominante é uma matriz quadrada em que, para cada linha, o 
    valor absoluto do elemento da diagonal principal é maior que a soma dos valores 
    absolutos dos outros elementos dessa linha.)
'''

a = [[3, -1, -1], 
     [1, 3, 1], 
     [2, -2, 4]]
b = [1, 5, 4]
n = len(b)
erro = 10**-8  
k = 0
x0 = [0, 0, 0]  # Inicializando o chute inicial
x = [0, 0, 0]   # Inicializando a lista para os novos valores de x

d = 1  # d deve ser maior que erro
while d > erro:
    k += 1
    for i in range(n):  # Começando de 0
        soma = 0 
        for j in range(n):  
            if j != i:
                soma += a[i][j] * x0[j]
        x[i] = (b[i] - soma) / a[i][i]
    
    # Calcular a diferença absoluta entre x e x0
    d = sum(abs(x[i] - x0[i]) for i in range(n))
    
    # Atualizar x0 com os novos valores de x
    x0 = x.copy()
    
print(k)
print(x)
print(d)
