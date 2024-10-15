.data
# Declaração de variáveis
A: .word 0
B: .word 0
i: .word 0

.text
.globl main

main:
    # Inicialização das variáveis
    li $t0, 1           # A = 1
    sw $t0, A
    li $t1, 2           # B = 2
    sw $t1, B
    li $t2, 0           # i = 0
    sw $t2, i

loop:
    # for (i = 0; i < 5; i++)
    lw $t2, i           # Carregar valor de 'i' em $t2
    li $t3, 5           # Carregar valor 5 em $t3
    bge $t2, $t3, end_loop  # Se i >= 5, sair do loop

    # A = B + 1
    lw $t1, B           # Carregar valor de 'B' em $t1
    addi $t0, $t1, 1    # A = B + 1
    sw $t0, A           # Armazenar novo valor de 'A'

    # B = B + 3
    addi $t1, $t1, 3    # B = B + 3
    sw $t1, B           # Armazenar novo valor de 'B'

    # i++
    addi $t2, $t2, 1    # Incrementar i
    sw $t2, i           # Armazenar novo valor de 'i'

    j loop              # Voltar para o início do loop

end_loop:
    # Encerrar programa
    li $v0, 10          # Código de serviço para encerrar o programa
    syscall             # Chama o serviço do sistema para encerrar
