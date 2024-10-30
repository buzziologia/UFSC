.data
prompt: .asciiz "Digite um número: "
result_msg: .asciiz "O fatorial é: "
newline: .asciiz "\n"

.text
.globl main

main:
    # Mostrar a mensagem de prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Ler o número do teclado
    li $v0, 5
    syscall
    move $a0, $v0  # $a0 recebe o número a ser passado para a função fatorial

    # Chamar a função fatorial
    jal fatorial

    # Mostrar a mensagem do resultado
    move $s7, $v0
    li $v0, 4
    la $a0, result_msg
    syscall

    # Mostrar o resultado do fatorial (está em $v0)
    move $a0, $s7
    li $v0, 1
    syscall

    # Nova linha
    li $v0, 4
    la $a0, newline
    syscall

    # Terminar o programa
    li $v0, 10
    syscall

# Função fatorial recursiva
fatorial:
    addi $sp, $sp, -8      # Reservar espaço na pilha para variáveis locais
    sw $ra, 4($sp)         # Salvar o endereço de retorno
    sw $a0, 0($sp)         # Salvar o valor de $a0

    # Caso base: se n <= 1, retornar 1
    ble $a0, 1, base_case

    # Passo recursivo
    addi $a0, $a0, -1      # n - 1
    jal fatorial           # Chamar fatorial(n - 1)

    # Recuperar o valor original de n
    lw $a0, 0($sp)

    # Multiplicar n pelo resultado de fatorial(n - 1)
    mul $v0, $a0, $v0

    # Restaurar o valor de $ra e a pilha
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    jr $ra

base_case:
    # Caso base: retornar 1
    li $v0, 1
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    jr $ra
