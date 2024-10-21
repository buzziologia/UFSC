.data
matriz: .space 1024  # Espaço reservado para a matriz
I: .word 0          # Índice da linha
J: .word 0          # Índice da coluna
endereco: .word 0   # Endereço atual na matriz
num: .word 0        # Número atual
.text
main:
    # --- Carregar Variáveis ---
    la $s0, matriz      # Carrega o endereço base da matriz em $s0
    lw $t0, I           # Carrega o índice de linha em $t0
    lw $t1, J           # Carrega o índice de coluna em $t1
    lw $t2, endereco    # Carrega o endereço atual em $t2
    lw $t3, num         # Carrega o número atual em $t3
    li $t4, 4           # Define o tamanho de uma word (4 bytes)

    # --- Pular para o Loop I ---
    j loop_linha

loop_linha:
    li $t1, 0           # Inicializa o índice de coluna
    addi $t0, $t0, 1    # Incrementa o índice de linha
    bge $t0, 15, printar_matriz  # Se o índice de linha >= 15, pular para printar_matriz
    j loop_coluna       # Pular para o loop de colunas

loop_coluna:
    bge $t1, 15, loop_linha  # Se o índice de coluna >= 15, pular para loop_linha
    li $t2, 0           # Inicializa o endereço para cálculo
    mul $t2, $t0, $t1   # Calcula o endereço como linha * coluna
    mul $t2, $t2, $t4   # Multiplica pelo tamanho de uma word
    sw $t3, 0($s0)      # Armazena o número na posição calculada da matriz
    addi $s0, $s0, 4    # Avança o ponteiro da matriz para a próxima posição
    addi $t1, $t1, 1    # Incrementa o índice de coluna
    addi $t3, $t3, 1    # Incrementa o número atual
    j loop_coluna       # Retorna para o loop de colunas

printar_matriz:
    la $a0, matriz      # Carrega o endereço base da matriz
    li $v0, 4           # Código de serviço para impressão de string
    syscall

encerrar_programa:
    li $v0, 10          # Código de serviço para encerrar o programa
    syscall
