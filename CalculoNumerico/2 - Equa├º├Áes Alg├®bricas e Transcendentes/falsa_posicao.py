''' 
Método da Falsa Posição:
    O método da falsa posição (ou método da secante modificada)
é utilizado para encontrar as raízes de uma função contínua.
'''
import numpy as np
import matplotlib.pyplot as plt

# Definir uma função:
def f(x):
    return np.exp(x) * np.sin(x) - 1  # (e^x).sen(x) - 1

def falsa_posicao():
    # Definir um intervalo inicial [a,b], garantindo que haja uma troca de sinais,
    # consequentemente há raízes no intervalo
    a = 0
    b = 1

    # Dividir o intervalo em 10 partes para gerar pontos 
    h = (b-a)/10
    # Criar um vetor de 10 pontos de a até b, de h em h 
    x = np.arange(a, b + h, h) # x = [0, 0.1, 0.2 ...
    y = f(x)

    # Plotar o gráfico da função
    plt.plot(x, y)
    plt.grid(True)
    plt.xlabel('x')
    plt.ylabel('f(x)')
    plt.title('Gráfico da Função')
    plt.show()

    # Calcula os valores de f(a) e f(b)
    fa = f(a)
    fb = f(b)

    erro = 1e-10    
    k = 0           # Contador de iterações
    fxm = 1         # Valor inicial para f(xm), garantindo que o laço seja executado

    while abs(fxm) > erro:
        k += 1

        # Cálculo da posição da raiz aproximada (xm) usando a fórmula da falsa posição
        xm = a - ((fa * (b - a)) / (fb - fa))
        fxm = f(xm)  

         # Verifica se a raiz está no intervalo [a, xm] ou [xm, b]
        if fa * fxm < 0:  # Se f(a) e f(xm) têm sinais opostos, a raiz está entre a e xm
            b = xm  # Atualiza o limite superior para xm
            fb = fxm  
        else:  # Caso contrário, a raiz está entre xm e b
            a = xm  # Atualiza o limite inferior para xm
            fa = fxm  

    print(f'Iterações: {k}')  
    print(f'Raiz aproximada: {xm}')  
    print(f'f(xm): {fxm}')

falsa_posicao()