import time

# Constantes para as bebidas
CAFE_PURO = 1
CAFE_COM_LEITE = 2
MOCHACCINO = 3

# Constantes para os tamanhos
PEQUENO = 'p'
GRANDE = 'g'

# Contêineres de ingredientes
cafe = 20
leite = 20
chocolate = 20
acucar = 20

# Função para solicitar a escolha da bebida
def escolher_bebida():
    print("Escolha a bebida:")
    print("1 - Café Puro")
    print("2 - Café com Leite")
    print("3 - Mochaccino")
    escolha = int(input())
    return escolha

# Função para solicitar o tamanho do copo
def escolher_tamanho():
    print("Escolha o tamanho da bebida:")
    print("g - copo grande")
    print("p - copo pequeno")
    tamanho = input().strip()
    return tamanho

# Função para verificar se quer açúcar
def quer_acucar():
    print("Deseja açúcar? (s - sim, n - não)")
    acucar = input().strip().lower()
    return acucar == 's'

# Função para preparar a bebida
def preparar_bebida(bebida, tamanho, acucar):
    global cafe, leite, chocolate

    doses_cafe = 0
    doses_leite = 0
    doses_chocolate = 0

    if bebida == CAFE_PURO:
        doses_cafe = 1
    elif bebida == CAFE_COM_LEITE:
        doses_cafe = 1
        doses_leite = 1
    elif bebida == MOCHACCINO:
        doses_cafe = 1
        doses_leite = 1
        doses_chocolate = 1

    if tamanho == GRANDE:
        doses_cafe *= 2
        doses_leite *= 2
        doses_chocolate *= 2

    # Verificar quantidade suficiente de ingredientes
    if cafe < doses_cafe:
        print("Contêiner de café precisa ser reabastecido.")
        return
    if leite < doses_leite:
        print("Contêiner de leite precisa ser reabastecido.")
        return
    if chocolate < doses_chocolate:
        print("Contêiner de chocolate precisa ser reabastecido.")
        return
    if acucar and acucar > acucar:
        print("Contêiner de açúcar precisa ser reabastecido.")
        return

    # Preparar bebida
    print("Preparando a bebida...")
    for _ in range(doses_cafe):
        time.sleep(1)
        cafe -= 1
    for _ in range(doses_leite):
        time.sleep(1)
        leite -= 1
    for _ in range(doses_chocolate):
        time.sleep(1)
        chocolate -= 1
    if acucar:
        time.sleep(1)
        acucar -= 1

    if tamanho == PEQUENO:
        time.sleep(5)
    else:
        time.sleep(10)
    
    gerar_cupom_fiscal(bebida, tamanho, acucar)

# Função para gerar cupom fiscal
def gerar_cupom_fiscal(bebida, tamanho, acucar):
    bebida_nome = ""
    preco = 0

    if bebida == CAFE_PURO:
        bebida_nome = "Café Puro"
        preco = 5
    elif bebida == CAFE_COM_LEITE:
        bebida_nome = "Café com Leite"
        preco = 7
    elif bebida == MOCHACCINO:
        bebida_nome = "Mochaccino"
        preco = 10

    if tamanho == GRANDE:
        preco *= 2

    if acucar:
        bebida_nome += " com Açúcar"

    with open("cupom_fiscal.txt", "w") as arquivo:
        arquivo.write(f"Bebida: {bebida_nome}\n")
        arquivo.write(f"Tamanho: {'Grande' if tamanho == GRANDE else 'Pequeno'}\n")
        arquivo.write(f"Preço: R${preco}\n")

    print("Cupom fiscal gerado.")

# Loop principal do programa
def main():
    while True:
        bebida = escolher_bebida()
        tamanho = escolher_tamanho()
        acucar = quer_acucar()
        preparar_bebida(bebida, tamanho, acucar)
        print("Deseja preparar outra bebida? (s - sim, n - não)")
        continuar = input().strip().lower()
        if continuar != 's':
            break

if __name__ == "__main__":
    main()
