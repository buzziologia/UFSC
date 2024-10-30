.data
prompt: .asciiz "Digite um numero: "
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
    move $a0, $v0  # $a0 receberá o número para passar para a função fatorial

    # Chamar a função fatorial
    jal fatorial

    # Mostrar a mensagem do resultado
    li $v0, 4
    la $a0, result_msg
    syscall

    # Mostrar o resultado do fatorial (está em $v0)
    li $v0, 1
    syscall

    # Nova linha
    li $v0, 4
    la $a0, newline
    syscall

    # Terminar o programa
    li $v0, 10
    syscall

# Função fatorial
fatorial:
    addi $sp, $sp, -8  # Espaço na pilha para variáveis locais
    sw $ra, 4($sp)     # Salvar o endereço de retorno
    sw $a0, 0($sp)     # Salvar o valor de $a0

    # Caso base: se n <= 1, retornar 1
    ble $a0, 1, base_case

    # Passo recursivo
    addi $a0, $a0, -1  # n - 1
    jal fatorial       # Chamar fatorial(n - 1)
    lw $a0, 0($sp)     # Recuperar o valor original de n
    mul $v0, $a0, $v0  # n * fatorial(n - 1)
    addi $sp, $sp, 8   # Restaurar a pilha
    jr $ra             # Retornar ao chamador

base_case:
    li $v0, 1          # Retornar 1
    lw $ra, 4($sp)     # Restaurar o endereço de retorno
    addi $sp, $sp, 8   # Restaurar a pilha
    jr $ra             # Retornar ao chamador
