.data
    	v: .space 24  # Espaço para 6 palavras (24 bytes)

.text

main:
    	la $s0, 0x10010020  # Carregar o endereço de início do vetor em $s0
    	li $t1, 0           # Inicializar o índice i com 0

    	li $t2, 1           # Carregar o valor 1 em $t2
    	sw $t2, 0($s0)      # Armazenar o valor em v[i]
    	addi $t1, $t1, 1    # i = i + 1

    	li $t2, 3           # Carregar o valor 3 em $t2
    	sw $t2, 4($s0)      # Armazenar o valor em v[i]
    	addi $t1, $t1, 1    # i = i + 1

    	li $t2, 2           # Carregar o valor 2 em $t2
    	sw $t2, 8($s0)      # Armazenar o valor em v[i]
    	addi $t1, $t1, 1    # i = i + 1

    	li $t2, 1           # Carregar o valor 1 em $t2
    	sw $t2, 12($s0)     # Armazenar o valor em v[i]
    	addi $t1, $t1, 1    # i = i + 1

    	li $t2, 4           # Carregar o valor 4 em $t2
    	sw $t2, 16($s0)     # Armazenar o valor em v[i]
    	addi $t1, $t1, 1    # i = i + 1

    	li $t2, 5           # Carregar o valor 5 em $t2
    	sw $t2, 20($s0)     # Armazenar o valor em v[i]

    	# Encerrar o programa
    	li $v0, 10
    	syscall
