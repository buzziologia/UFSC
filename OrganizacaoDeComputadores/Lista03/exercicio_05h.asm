.data
# Declaração de variáveis
A: .word 0
B: .word 0
C: .word 0

.text
.globl main

main:
    # Inicialização das variáveis
    li $v0, 5           # Código de serviço para leitura de inteiro
    syscall             # Chama o serviço do sistema para ler o valor do usuário
    sw $v0, A           # Armazena o valor em 'A'

    li $v0, 5           # Código de serviço para leitura de inteiro
    syscall             # Chama o serviço do sistema para ler o valor do usuário
    sw $v0, C           # Armazena o valor em 'C'

    # Carregar valores A e C nos registradores
    lw $t0, A           # Carregar valor de 'A' em $t0
    lw $t2, C           # Carregar valor de 'C' em $t2

    # switch(A)
    li $t1, 1
    beq $t0, $t1, case_1  # Se A == 1, pular para case_1
    li $t1, 2
    beq $t0, $t1, case_2  # Se A == 2, pular para case_2
    j default_case         # Caso contrário, pular para default_case

case_1:
    # B = C + 1
    addi $t1, $t2, 1     # $t1 = C + 1
    sw $t1, B            # Armazenar valor em 'B'
    j end_switch         # Pular para o fim do switch

case_2:
    # B = C + 2
    addi $t1, $t2, 2     # $t1 = C + 2
    sw $t1, B            # Armazenar valor em 'B'
    j end_switch         # Pular para o fim do switch

default_case:
    # B = C
    sw $t2, B            # Armazenar valor de 'C' em 'B'

end_switch:
    # Encerrar programa
    li $v0, 10           # Código de serviço para encerrar o programa
    syscall              # Chama o serviço do sistema para encerrar
