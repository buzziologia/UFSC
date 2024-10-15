.data
# Declaração de variáveis
g: .word 0
h: .word 0
i: .word 0
j: .word 0
f: .word 0

.text
.globl main

# Função principal
main:
    # Ler g
    li $v0, 5          # Código de serviço para leitura de inteiro
    syscall            # Chama o serviço do sistema para ler o valor do usuário
    sw $v0, g          # Armazena o valor em 'g'

    # Ler h
    li $v0, 5          # Código de serviço para leitura de inteiro
    syscall            # Chama o serviço do sistema para ler o valor do usuário
    sw $v0, h          # Armazena o valor em 'h'

    # Ler i
    li $v0, 5          # Código de serviço para leitura de inteiro
    syscall            # Chama o serviço do sistema para ler o valor do usuário
    sw $v0, i          # Armazena o valor em 'i'

    # Ler j
    li $v0, 5          # Código de serviço para leitura de inteiro
    syscall            # Chama o serviço do sistema para ler o valor do usuário
    sw $v0, j          # Armazena o valor em 'j'

    # Chamar a função calcula
    jal calcula

    # Encerrar o programa
    li $v0, 10         # Código de serviço para encerrar o programa
    syscall            # Chama o serviço do sistema para encerrar

# Procedimento calcula
calcula:
    # Carregar os valores de g, h, i, j
    lw $t0, g
    lw $t1, h
    lw $t2, i
    lw $t3, j

    # Calcular f = (g + h) - (i + j)
    add $t4, $t0, $t1  # $t4 = g + h
    add $t5, $t2, $t3  # $t5 = i + j
    sub $t6, $t4, $t5  # $t6 = (g + h) - (i + j)

    # Armazenar o resultado em f
    sw $t6, f

    # Retornar para o chamador
    jr $ra
