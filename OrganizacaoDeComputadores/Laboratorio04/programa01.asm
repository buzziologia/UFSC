.data
matriz: .space 1024
I: .word 0
J: .word 0
endereco: .word 0
num: .word 0
newline: .asciiz "\n"

.text
main:
    # --- Inicialização ---
    la $s0, matriz        # Carrega o endereço da matriz
    li $t4, 4             # Tamanho de uma word (4 bytes)
    li $t3, 0             # Inicializa o número a ser armazenado

    # --- Loop de Linhas ---
    li $t0, 0             # Inicializa I (linha) com 0
    j loop_linha

loop_linha:
    li $t1, 0             # Inicializa J (coluna) com 0
    bge $t0, 16, printar_matriz # Se I >= 15, termina a montagem da matriz
    j loop_coluna

loop_coluna:
    bge $t1, 16, fim_linha # Se J >= 15, volta para loop_linha
    mul $t2, $t0, 15       # t2 = I * 15 (total de colunas)
    add $t2, $t2, $t1      # t2 = t2 + J (endereço linear)
    mul $t2, $t2, $t4      # t2 = t2 * 4 (tamanho de uma word)
    sw $t3, 0($s0)         # Armazena o número atual na matriz
    addi $s0, $s0, 4       # Avança para o próximo endereço na matriz
    addi $t1, $t1, 1       # Incrementa J (coluna)
    addi $t3, $t3, 1       # Incrementa o número atual
    j loop_coluna

fim_linha:
    addi $t0, $t0, 1       # Incrementa I (linha)
    j loop_linha

printar_matriz:
    la $s0, matriz         # Reinicia o endereço da matriz
    li $t0, 0              # Inicializa I (linha) com 0
    j printar_linha

printar_linha:
    li $t1, 0              # Inicializa J (coluna) com 0
    bge $t0, 16, encerrar_programa # Se I >= 15, termina o programa
    j printar_coluna

printar_coluna:
    bge $t1, 16, nova_linha # Se J >= 15, vai para nova_linha
    lw $a0, 0($s0)         # Carrega o valor da matriz para $a0
    li $v0, 1              # Código para imprimir inteiro
    syscall                # Imprime o valor
    addi $s0, $s0, 4       # Avança para o próximo endereço na matriz
    addi $t1, $t1, 1       # Incrementa J (coluna)
    j printar_coluna

nova_linha:
    la $a0, newline        # Carrega a nova linha
    li $v0, 4              # Código para imprimir string
    syscall                # Imprime a nova linha
    addi $t0, $t0, 1       # Incrementa I (linha)
    j printar_linha

encerrar_programa:
    li $v0, 10             # Código para encerrar o programa
    syscall                # Executa a syscall para sair
