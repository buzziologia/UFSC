.data
# Declaração de variáveis
num: .word 0
resultado: .word 0
msg1: .asciiz "Digite um numero: "
msg2: .asciiz "O fatorial de "

.text
.globl main

main:
    # Ler o valor de num
    la $a0, msg1       # Carregar endereço da mensagem 1
    li $v0, 4          # Código de serviço para impressão de string
    syscall            # Chama o serviço do sistema para imprimir a mensagem

    li $v0, 5          # Código de serviço para leitura de inteiro
    syscall            # Chama o serviço do sistema para ler o valor do usuário
    sw $v0, num        # Armazena o valor em 'num'

    # Carregar o valor de num no registrador $a0
    lw $a0, num

    # Chamar a função fatorial
    jal fatorial

    # Armazenar o valor retornado em 'resultado'
    sw $v0, resultado

    # Mostrar o resultado na tela
    la $a0, msg2       # Carregar endereço da mensagem de resultado
    li $v0, 4          # Código de serviço para impressão de string
    syscall            # Chama o serviço do sistema para imprimir a mensagem

    lw $a0, num        # Carregar o valor de 'num' em $a0
    li $v0, 1          # Código de serviço para impressão de inteiro
    syscall            # Chama o serviço do sistema para mostrar o valor

    li $v0, 4          # Código de serviço para impressão de string
    la $a0, resultado_msg
    syscall

    lw $a0, resultado  # Carregar o valor de 'resultado' em $a0
    li $v0, 1          # Código de serviço para impressão de inteiro
    syscall            # Chama o serviço do sistema para mostrar o valor

    # Encerrar o programa
    li $v0, 10         # Código de serviço para encerrar o programa
    syscall            # Chama o serviço do sistema para encerrar

# Função fatorial
fatorial:
    # Salvar o valor de n no stack
    addi $sp, $sp, -4  # Ajusta o ponteiro do stack
    sw $ra, 0($sp)     # Salva o endereço de retorno no stack

    # Verifica se n == 0 ou n == 1
    li $t0, 0          # $t0 = 0
    beq $a0, $t0, base_case # Se $a0 == 0, vai para base_case

    li $t0, 1          # $t0 = 1
    beq $a0, $t0, base_case # Se $a0 == 1, vai para base_case

    # Caso recursivo
    addi $a0, $a0, -1  # $a0 = $a0 - 1
    jal fatorial       # Chama fatorial(n-1)

    # Multiplica n pelo valor de retorno
    lw $t1, 0($sp)     # Recupera o valor de n original
    addi $a0, $a0, 1   # Restaura n original
    mul $v0, $a0, $v0  # $v0 = n * fatorial(n-1)
    jr $ra             # Retorna para o chamador

base_case:
    li $v0, 1          # Retorna 1
    jr $ra             # Retorna para o chamador
