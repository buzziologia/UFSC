''' 
Gauss-Seidel 
    É outro método iterativo para resolver sistemas de equações lineares, e sua 
principal diferença em relação ao Gauss-Jacobi é a forma como as atualizações dos 
valores das variáveis x são feitas a cada iteração. 
    Geralmente converge mais rápido do que Gauss-Jacobi.
    
Condições para o método:
    * A matriz deve ser diagonal dominante 
        - garante a convergencia
        - pode-se trocar as linhas da matriz para que ela se torne diagonal dominante
    (Uma matriz diagonal dominante é uma matriz quadrada em que, para cada linha, o 
    valor absoluto do elemento da diagonal principal é maior que a soma dos valores 
    absolutos dos outros elementos dessa linha.)
'''

a = [[3, -1, -2],
     [1, -4, 1],
     [-2, 1, -3]]
b = [2, 4, -7]
n = len(b)
erro = 10**-6
k = 0
x0 = [0, 0, 0]  # Inicializando o chute inicial
x_old = x0.copy()

d = 1  # d deve ser maior que erro
while d > erro:
    k += 1
    for i in range(n): 
        soma = 0 
        for j in range(n): 
            if j != i:
                soma += a[i][j] * x0[j]
        x0[i] = (b[i] - soma) / a[i][i]
    
    # Calcular a diferença absoluta entre x e x0
    d = sum(abs(x_old[i] - x0[i]) for i in range(n))
    
    # Atualizar x
    x_old = x0.copy()

print("=== Gauss-Seidel ===")
print("Número de interações k é: ",k)
print("Solução do Sistema")
print(x0)
print()
print("Váriável do critério de parada é: ", d)
