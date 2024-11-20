import time
from tkinter.constants import FALSE

######################################################

# Opçoes para as bebidas
CAFE_PURO = 1
CAFE_COM_LEITE = 2
MOCHACCINO = 3

# Opcoes para os tamanhos
PEQUENO = 'A'
GRANDE = 'B'

# Quantidade de ingredientes
cafe = 20
leite = 20
chocolate = 20
acucar = 20

######################################################

def escolhe_bebida():
    print("Escolha sua bebida:")
    print("1 - Café Puro")
    print("2 - Café com Leite")
    print("3 - Mochaccino")

    #digital lab sim
    bebida = int(input())
    return bebida #($t0)

def escolhe_tamanho():
    print("Escolha sua tamanho:")
    print("A - Tamanho Pequeno")
    print("B - Tamanho Grande")
    tamanho = int(input())
    return tamanho #($t1)

def escolhe_acucar():
    print("Escolha seu acucar:")
    print("1 - Com acucar")
    print("0 - Sem acucar")
    acucar = int(input()) #($t2)
    return acucar

def disponibilidade(bebida, tamanho, acucar):
    if bebida == 1:
        if cafe - tamanho >= 0:
            if acucar == 1:
                if acucar - tamanho >= 0:
                    return True
            else:
                return True
        else:
            repositor(cafe)
            return False

    elif bebida == 2:
        if cafe - tamanho >= 0:
            if leite - tamanho >=0:
                if acucar == 1:
                    if acucar - tamanho >= 0:
                        return True
                    else:
                        repositor(acucar)
                        return False
                return True
            else:
                repositor(leite)
                return False
        else:
            repositor(cafe)
            return False

    elif bebida == 3:
        if cafe - tamanho >= 0:
            if leite - tamanho >=0:
                if chocolate - tamanho >= 0:
                    if acucar == 1:
                        if acucar - tamanho >= 0:
                            return True
                    else:
                        return False
                else:
                    return False
            else:
                return False
        else:
            return False

def prepara_bebida(bebida, tamanho, acucar):
    if acucar == 1:
        acucar -= tamanho

    if bebida == 1:
        cafe -= tamanho


def repositor(ingrediente):
    pass

def nota_fiscal():
    pass

# Loop principal do programa
def main():
    while True:
        print("==== Coffe Break ====")
        bebida = escolhe_bebida()
        tamanho = escolhe_tamanho()
        acucar = escolhe_acucar()
        disponibilidade = disponibilidade()


        if disponibilidade /= True:
            prepara_bebida = (bebida, tamanho, acucar)
        else:
            repositor()
        if jump == True:

        print("Deseja preparar outra bebida? (s - sim, n - não)")
        continuar = input().strip().lower()
        if continuar != 's':
            break

if __name__ == "__main__":
    main()
