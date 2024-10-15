.data
# Declaração de variáveis
n1: .word 0
n2: .word 0
msg1: .asciiz " \n Digite o valor do primeiro numero: "
msg2: .asciiz " \n Digite o valor do segundo numero: "
msgResult: .asciiz " \n O resultado da soma e: "

.text
.globl main

main:
    # Chamar a função soma
    jal soma

    # Mostrar o resultado na tela
    la $a0, msgResult   # Carregar endereço da mensagem de resultado
    li $v0, 4           # Código de serviço para impressão de string
    syscall

    lw $a0, n1          # Carregar o valor de n1 em $a0
    lw $a1, n2          # Carregar o valor de n2 em $a1
    jal calc_soma       # Chamar a função de cálculo da soma
    move $a0, $v0       # Mover o resultado para $a0
    li $v0, 1           # Código de serviço para impressão de inteiro
    syscall

    # Encerrar o programa
    li $v0, 10          # Código de serviço para encerrar o programa
    syscall

# Função leitura
leitura:
    # Ler o primeiro número
    la $a0, msg1        # Carregar endereço da mensagem 1
    li $v0, 4           # Código de serviço para impressão de string
    syscall

    li $v0, 5           # Código de serviço para leitura de inteiro
    syscall
    sw $v0, n1          # Armazenar o valor lido em n1

    # Ler o segundo número
    la $a0, msg2        # Carregar endereço da mensagem 2
    li $v0, 4           # Código de serviço para impressão de string
    syscall

    li $v0, 5           # Código de serviço para leitura de inteiro
    syscall
    sw $v0, n2          # Armazenar o valor lido em n2

    jr $ra              # Retornar para o chamador

# Função calc_soma
calc_soma:
    lw $t0, n1          # Carregar valor de n1
    lw $t1, n2          # Carregar valor de n2
    add $v0, $t0, $t1   # Calcular soma e armazenar em $v0
    jr $ra              # Retornar para o chamador

# Função soma
soma:
    jal leitura         # Chamar a função leitura
    lw $t0, n1          # Carregar valor de n1
    lw $t1, n2          # Carregar valor de n2
    add $v0, $t0, $t1   # Calcular soma e armazenar em $v0
    jr $ra              # Retornar para o chamador
